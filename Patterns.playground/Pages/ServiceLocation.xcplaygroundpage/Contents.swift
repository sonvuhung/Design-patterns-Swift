protocol Service {
    func getName() -> String
    func execute()
}

class Service1: Service {
    func getName() -> String {
        return "Service 1"
    }
    
    func execute() {
        print("Excuting service 1")
    }
}

class Service2: Service {
    func getName() -> String {
        return "Service 2"
    }
    
    func execute() {
        print("Excuting service 2")
    }
}

class InitialContext {
    func lookup(jndiName: String) -> AnyObject? {
        if jndiName == "Service 1" {
            print("Looking up and creating a new Service 1 object")
            return Service1()
        } else if jndiName == "Service 2" {
            print("Looking up and creating a new Service 2 object")
            return Service2()
        } else {
            return nil
        }
    }
}

class Cache {
    var services = [Service]()
    
    func getService(serviceName: String) -> Service? {
        for sv in services {
            if sv.getName() == serviceName {
                print("Returning cached \(serviceName) object")
                return sv
            }
        }
        return nil
    }
    
    func addService(newService: Service) {
        var existed = false
        for sv in services {
            if sv.getName() == newService.getName() {
                existed = true
                break
            }
        }
        if existed == false {
            services.append(newService)
        }
    }
}

class ServiceLocator {
    static var cache = Cache()
    
    static func getService(jndiName: String) -> Service? {
        let service = cache.getService(jndiName)
        
        if service != nil {
            return service
        } else {
            let context = InitialContext()
            let sv1 : Service? = context.lookup(jndiName) as? Service
            if sv1 != nil {
                cache.addService(sv1!)
            }
            return sv1
        }
    }
}

//DEMO

var sv = ServiceLocator.getService("Service 1")
sv?.execute()
sv = ServiceLocator.getService("Service 2")
sv?.execute()
sv = ServiceLocator.getService("Service 1")
sv?.execute()
sv = ServiceLocator.getService("Service 2")
sv?.execute()