class DataBaseManager {
    static let defaultManager = DataBaseManager()

    private init() {
        print("singleton has been created")
    }
    
}

//DEMO 
print("singleton hasn't been created")
DataBaseManager.defaultManager
