protocol Order {
    func execute()
}

class Stock {
    private var name:String = "ABC"
    private var quantity : Int = 10
    func buy() {
        print("Stock [Name : \(self.name) | Quantity: \(self.quantity)] bought")
    }
    func sell() {
        print("Stock [Name : \(self.name) | Quantity: \(self.quantity)] sold")
    }
}

class BuyStock : Order {
    private var abcStock : Stock?
    
    init(_ abcStock: Stock) {
        self.abcStock = abcStock
    }
    
    func execute() {
        self.abcStock?.buy();
    }
}

class SellStock : Order {
    private var abcStock : Stock?
    
    init(_ abcStock: Stock) {
        self.abcStock = abcStock
    }
    
    func execute() {
        self.abcStock?.sell();
    }
}

class Broker {
    private var oderList = [Order]()
    
    func takeOder(oder: Order) {
        self.oderList.append(oder)
    }
    
    func placeOder() {
        for oder in self.oderList {
            oder.execute()
        }
        oderList.removeAll()
    }
}

//DEMO

let stock = Stock()
let buyStockOder = BuyStock(stock)
let sellStockOder = SellStock(stock)

let broker = Broker()
broker.takeOder(buyStockOder)
broker.takeOder(sellStockOder)

broker.placeOder()