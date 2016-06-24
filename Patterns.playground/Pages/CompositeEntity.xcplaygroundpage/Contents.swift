class DependentObject1 {
    var data: String!
}

class DependentObject2 {
    var data: String!
}

class CoareGrainedObject {
    
    let do1 = DependentObject1()
    let do2 = DependentObject2()
    
    func setData(data1: String,_ data2: String) {
        do1.data = data1
        do2.data = data2
    }
    
    func getData() -> [String] {
        return [do1.data, do2.data]
    }
}

class CompositeEntity {
    
    let cgo = CoareGrainedObject()
    
    func setData(data1: String,_ data2: String) {
        self.cgo.setData(data1, data2)
    }
    
    func getData() -> [String] {
        return cgo.getData()
    }
}

class Client {
    
    let cEntity = CompositeEntity()
    
    func printData() {
        for data in cEntity.getData() {
            print("Data: \(data)")
        }
    }
    
    func setData(data1: String,_ data2: String) {
        cEntity.setData(data1, data2)
    }
}

//DEMO

let client = Client()
client.setData("Test", "Data")
client.printData()
client.setData("Other Test", "Other Data")
client.printData()