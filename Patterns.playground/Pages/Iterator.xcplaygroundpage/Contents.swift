protocol Iterator {
    func hasNext() -> Bool
    func next() -> String?
}

protocol Container {
    func getIterator() -> Iterator
}

class NameRepository: Container {
    
    let names: [String] = ["Robert", "John", "Julie", "Lora"]
    
    func getIterator() -> Iterator {
        return NameIterator()
    }
}

class NameIterator: NameRepository, Iterator {
    
    var index = 0
    
    func hasNext() -> Bool {
        return index < names.count
    }
    
    func next() -> String? {
        if hasNext() {
            let returnIndex = index
            index += 1
            return names[returnIndex]
        } else {
            return nil
        }
    }
}

//DEMO

let namesRepository = NameRepository()

var iter = namesRepository.getIterator()
while iter.hasNext() {
    let name = iter.next()
    if name != nil {
        print("Name: \(name!)")
    }
}