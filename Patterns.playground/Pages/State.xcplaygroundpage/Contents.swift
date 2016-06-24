protocol State {
    func doAction(context: Context)
}

class StartState: State {
    
    func doAction(context: Context) {
        print("Player is in start state")
        context.state = self
    }
}

class StopState: State {
    
    func doAction(context: Context) {
        print("Player is in stop state")
        context.state = self
    }
}

class Context {
    var state: State? = nil
}

//DEMO

let context = Context()

let startState = StartState()
startState.doAction(context)
print("current state of context is : \(context.state)")

let stopState = StopState()
stopState.doAction(context)
print("current state of context is : \(context.state)")