package pkgb;

import pkgbinternal.*;

public class DataFactory {
    public Data createData() {     
        return new Data();                              // returns data which is exported in Module modb
    }

    public Data createInternalData1() {
        return new InternalData();                      // returns data which is not exported from Module modb
    }

// this *does* compile though the method returns data which is not visible outside of modb
    public InternalData createInternalData2() {
        return new InternalData();                      // returns data which is not exported from Module modb
    }
}
