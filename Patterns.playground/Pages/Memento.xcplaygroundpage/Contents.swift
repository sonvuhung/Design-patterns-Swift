class Memento {
    
    var state: String!
    
    init(_ state: String) {
        self.state = state
    }
}

class Originator {
    
    var state: String!
    
    func saveStateToMemento() -> Memento {
        return Memento(state)
    }
    
    func getStateFromMemento(mem: Memento) {
        state = mem.state
    }
}

class CareTaker {
    
    var mementoList = [Memento]()
    
    func add(state: Memento) {
        mementoList.append(state)
    }
    
    func get(index: Int) -> Memento {
        return mementoList[index]
    }
}

//DEMO

let origin = Originator()
let taker = CareTaker()

origin.state = "State #1"
origin.state = "State #2"
taker.add(origin.saveStateToMemento())
origin.state = "State #3"
taker.add(origin.saveStateToMemento())
origin.state = "State #4"

print("Current State: \(origin.state)")
origin.getStateFromMemento(taker.get(0))
print("First saved State: \(origin.state)")
origin.getStateFromMemento(taker.get(1))
print("Second saved State: \(origin.state)")