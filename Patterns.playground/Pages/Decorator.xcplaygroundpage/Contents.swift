protocol Shape {
    func draw()
}

class Rectangle: Shape {
    func draw() {
        print("Shape: Rectangle")
    }
}

class Circle: Shape {
    func draw() {
        print("Shape: Circle")
    }
}

class ShapeDecorator: Shape {
    
    var decoratedShape: Shape!
    
    init(decoratedShape: Shape) {
        self.decoratedShape = decoratedShape
    }
    
    func draw() {
        decoratedShape.draw()
    }
}

class RedShapeDecorator: ShapeDecorator {
    
    override func draw() {
        decoratedShape.draw()
        setRedBorder()
    }
    
    func setRedBorder() {
        print("Border Color: Red")
    }
}

//DEMO

let circle: Shape = Circle()
let redCircle: Shape = RedShapeDecorator(decoratedShape: Circle())
let redRectangle: Shape = RedShapeDecorator(decoratedShape: Rectangle())

circle.draw()
redCircle.draw()
redRectangle.draw()