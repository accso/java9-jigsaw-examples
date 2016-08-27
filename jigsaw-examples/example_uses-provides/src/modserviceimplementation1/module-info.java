module modserviceimplementation1 {
    requires modservicedefinition;
    provides myservice.IService with com.service.impl.ServiceImpl;
}
