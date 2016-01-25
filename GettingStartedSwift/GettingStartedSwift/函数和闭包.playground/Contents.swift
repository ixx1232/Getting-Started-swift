//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 使用 func 来声明一个函数, 使用名字和参数来调用函数. 使用 -> 来制定函数返回值
func greet(name: String,day: String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("Bob", day: "Tuesday")
// 练习: 删除 day 参数, 添加一个参数来表示今天吃了什么午饭.
func greet(name: String, todaysLunch:String) -> String {
    return "Hello \(name), today's lunch is \(todaysLunch)"
}
greet("Bob", day: "Turkey Sandwich")



// 使用元组来让一个函数返回多个值, 该元组的元素可以用名称或数字来表示.
func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.1)

// 函数可以带有可变个数的参数, 这些参数在函数内表现为数组的形式:
func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 587, 11, 20)
// 练习: 写一个计算参数平均值的函数
func average (numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum/numbers.count
}
average(2, 10)

// 函数可以嵌套, 被嵌套的函数可以访问外侧函数的变量, 你可以使用嵌套函数来重构一个太长或者太复杂的函数.
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 函数是第一等类型, 这意味着函数可以作为另一个函数的返回值.
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// 函数也可以当做参数传入另一个函数
func hasAnyMatches(list:[Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)


// 函数实际上是一种特殊的闭包, 你可以使用{} 来创建一个匿名闭包.使用 in 将参数和返回值类型声明与闭包函数体进行分离.
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
// 练习: 重写闭包, 对所有骑术返回0
var numbers1 = [20, 19, 7, 12]
numbers1.map({
    (number: Int) -> Int in
    if number % 2 == 0 {
        return number
    }else {
        return 0
    }
})
numbers1
// 有很多中创建闭包的方法. 如果一个闭包的类型已知, 比如作为一个回调函数, 你可以忽略参数的类型和返回值, 单个语句闭包会把它语句的值当做结果返回.
let mappedNumbers = numbers.map({ number in 3 * number })
mappedNumbers
// 你可以通过参数位置而不是参数名字来引用参数-- 这个方法在非常短的闭包中非常有用.当一个闭包作为最后一个参数传给一个函数的时候, 它可以直接跟在括号后面

//let sortedNumbers =  sorted(numbers) { $0 > $1 }
//print(sortedNumbers)
