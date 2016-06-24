import Foundation
protocol Expression {
    func interpret(context: String) -> Bool
}

class TerminalExpression: Expression {
    var data:String!
    
    init(_ data: String) {
        self.data = data
    }
    func interpret(context: String) -> Bool {
        if context.containsString(context) {
            return true
        }else {
            return false
        }
    }
}

class OrExpression: Expression {
    var expr1: Expression? = nil
    var expr2: Expression? = nil
    var data:String!
    
    init(_ expr1: Expression?,_ expr2: Expression?) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpret(context: String) -> Bool {
        return (expr1 != nil && expr1!.interpret(context)) || (expr2 != nil && expr2!.interpret(context))
    }
}

class AndExpression: Expression {
    var expr1: Expression? = nil
    var expr2: Expression? = nil
    var data:String!
    
    init(_ expr1: Expression?,_ expr2: Expression?) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpret(context: String) -> Bool {
        return (expr1 != nil && expr1!.interpret(context)) && (expr2 != nil && expr2!.interpret(context))
    }
}

func getMaleExpression() -> Expression {
    let robert = TerminalExpression("Robert")
    let john = TerminalExpression("John")
    return OrExpression(robert,john)
}
func getMarriedWomanExpression() -> Expression {
    let julie = TerminalExpression("Julie")
    let married = TerminalExpression("Married")
    return OrExpression(julie,married)
}

//DEMO 

let isMale = getMaleExpression()
let isMarriedWoman = getMarriedWomanExpression()
print("John is male? \(isMale.interpret("John"))")
print("Julie is a married women? \(isMarriedWoman.interpret("Julie"))")
