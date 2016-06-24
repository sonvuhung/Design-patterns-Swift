class User {
    private var name : String!
    init(_ name: String) {
        self.name = name
    }
    
    func sendMessage(message: String) {
        ChatRoom.showMessage(self, message: message)
    }
}

//MARK: Mediator class
class ChatRoom {
    static func showMessage(user: User, message: String) {
        print("[\(user.name)] : \(message)")
    }
}

//DEMO

let robert = User("Robert")
let john = User("John")

robert.sendMessage("Hi! John!")
john.sendMessage("Hello! Robert!")