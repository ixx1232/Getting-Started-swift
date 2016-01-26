//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 使用 enum 来创建一个枚举. 就像类和其他所有命名类型一样,枚举可以包含方法
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawVaule = ace.rawValue

// 练习: 写一个函数, 通过比较他们的原始值来比较两个 Rank 值
enum RankX: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let acex = RankX.Ace
let jackx = RankX.Jack
let aceRawValue = ace.rawValue
let jackRowValue = jackx.rawValue

func compare(rank1: RankX, rank2: RankX) -> String {
    var higher: RankX = rank1
    if rank2.rawValue > rank1.rawValue {
        var higher = rank2
    }
    return "The higher of the two is \(higher.simpleDescription())"
    
}
compare(jackx, rank2: acex)

// 在上面的例子中, 枚举原始值的类型是 Int, 所以你只需要设置第一个原始值. 剩下的原始值会按照顺序赋值. 你也可以使用字符串或者浮点数作为枚举的原始值.

// 使用 'rawValue'在原始值和枚举值之间进行转换.
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
// 枚举的成员值是实际值, 并不是原始值的另一种表达方法. 实际上, 如果原始值没有意义, 你不需要设置.
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
// 给 Suit 添加一个 color 方法, 对 spades 和 clubs 返回 "black",对 hearts 和 diamonds返回 "red"
enum Suit1: Int {
    case Spades = 1
    case Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
// When we pass self to switch, self is in the context of the enum. Here meaning Suit. Passing self allows us to access the properties of the enum with the dot notation and doesn't require us to have to use Suit.Spades. 
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}
let heartsDescription1 = Suit1.Hearts.simpleDescription()
let heartsColor = Suit1.Hearts.color()
// 注意, 有两种方式可以引用 Hearts 成员: 给 hearts 常量赋值时, 枚举成员Suit.Hearts 需要用全名来引用, 因为常量没有显示指定类型. 在 switch里, 枚举成员使用缩写 .Hearts来引用,因为 self 的值已经知道是一个 suit. 已知变量类型的情况下你可以使用缩写.



// 使用 struct 来创建一个结构体. 结构体和类有很多相同的地方, 比如方法和构造器. 它们之间最大的一个区别就是 结构体是传值, 类是传引用.
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// 练习: 给 Card 添加一个方法, 创建一副完整的扑克牌并把每张的 rank 和 suit 对应起来
class Card1 {
    var rank: Rank
    var suit: Suit1
    
    init(cardRank: Rank, cardSuit: Suit1) {
        self.rank = cardRank
        self.suit = cardSuit
    }
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    //        To get a full deck we need to loop through all the ranks, assign each suit and put those into an array. The rank has a int raw value so we can use that.
    func Deck() -> String {
        var stringTogether = ""
        
        for i in 0...14 {
            if let convertedRank = Rank(rawValue: i) {
                self.rank = convertedRank
                
                for y in 0...5 {
                    if let convertedSuit1 = Suit1(rawValue: y) {
                        self.suit = convertedSuit1
                        stringTogether = "\(stringTogether) \(self.simpleDescription())"
                    }
                }
            }
        }
        return stringTogether
    }
}

let threeOfSpades1 = Card1(cardRank: .Three, cardSuit: .Spades)
let threeOfSpadesDescription1 = threeOfSpades.simpleDescription()
threeOfSpades1.Deck()

// 一个枚举成员的实例可以有实例值, 相同枚举成员的实例可以有不同的值. 创建实例的时候传入值即可. 实例值和原始值是不同的:枚举成员的原始值对于所有实例都是相同的, 而且你是在定义枚举的时候设置原始值
// 例如, 考虑从服务器获取日出和日落的时间. 服务器会返回正常结果或者错误信息.
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}
let success = ServerResponse.Result("6:00", "8:09")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...\(error)"
}
// 练习: 给 ServerResponse 和 switch 添加第三种情况
enum ServerResponse1 {
    case Result(String, String)
    case Error(String)
    case ThirdCase(String)
}
// z狐疑如何从 ServerResponse 中提取日升和日落时间.


