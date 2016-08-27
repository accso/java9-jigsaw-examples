module modserviceimplementation2 {
    requires modservicedefinition;
    provides myservice.IService with net.service.impl.ServiceImpl;
}
