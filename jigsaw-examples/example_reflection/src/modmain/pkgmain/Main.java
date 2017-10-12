package pkgmain;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import pkgb.B;
import pkgb1.B1;

public class Main {
    public static void main(String[] args) throws NoSuchMethodException, SecurityException,
    IllegalAccessException, IllegalArgumentException, 
    InvocationTargetException, ClassNotFoundException, InstantiationException
    {
        Main mymain = new Main();		

        Method m;

        // ----------------------------------------------------------------------------------------------------

// B is visible outside modb and open to Deep Reflection
        B myb = new B();

// public method: normal call possible
        System.out.println("Main: " + mymain.toString() + ", B: " + myb.doIt("direct call 1"));

// public method: call via reflection possible
        m = myb.getClass().getMethod("doIt", String.class);
        System.out.println("Main: " + mymain.toString() + ", B: " + m.invoke(myb, "call via reflection 2"));

// private method: call via reflection possible (even though B.doItPrivate() is private)
        m = myb.getClass().getDeclaredMethod("doItPrivate", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", B: " + m.invoke(myb, "call via reflection 3"));

// private static method: call via reflection possible  (even though B.doItPrivateStatic() is private)
        m = myb.getClass().getDeclaredMethod("doItPrivateStatic", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", B: " + m.invoke(myb, "call via reflection 4"));


// ----------------------------------------------------------------------------------------------------

// B is visible outside modb, but not open

        B1 myb1 = new B1();

// public method: normal call possible
        System.out.println("Main: " + mymain.toString() + ", B1: " + myb1.doIt("direct call 5"));

// public method: call via reflection possible
        m = myb1.getClass().getMethod("doIt", String.class);
        System.out.println("Main: " + mymain.toString() + ", B1: " + m.invoke(myb1, "call via reflection 6"));

// private method: call via reflection not possible
// compiles but does not run because pkgb1 is not open to modmain:
//      Unable to make private java.lang.String pkgb1.B1.doItPrivate(java.lang.String) accessible: 
//      module modb does not "opens pkgb1" to module modmain
        m = myb1.getClass().getDeclaredMethod("doItPrivate", String.class);
        // m.setAccessible(true);
        // System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myb1, "call via reflection 7"));
        
// ----------------------------------------------------------------------------------------------------

// InternalB is *not* visible outside modb, so we need to create an instance via reflection first
// access not possible if package pkgbinternal is not exported in modb (at least dynamic)
        Class<?> myinternalBClass = Class.forName("pkgbinternal.InternalB");
        Constructor<?> con = myinternalBClass.getDeclaredConstructor();
        con.setAccessible(true);
        Object myinternalB = con.newInstance();

// public method: normal call - not possible as not even visible, i.e. does not compile
        // System.out.println("Main: " + mymain.toString() + ", InternalB: " + myinternalB.doIt("direct call 8"));

// public method: call via reflection not possible
        m = myinternalB.getClass().getMethod("doIt", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myinternalB, "call via reflection 9"));

// private method: call via reflection not possible
        m = myinternalB.getClass().getDeclaredMethod("doItPrivate", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myinternalB, "call via reflection 10"));

// private static method: call via reflection not possible
        m = myinternalB.getClass().getDeclaredMethod("doItPrivateStatic", String.class);
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myinternalB, "call via reflection 11"));
    }
}
