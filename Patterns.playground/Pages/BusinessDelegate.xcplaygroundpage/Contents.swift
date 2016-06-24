protocol BusinessService {
    func doProcessing()
}

class EJBService: BusinessService {
    func doProcessing() {
        print("Processing task by invoking EJB Service")
    }
}

class JMSService: BusinessService {
    func doProcessing() {
        print("Processing task by invoking JMS Service")
    }
}

class BusinessLookup {
    func getBusinessService(serviceType: String) -> BusinessService {
        if serviceType == "EJB" {
            return EJBService()
        } else {
            return JMSService()
        }
    }
}

class BusinessDelegate {
    
    let lookupService: BusinessLookup = BusinessLookup()
    var businessService: BusinessService!
    var serviceType: String!
    
    func doTask() {
        businessService = lookupService.getBusinessService(serviceType)
        businessService.doProcessing()
    }
}

class Client {
    
    var businessService: BusinessDelegate!
    
    init(businessService: BusinessDelegate) {
        self.businessService = businessService
    }
    
    func doTask() {
        businessService.doTask()
    }
}

//DEMO

let bDelegate = BusinessDelegate()
bDelegate.serviceType = "EJB"

let client = Client(businessService: bDelegate)
client.doTask()

bDelegate.serviceType = "JMS"
client.doTask()