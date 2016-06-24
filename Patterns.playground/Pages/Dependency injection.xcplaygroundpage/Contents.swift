protocol MyDatabase {
    func save(orderId: Int)
}

protocol MyLogger {
    func logInfo(info: String)
}

protocol MyEmailSender {
    func sendEmail(userId: Int)
}

class Logger: MyLogger {
    func logInfo(info: String) {
        print("Logger report: \(info)")
    }
}

class Database: MyDatabase {
    func save(orderId: Int) {
        //...
    }
}

class EmailSender: MyEmailSender {
    func sendEmail(userId: Int) {
        //...
    }
}

class Cart {
    private var db: MyDatabase!
    private var log: MyLogger!
    private var es: MyEmailSender!
    
    init(database: MyDatabase, emailSender: MyEmailSender, logger: MyLogger) {
        self.db = database
        self.es = emailSender
        self.log = logger
    }
    
    func checkOut(oderId: Int, userId: Int) {
        self.db.save(oderId)
        self.log.logInfo("Oder \(oderId) of User \(userId) has been checkout")
        self.es.sendEmail(userId)
    }
}

//IoC Option 1

typealias Constructor = () -> AnyObject

class DIContainer {
    static var registry = [String: Constructor]()
    
    static func register(name: String, function: Constructor) {
        self.registry[name] = function
    }
    
    static func resolve(name: String) -> AnyObject? {
        let closure = self.registry[name]
        if closure != nil {
            return self.registry[name]!()
        } else {
            print("Nothing registered with that name")
            return { return nil }()
        }
    }
}

DIContainer.register("Database") { () -> AnyObject in
    return Database()
}

DIContainer.register("Database"){ () -> AnyObject in
    return Database()
}

DIContainer.register("EmailSender") { () -> AnyObject in
    return EmailSender()
}

DIContainer.register("Logger"){ () -> AnyObject in
    return Logger()
}

DIContainer.register("Cart"){ () -> AnyObject in
    let db = DIContainer.resolve("Database") as! MyDatabase
    let es = DIContainer.resolve("EmailSender") as! MyEmailSender
    let lg = DIContainer.resolve("Logger") as! MyLogger
    return Cart(database: db, emailSender: es, logger: lg)
}

//IoC Option 2

extension DIContainer {
    static func newDatabase() -> MyDatabase {
        return Database()
    }
    
    static func newLogger() -> MyLogger {
        return Logger()
    }
    
    static func newEmailSender() -> MyEmailSender {
        return EmailSender()
    }
}

extension DIContainer {
    static func newCart() -> Cart {
        return Cart(database: self.newDatabase(), emailSender: self.newEmailSender(), logger: self.newLogger())
    }
}

//DEMO

let cart1: Cart = DIContainer.resolve("Cart") as! Cart
cart1.checkOut(1, userId: 1)

let cart2: Cart = DIContainer.newCart()
cart2.checkOut(2, userId: 1)
