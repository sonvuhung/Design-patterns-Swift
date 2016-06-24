protocol Strategy {
    func doOperation(num1: Int,_ num2: Int) -> Int
}

class OperationAdd: Strategy {
    func doOperation(num1: Int,_ num2: Int) -> Int {
        return num1 + num2
    }
}

class OperationSubstract: Strategy {
    func doOperation(num1: Int,_ num2: Int) -> Int {
        return num1 - num2
    }
}

class OperationMultiply: Strategy {
    func doOperation(num1: Int,_ num2: Int) -> Int {
        return num1 * num2
    }
}

class Context {
    
    var stragety: Strategy!
    
    init(stragety: Strategy) {
        self.stragety = stragety
    }
    
    func executeStragety(num1: Int,_ num2: Int) -> Int {
        return stragety.doOperation(num1, num2)
    }
}

//DEMO

var context = Context(stragety: OperationAdd())
print("10 + 5 = \(context.executeStragety(10, 5))")

context = Context(stragety: OperationSubstract())
print("10 - 5 = \(context.executeStragety(10, 5))")

context = Context(stragety: OperationMultiply())
print("10 * 5 = \(context.executeStragety(10, 5))")