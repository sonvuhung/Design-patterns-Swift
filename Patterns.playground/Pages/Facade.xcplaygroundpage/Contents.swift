protocol Shape {
    func draw()
}

class Rectangle: Shape {
    func draw() {
        print("Drawing Rectangle")
    }
}

class Square: Shape {
    func draw() {
        print("Drawing Square")
    }
}

class Circle: Shape {
    func draw() {
        print("Drawing Circle")
    }
}

class ShapeMaker {
    
    var circle: Shape = Circle()
    var rectangle = Rectangle()
    var square = Square()
    
    func drawCircle() {
        circle.draw()
    }
    
    func drawRectangle() {
        rectangle.draw()
    }
    
    func drawSquare() {
        square.draw()
    }
}

//DEMO

let shapeMaker = ShapeMaker()

shapeMaker.drawCircle()
shapeMaker.drawSquare()
shapeMaker.drawRectangle()