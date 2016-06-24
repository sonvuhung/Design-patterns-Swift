protocol DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int)
}

class RedCircle: DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Circle [Color: red, readius: \(radius), x: \(x), y: \(y)]")
    }
}

class GreenCircle: DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Circle [Color: green, readius: \(radius), x: \(x), y: \(y)]")
    }
}

class Shape {
    var drawer: DrawAPI
    init(drawer: DrawAPI) {
        self.drawer = drawer
    }
    func draw() {
        
    }
}

class Circle: Shape {
    
    var x, y, radius : Int!
    
    init(x : Int, y: Int, radius: Int, drawer: DrawAPI) {
        super.init(drawer: drawer)
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    override func draw() {
        drawer.drawCircle(radius, x: x, y: y)
    }
}

//DEMO

let redCircle = Circle(x: 100, y: 100, radius: 10, drawer: RedCircle())
let greendCircle = Circle(x: 100, y: 100, radius: 10, drawer: GreenCircle())

redCircle.draw()
greendCircle.draw()