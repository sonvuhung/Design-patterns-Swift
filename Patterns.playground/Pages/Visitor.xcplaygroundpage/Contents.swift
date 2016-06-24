protocol ComputerPart {
    func accept(cpVisitor: ComputerPartVisitor)
}

class Keyboard: ComputerPart {
    func accept(cpVisitor: ComputerPartVisitor) {
        cpVisitor.visit(self)
    }
}

class Monitor: ComputerPart {
    func accept(cpVisitor: ComputerPartVisitor) {
        cpVisitor.visit(self)
    }
}

class Mouse: ComputerPart {
    func accept(cpVisitor: ComputerPartVisitor) {
        cpVisitor.visit(self)
    }
}

class Computer: ComputerPart {
    
    var computerParts: [ComputerPart] = [Mouse(), Keyboard(), Monitor()]
    
    func accept(cpVisitor: ComputerPartVisitor) {
        for part in computerParts {
            part.accept(cpVisitor)
        }
        cpVisitor.visit(self)
    }
}

protocol ComputerPartVisitor {
    func visit(computer: Computer)
    func visit(mouse: Mouse)
    func visit(keyboard: Keyboard)
    func visit(monitor: Monitor)
}

class ComputerPartDisplayVisistor: ComputerPartVisitor {
    
    func visit(computer: Computer) {
        print("Displaying Computer")
    }
    
    func visit(mouse: Mouse) {
        print("Displaying Mouse")
    }
    
    func visit(monitor: Monitor) {
        print("Displaying Monitor")
    }
    
    func visit(keyboard: Keyboard) {
        print("Displaying Keyboard")
    }
}

//DEMO

let computer: ComputerPart = Computer()
computer.accept(ComputerPartDisplayVisistor())