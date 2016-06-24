import Foundation

protocol Shape {
    func draw()
}

class Circle: Shape {
    
    var color: String!
    var x = 0
    var y = 0
    var radius = 0
    
    init(_ color: String) {
        self.color = color
    }
    
    func draw() {
        print("Drawing Circle [radius:\(radius) | location: (\(x),\(y))\t| color: \(color)]")
    }
}


class ShapeFactory {
    static var circleMap = [String: Shape]()
    
    static func getCircle(color: String) -> Shape {
        
        var circle: Circle? = circleMap[color] as? Circle
        
        if circle == nil {
            circle = Circle(color)
            circleMap[color] = circle
            print("Created circle of color: \(color)")
        }
        
        return circle!
    }
}

//DEMO

let colors: [String] = [
    "Red", "Green", "Blue", "White", "Black"
]

let getRandomColor = {
    return colors[Int(arc4random_uniform(UInt32(colors.count)))]
}

let getRandomXorY = {
    return Int(arc4random_uniform(100))
}

for i in 0 ..< 20 {
    let circle: Circle = ShapeFactory.getCircle(getRandomColor()) as! Circle
    circle.x = getRandomXorY()
    circle.y = getRandomXorY()
    circle.radius = 100
    circle.draw()
}