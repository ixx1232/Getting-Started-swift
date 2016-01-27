//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 在尖括号里写一个名字来创建一个泛型函数或者类型
//func repeat<ItemType>(item: ItemType, times:Int) -> [ItemType] {
//    var result = [ItemType]()
//    for i in 0..<times {
//        result.append(item)
//    }
//    return result
//}
//repeat("knock", 4)

// 你也可以创建泛型类  枚举和结构体
// Reimplement the Swift standard library's optional type
enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
// 在类型名后面使用 where 来制定对类型的需求, 比如, 限定类型实现某一个协议, 限定两个类型是相同的, 或者限定某个类必须有一个特定的父类
func anyCommonElements<T, U where T: SequenceType, U:SequenceType, T.Generator.Element:Equatable,T.Generator.Element == U.Generator.Element>(lhs:T, rhs:U) -> Bool {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
        
    }
    return false
}
anyCommonElements([1, 2, 3], rhs: [3])

// 练习: 修改 anyCommonElements 函数来创建一个函数, 返回一个数组, 内容是两个序列的共有元素
func anyCommonElements1 <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs:U) -> Bool {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements1([1, 2, 3], rhs: [3])

func whichCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Array<T.Generator.Element> {
    var toReturn = Array<T.Generator.Element>()
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                toReturn.append(lhsItem)
            }
        }
    }
    
    return toReturn
}

whichCommonElements([1, 2, 3], rhs: [3, 2])

// 简单起见, 你可以忽略 where, 只在冒号后面写协议或者类名. <T:Equatable> 和 <T where T:Equatable>是等价的
