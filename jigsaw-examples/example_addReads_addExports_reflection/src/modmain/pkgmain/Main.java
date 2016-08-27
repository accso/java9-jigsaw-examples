package pkgmain;

import java.lang.reflect.Constructor;
import java.lang.reflect.Layer;
import java.lang.reflect.Method;
import java.lang.reflect.Module;
import java.util.Optional;

import pkgb.BHelper;

public class Main {
    public static void main(String[] args) throws Exception {
        Main mymain = new Main();
        Module modmain = Main.class.getModule();

        // find module modb
        Optional<Module> optMod = Layer.boot().findModule("modb");
        if (optMod.orElseGet(null) == null) {
            throw new RuntimeException("Main: Could not find modb");
        }
        Module modb = optMod.get();

        // addReads modmain=modb
        //    note that this is caller-sensitive, needs to be done in modmain, i.e. here
        System.out.println("Main: add reads of " + modmain.getName() + " to " + modb.getName());
        modmain.addReads(modb);
        
        // addExports modb/pkgb=modmain
        //    note that this is caller-sensitive, needs to be done in modb
        BHelper.addExports("pkgbinternal", modmain);

        // get an instance of pkgb.B and call its doIt() method
        Class<?> myinternalBClass = Class.forName("pkgbinternal.InternalB");
        Constructor<?> con = myinternalBClass.getDeclaredConstructor();
        con.setAccessible(true);
        Object myInternalB = con.newInstance();

        Method m = myInternalB.getClass().getMethod("doIt");
        m.setAccessible(true);
        System.out.println("Main: " + mymain.toString() + ", InternalB: " + m.invoke(myInternalB));
    }
}
