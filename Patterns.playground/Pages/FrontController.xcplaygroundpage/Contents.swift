class HomeView {
    func show() {
        print("Displaying Home Page")
    }
}

class StudentView {
    func show() {
        print("Displaying Student Page")
    }
}

class Dispatcher {
    let sView = StudentView()
    let hView = HomeView()
    
    func dispatch(request: String) {
        if request == "student" {
            sView.show()
        } else {
            hView.show()
        }
    }
}

class FrontController {
    let dispatcher = Dispatcher()
    
    func isAuthenticUser() -> Bool {
        print("User is authenticated successfully.")
        return true
    }
    
    func trackRequest(request: String) {
        print("Page requested: \(request)")
    }
    
    func dispatchRequest(request: String) {
        trackRequest(request)
        if isAuthenticUser() {
            dispatcher.dispatch(request)
        }
    }
}

//DEMO

let frtCtl = FrontController()
frtCtl.dispatchRequest("home")
print()
frtCtl.dispatchRequest("student")