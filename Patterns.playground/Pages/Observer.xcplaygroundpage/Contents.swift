protocol Observer {
    func update(message: String)
}

class Customer: Observer {
    private var name: String!
    private var age: Int!
    
    init(_ name: String,_ age: Int) {
        self.name = name
        self.age = age
    }
    
    func update(message: String) {
        print("\(self.name): \(message)")
    }
}

protocol Subject {
    func attachObserver(observer: Observer, withName: String)
    func detachObserverWithName(name: String)
    func notifyObserver()
}

class Product: Subject {
    private var obs = [String: Observer]()
    private var nameProduct: String!
    
    init(_ nameProduct: String) {
        self.nameProduct = nameProduct
    }
    
    func attachObserver(observer: Observer, withName name: String) {
        self.obs[name] = observer
    }
    
    func detachObserverWithName(name: String) {
        self.obs[name] = nil
    }
    
    func notifyObserver() {
        for ob in self.obs.values {
            ob.update(nameProduct)
        }
    }
}

//DEMO
let cus1 = Customer("Ti", 11)
let cus2 = Customer("Teo", 12)
let product1 = Product("Laptop")

product1.attachObserver(cus1, withName: cus1.name)
product1.attachObserver(cus2, withName: cus2.name)

product1.detachObserverWithName(cus1.name)

product1.notifyObserver()