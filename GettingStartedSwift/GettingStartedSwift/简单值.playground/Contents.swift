//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/// 简单值

// 使用 let 来声明常量, 使用 var 来声明变量. 一个常量的值, 在编译的时候, 并不需要有明确地值, 但是你只能为它赋值一次, 也就是说你可以用常量来表示这样这样一个值: 你指需要决定一次, 但是需要使用很多次.
var myVariable = 42
myVariable = 50
let myConstant = 42

// 常量或者变量的类型必须和你赋给它们的值一样. 然而, 声明时类型是可选的, 声明的同时赋值的话,编译器会自动推断类型. 在上面的例子中, 编译器推断出 myVariable是一个整数 (integer) 因为它的初始值是整数.

// 如果初始值没有提供足够的信息 (或者没有初始值), 那你需要在变量后面声明类型, 用冒号分割.
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// 练习: 创建一个常量, 显示指定类型为 Float 并指定初始值为 4
let explicitDouble1: Double = 4





// 值永远不会被隐式转换为其他类型. 如果你需要把一个值转换成其他类型, 请显示转换
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
// 练习: 删除最后一行中的 String, 错误提示是什么?
// error: Binary operator '+' cannot be applied to operands of type 'String' and 'Int'
// 产生这个错误的原因是: 类型不一致






// 有一种更简单的把值转换成字符串的方法:把值写到括号中, 并且在括号之前写一个反斜扛. 例如:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
// 练习: 使用 \()来把一个浮点计算转换成字符串, 并加上某人的名字, 和他打个招呼.
// 3a: Floating point calculation
let revenue: Float = 160.0
let cost: Float = 70.0
let profit: String = "Today my lemonade stand made \(revenue-cost) dollars of profit"
// 3b: Use someone's name in a greeting
let personsName: String = "Josh"
let greetJosh = "Hi \(personsName)"






// 使用方括号 [] 来创建数组和字典, 并使用下标或者键 (key) 来访问元素.
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
shoppingList

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
occupations
// 要创建一个空数组或者字典, 使用初始化语法.
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
// 如果类型信息可以被推断出来, 你可以用[] 和 [:] 来创建空数组和空字典--就像你声明变量或者给函数传参数的时候一样
shoppingList = []
occupations = [:]
