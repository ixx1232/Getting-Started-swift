//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 使用 if 和 switch 来进行条件操作, 使用 for-in  for while 和 do-while 来进行循环. 包裹条件和循环变量括号可以省略, 但是预聚体的大括号是必须的.
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
// 在 if 语句中, 条件必须是一个布尔表达式--这意味着像 if score { ... }这样的代码将报错,而不会隐形地与 0 做对比
// 你可以一起使用 if 和 let 来处理值缺失的情况. 有些变量的值是可选的. 一个可选得值可能是一个具体的值或者是 nil, 表示值缺失. 在类型后面加一个问号来标记这个变量的值是可选的.
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName:String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
// 练习: 把 optionalName 改成nil, greeting会是什么 ? 添加一个 else 语句, 当 optionalName 是 nil 时给greeting赋一个不同的值
// 4a:// Change optionalName to nil
var optionalName1: String? = "John appleseed"
var greeting1 = "Hello!"
optionalName1 = nil
if let name = optionalName1 {
    greeting = "Hello, \(name)"
}
// 4b: Add an else clause that sets a different greeting if optionalName is nil
if let name = optionalName1 {
    greeting1 = "Hello, \(name)"
} else {
    greeting1 = "Hello stranger"
}
// 如果变量的可选值是 nil, 条件会判断 false, 大括号中的代码会被跳过, 如果不是 nil, 会将值赋给 let 后面的常量, 这样代码块中就可以使用这个值了




// switch 支持任意类型的数据以及各种比较操作--不仅仅是整数以及测试相等
let vegetable = "red pepper"
switch vegetable {
    case "celery":
          let vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
         let vegetableComment = "The would make a good tea sandwich."
     case let x where x.hasSuffix("pepper"):
         let vegetableComment = "Is it a spicy \(x)?"
     default:
         let vegetableComment = "Everything tastes good in soup"
}
// 练习: 删除 default 语句, 看看会有什么错误
// error: switch must be exhausteve, consider adding a default clause

// 声明 'let'可用于匹配某部分固定值的模式
// 运行 switch 中匹配到的子句之后, 程序会退出 switch 语句, 并不会继续向下运行, 所以不需要在每个子句结尾写break.

// 你可以使用 for-in 来遍历字典, 需要两个变量来表示每个键值对.字典是一个无序的集合, 所以他们的键和值任意顺序迭代结束
let interestringNumbers = [
     "Prime":[2, 3, 5, 7, 11, 13],
     "Fibonacci":[1, 1, 2, 3, 5, 8],
     "Square":[1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestringNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
// 练习: 添加另一个变量来记录哪种类型的数字是最大的.
let interestingNumbers = [
     "Prime":[2, 3, 5, 7, 11, 13],
     "Fibonacci":[1, 1, 2, 3, 5, 8],
     "Square":[1, 4, 9, 16, 25],
]
var largest1 = 0
var largestKind: String = ""
for (kind , numbers) in interestingNumbers {
    for number in numbers {
        if number > largest1 {
            largest1 = number
            largestKind = kind
        }
    }
}
largest1
largestKind

// 使用 while 来重复运行一段代码直到不满足条件. 循环条件可以在开头也可以在结尾.
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

// 你可以在循环中使用 ..< 来表示范围, 也可以使用传统的写法, 两者是等价的:
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += i
}
print(secondForLoop)
// 使用 ..< 创建的范围不包含上界, 如果想包含的话需要使用...


