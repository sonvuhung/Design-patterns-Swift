protocol ReadFile {
    func readFile() -> String
}

class User: ReadFile {
    private var name: String!
    
    init(_ name: String) {
        self.name = name
    }
    
    func readFile() -> String {
        return "user \(self.name) is reading file"
    }
}

class UserProxy: ReadFile {
    private var instance: ReadFile?
    private var name: String!
    
    init(_ name: String) {
        self.name = name
    }
    
    func readFile() -> String {
        if self.name == "ok" {
            self.instance = User(name)
            return self.instance!.readFile()
        } else {
            return "user \(self.name) can't read file"
        }
    }
}

//DEMO
let user1: UserProxy = UserProxy("ok")
print(user1.readFile())
let user2: UserProxy = UserProxy("hello")
print(user2.readFile())