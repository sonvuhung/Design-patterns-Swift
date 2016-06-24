protocol Filter {
    func execute(request: String)
}

class AuthenticationFilter: Filter {
    func execute(request: String) {
        print("Authenticating request: \(request)")
    }
}

class DebugFilter: Filter {
    func execute(request: String) {
        print("request log: \(request)")
    }
}

class Target {
    func execute(request: String) {
        print("Executing request: \(request)")
    }
}

class FilterChain {
    var filters = [Filter]()
    var taret: Target!
    
    func addFilter(filter: Filter) {
        self.filters.append(filter)
    }
    
    func execute(request: String) {
        for filter in filters {
            filter.execute(request)
        }
        taret.execute(request)
    }
}

class FilterManager {
    let filterChain = FilterChain()
    
    init(target: Target) {
        filterChain.taret = target
    }
    
    func addFilter(filter: Filter) {
        filterChain.addFilter(filter)
    }
    
    func request(request: String) {
        filterChain.execute(request)
    }
}

class Client {
    var filterManager: FilterManager!
    
    func sendRequest(request: String) {
        filterManager.request(request)
    }
}

//DEMO

let fManager = FilterManager(target: Target())
fManager.addFilter(AuthenticationFilter())
fManager.addFilter(DebugFilter())

let client = Client()
client.filterManager = fManager
client.sendRequest("HOME")