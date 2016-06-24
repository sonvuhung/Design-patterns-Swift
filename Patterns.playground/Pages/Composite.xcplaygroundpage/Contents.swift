protocol Equipment {
    func getResistance() -> Double
    func getName() -> String
}

class Fan: Equipment {
    private static let FAN_RESISTANCE : Double = 20
    private static let FAN_NAME : String = "The Fan"
    
    func getResistance() -> Double {
        return Fan.FAN_RESISTANCE
    }
    
    func getName() -> String {
        return Fan.FAN_NAME
    }
}

class Light: Equipment {
    private static let LIGHT_RESISTANCE : Double = 10
    private static let LIGHT_NAME : String = "The Fan"
    
    func getResistance() -> Double {
        return Light.LIGHT_RESISTANCE
    }
    
    func getName() -> String {
        return Light.LIGHT_NAME
    }
}

class Circuit {
    var equipments = [Equipment]()
    
    func addEquipment(equipment: Equipment) {
        self.equipments.append(equipment)
    }
}

class ParallelCircuit: Circuit, Equipment {
    private static let CIRCUIT_NAME = "Parallel Circuit"
    
    func getResistance() -> Double {
        var temp : Double = 0
        for e in self.equipments {
            temp += 1.0 / e.getResistance()
        }
        return 1.0 / temp
    }
    
    func getName() -> String {
        return ParallelCircuit.CIRCUIT_NAME
    }
}

class SerialCircuit: Circuit, Equipment {
    private static let CIRCUIT_NAME = "Serial Circuit"
    
    func getResistance() -> Double {
        var temp : Double = 0
        for e in self.equipments {
            temp += e.getResistance()
        }
        return temp
    }
    
    func getName() -> String {
        return SerialCircuit.CIRCUIT_NAME
    }
}

//DEMO

let grandChildCircuit = SerialCircuit()
grandChildCircuit.addEquipment(Light())
grandChildCircuit.addEquipment(Fan())

let childCircuit = ParallelCircuit()
childCircuit.addEquipment(Fan())
childCircuit.addEquipment(Fan())
childCircuit.addEquipment(grandChildCircuit)

let rootCircuit = SerialCircuit()
rootCircuit.addEquipment(Light())
rootCircuit.addEquipment(childCircuit)

print("Total resistance = \(rootCircuit.getResistance())")