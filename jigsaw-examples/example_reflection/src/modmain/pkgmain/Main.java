package pkgmain;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import pkgb.B;

public class Main {
    public static void main(String[] args) throws NoSuchMethodException, SecurityException,
    IllegalAccessException, IllegalArgumentException, 
    InvocationTargetException, ClassNotFoundException, InstantiationException
    {
        Main mymain = new Main();		

        Method m;

        // ----------------------------------------------------------------------------------------------------

// B is visible outside modb
        B myb = new B();

// public method: normal call possible
        System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt("direct call"));

// public method: call via reflection possible
        m = myb.getClass().getMethod("doIt", String.class);
        System.out.println("Main: " + mymain.toString() + ", B: " + m.invoke(myb, "call via reflection"));

// private method: call via reflection possible (even though B.doItPrivate() is private)
        m = myb.getClass().getDeclaredMethod("doItPrivate", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", B: " + m.invoke(myb, "call via reflection"));

// private static method: call via reflection possible  (even though B.doItPrivateStatic() is private)
        m = myb.getClass().getDeclaredMethod("doItPrivateStatic", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", B: " + m.invoke(myb, "call via reflection"));


        // ----------------------------------------------------------------------------------------------------

// InternalB is *not* visible outside modb, so we need to create an instance via reflection first

// access not possible if package pkgbinternal is not exported in modb (at least dynamic)
        Class<?> myinternalBClass = Class.forName("pkgbinternal.InternalB");
        Constructor<?> con = myinternalBClass.getDeclaredConstructor();
        con.setAccessible(true);
        Object myinternalB = con.newInstance();

// public method: normal call - not possible as not even visible
        // System.out.println("Main: " + mymain.toString() + ", InternalB: " + myinternalB.doIt("direct call"));

// public method: call via reflection not possible
        m = myinternalB.getClass().getMethod("doIt", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myinternalB, "call via reflection"));

// private method: call via reflection not possible
        m = myinternalB.getClass().getDeclaredMethod("doItPrivate", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myinternalB, "call via reflection"));

// private static method: call via reflection not possible
        m = myinternalB.getClass().getDeclaredMethod("doItPrivateStatic", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myinternalB, "call via reflection"));
    }
}
