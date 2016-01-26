//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 使用 protocol 来声明一个协议.
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类  枚举和结构体都可以实现协议
class SimpleClass:ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// 练习: 写一个实现这个协议的枚举
protocol ExampleProtocol1 {
    var simpleDescription: String { get }
    mutating func adjust()
}
class simpleClass: ExampleProtocol1 {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}

class ConformingClass: ExampleProtocol1 {
    var simpleDescription: String = "A very simple class."
    var carModel: String = "The Toyota corella"
    
    func adjust() {
        carModel += "is the best car ever"
    }
}

let conformingClass = ConformingClass()
conformingClass.adjust()
let whichCarIsBest = conformingClass.carModel
// 注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法. SimpleClass 的声明不需要标记任何方法因为类中的方法经常会修改类.


// 使用 extension 来为现有的类型添加功能, 比如新的方法和参数. 你可以使用扩展在别处改定义, 甚至是从外部库或者框架引入的一个类型, 使得这个类型遵循某个协议.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription
// 练习: 给 Double 类型写一个扩展, 添加 absoluteValue 功能
extension Double {
    var absoluteValue: Double {
        return abs(self)
    }
}
let exampleDouble: Double = -40.0
let exampleAbsoluteValue = exampleDouble.absoluteValue
// 你可以像使用其他命名类型一样使用协议名--例如, 创建一个有不同类型但是都实现一个协议的对象集合. 当你处理类型是协议的值时, 协议外定义的方法不可用.
//let protocolValue: ExampleProtocol = a protocolValue.simpleDescriptions
// protocolValue.anotherProperty // Uncomment to see the error

// 即使 protocolValue 变量运行时的类型是 simpleClass, 编译器会把它的类型当做 simpleClass, 编译器会把它的类型当做 ExampleProtocol. 这表示你不能调用类在它实现的协议之外实现的方法或者属性.