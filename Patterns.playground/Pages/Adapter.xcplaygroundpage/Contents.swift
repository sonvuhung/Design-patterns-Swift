protocol MyShowName {
    func showName(name: String)
}

class ShowName : MyShowName {
    
    func showName(name: String) {
        print(self.standardize(name))
    }
    
    func standardize(name: String) -> String {
        return "[\(name.uppercaseString)]"
    }
}

protocol MyShowListName {
    func showListName(listName: [String])
}

class ShowListNameAdapter : MyShowListName {
    
    private var showName: ShowName!
    
    init(_ shownName: ShowName) {
        self.showName = shownName
    }
    
    func showListName(listName: [String]) {
        for name in listName {
            self.showName.showName(name)
        }
    }
}

//DEMO

let list : [String] = ["One", "twO", "thrEE"]
let adapter : MyShowListName = ShowListNameAdapter(ShowName())
adapter.showListName(list)
