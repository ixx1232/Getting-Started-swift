//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 使用 class 和类名来创建一个类, 类中属性的声明和常量  变量声明一样, 唯一的区别就是他们的上下文是类. 同样, 方法和函数声明也一样
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 练习: 使用 let 添加一个常量属性, 在添加一个接受一个参数的方法.
class Shape1 {
    var numberOfSides = 0
    let dimension = "2d"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    func notSoSimpleDescription() -> String {
        return "This is a \(dimension) shape."
    }
}
let myShape = Shape1()
myShape.notSoSimpleDescription()


// 要创建一个类的实例, 在类名后面加上括号. 使用点语法来访问实例的属性和方法.
let shape = Shape()
shape.numberOfSides = 7
var shapeDescritpin = shape.simpleDescription()

// 这个版本的 Shape 类缺少了一些重要的东西: 一个构造函数来初始化类实例. 使用 init 来创建一个构造器.
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func simpelDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// 注意  self 被用来区别实例变量. 当你创建实例的时候, 像传入函数参数一样给类传入构造器的参数. 每个属性都需要赋值 -- 无论是通过声明 (就像 numberOfSides) 还是通过构造器 (就像 name ).
// 如果你需要在删除对象之前进行一些清理工作, 使用 deinit 创建一个析构函数.

// 子类的定义方法是在他们的雷鸣后面加上父类的名字, 用 冒号 分割, 创建类的时候并不需要一个标准的根类, 所以你可以忽略父类.
// 子类如果要重写父类的方法的话,需要用 override标记 -- 如果没有添加 override就重写父类方法的话编译器会报错.编译器同样会检测 override 标记的方法是否确实在父类中.
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpelDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpelDescription()

// 练习: 创建 NameShape的另一个子类 Circle, 构造器接受两个参数, 一个是半径一个是名称, 实现 area 和 describe方法
class NamedShape1 {
    var numberOfSides: Int = 0
    var name: String
    // The initializer method is the entry point to our class. Upon creating an instance, this method will be called, which requires us to pass the arguments it expects on instantiation. 
    init (name: String){
        // Name is a local variable, meaning it's only available via the context of this method. We can assign it to an instance variable with the call to self.name = name. This allows us to call .name on our instance of NamedShape class to retrieve the value. 
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

class Circle: NamedShape {
    var radius: Double
    
    init (name: String, radius: Double) {
        self.radius = radius
        super.init(name: name)
        self.name = name
    }
    override func simpelDescription() -> String {
        return "A circle with a radius of \(radius)"
    }
    
    func area() -> Double {
        return 3.14159265 * radius * radius
    }
    
}
let myCircle = Circle(name: "Example circle", radius: 6.0)
myCircle.name
myCircle.area()
myCircle.simpelDescription()




// 属性可以有 getter 和 setter.
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpelDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength);"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
//print(riangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// 在 perimeter 的 setter 中, 新值得名字是 newValue. 你可以在 set 之后显式的设置一个名字.
// 注意 EquilateralTriangle 类的构造器执行了三步:
    /**
        1> 设置子类声明的属性值
        2> 调用父类的构造器
        3> 改变父类定义的属性值.其他的工作比如调用方法 getters和setters也可以在这个阶段完成
    */
// 如果你不需要计算属性, 但是仍然需要在设置一个新值之前或者之后运行代码, 使用 willSet 和 didSet
// 比如, 下面的类确保三角形的边长总是和正方形的边长相同
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
//TriangleAndSquare.square.sideLength
//TriangleAndSquare.triangle.sideLength
//TriangleAndSquare.square = Square(sideLength: 50, name: "larger square")
//TriangleAndSquare.triangle.sideLength

// 类中的方法和一般的函数有一个重要的区别,函数的参数名只在函数内部使用, 但是方法的参数名需要在调用的时候显示说明 (除了第一个参数). 默认情况下, 方法的参数名和它在方法内部的名字一样, 方法的参数和它在方法内部的名字一样,不过你也可以定义第二个名字,这个名字被用在方法内部.
class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

// 处理变量的可选值时, 你可以在操作 (比如方法 属性和子脚本 之前加? . 如果 ? 之前的值是nil, ?后面的东西都会被忽略, 并且整个表达式返回 nil. 否则, ?之后的东西都会被运行.在这两种情况下, 这个表达式的值也是一个可选值.)
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


