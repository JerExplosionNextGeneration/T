
import Foundation
import UIKit

// MARK: - July 1st Notes

var xyz : [Any] = ["alok", 35, true, 2.0]

let first0 = xyz[0]
// trainer recommends type-casting when getting an element from heterogenous array, safer less crashable
let first1 = xyz[0] as? String
let first2 = xyz[0] as! String


// nil-coalescing / optional chaining / force unwrapping / optional binding

var aDictionary: [String: Any]  = ["name": "alok", "age": 35, "hobby" : "gardening | music"]
let aValue = aDictionary["name"]
print(aValue)

let aName = (aValue ?? "user") as? String
let welcomeMessage = "welcome " + (aName ?? "J")

print(aName)
print(welcomeMessage)

var movieDictionary: [String:String] = ["movieName": "MIB"]
movieDictionary["movieName"] = "LLB"


// MARK: - July 2nd Notes

let tp = (35, true, "alok")
// tuple is a light-weight data type for passing around data
// tuple's advantage is its light-weightness (in terms of memory and initialization time)

// onaji with struct/class/dict/array

private func getDateMonthYearTupleWay() -> (year: Int, month: Int, date: String) {
    let date: String = ""
    let month: Int = 13
    let year: Int = 2025
    
    return (year, month, date)
}

let dMy = getDateMonthYearTupleWay()
print(dMy.0)   // tuple has no subscripts, so do it like this
print(dMy.date)

//

private func getDateMonthYearArrayWay() -> [Any] {
    let date: String = ""
    let month: Int = 13
    let year: Int = 2025
    
    return [year, month, date] 
}

// in array we can iterate, append, remove, insert | however not in tuples
let dmyA = getDateMonthYearArrayWay()
// print((dmyA[0] as? String?)! + "appendable string")  // with array this doesn't work, not even with typcasting


// class -> blueprint
// object -> actual existence

class St0ck {
    private var symbol: String?
    private var price: float_t?
    
    func setPrice(price: Float) -> Float {
        self.price = price
        return price
    }
    func setSymbol(symbol: String){
        self.symbol = symbol
    }
    // getter / setter (not necessary tho)
    func getSymbol() -> String {
        return self.symbol ?? "🔥"
    }
}

let st0ckInstance = St0ck()
print(st0ckInstance.setPrice(price: 11))
print(st0ckInstance.getSymbol())


//st0ckInstance.price = 1.13 //  inaccessible due to 'private' protection level
//st0ckInstance.symbol = "🔥"


class St1ck {
    private var symbol: String
    private var price: float_t
    
    init(price: Float, symbol: String) { // it's good practice to just give the same name
        self.price = price
        self.symbol = symbol
    }
    
    func setPrice(price: Float) -> Float {
        self.price = price
        return price
    }
    func setSymbol(symbol: String){
        self.symbol = symbol
    }
    // getter / setter (not necessary tho)
    func getSymbol() -> String {
        return self.symbol ?? "🔥"
    }
}

// Constructors / Initializers

class Traingular {
    
    var numberOfSides = 3
    var color: String?
    
    init(sides: Int, color: String) {
        self.numberOfSides = sides
        self.color = color
    }
}

// failable init
class Kite {
    
    var color: String
    init?(color: String) {
        self.color = color
    }
}
let kitkite = Kite.init(color: "failableColor")

//

struct Personality {
    var big16:String
    
    init?(big16: String) {
        if big16.count == Int(sqrt(16)) {
            self.big16 = big16
        } else {
            return nil
        }
    }
}


// MARK: - extra-curricular

enum appErrors: Error {
    case whatevererroriwant
}

func throwItUp() throws  {
    throw appErrors.whatevererroriwant
}

//  classes are reference types

class PPC1 {
    var name: String?
    
    class func classFunc() -> String {
        return "classFunc"
    }
}

let ppc1 = PPC1.init()
ppc1.name = "amit"
print(ppc1.name)

let ppc2 = ppc1 // passed by reference

ppc2.name = "alok"
print(ppc1.name, ppc2.name)



struct PPS1 {
    var name: String // structs have default inits, so no need to be optional
    
    mutating func setName(name: String) { // have to use the mutating keyword
        self.name = name
    }
    
    static func staticity() -> String {
        return "staticity"
    }
    // Static method vs Class method
}

// mutating func
struct mutatingFunc {
    var muta: String
    mutating func mutation(muta: String) {
        self.muta = muta
    }
}
 

// lazy properties (memory only allocated at the time of usage)

class Lazyo {
    lazy var laziness = "laziness"
    
    func getVal() -> String {
        return laziness
    }
}

let objLazy = Lazyo()
print(objLazy.getVal())

// computed properties  ----------------

class Area {
    var width: Int = 33
    var height: Int = 110
    
    var claculatedArea: Int {
        get {
            return height * width
        }
        // would be get-only, un-assignable property if only getter no setter
        set {
            width = Int(sqrt(Double(newValue))) //newValue is the default
            height = width
        }
    }
    
    // deinit gets called automatically tho
    deinit {
        // remove observers
        // remove notifications
        // remove timers
        // etc.
    }
}

let square = Area.init()
square.height = 77
square.width = 100
print(square.claculatedArea)


// Enums
enum Directions {
    case East
    case South
    case West
    case North
}

class GeoLocation {
    var direction = Directions.South
    var lati = 99.99
    var longti = 33.33
}

let g = GeoLocation.init()
g.direction = .West


// Raw-value enums
enum Countries: String {
    case China = "Great Wall"
    case India = "Taj Mahal"
}
print(Countries.India.rawValue)

// Associated enums
enum AnyInfoWorks {
    case info(String)
}

print(AnyInfoWorks.info("whatevsIwant"))

// An optional is an associated enum (read about it on stackoverflow)

let someValue = 666
let optionalForDemo: Int? = nil

switch optionalForDemo {
case .some(someValue):
    print("the value is \(someValue)")
case .some(let val):
    print("the value is \(val)")
default:
    print("nothing not a thing")
}

switch someValue {
case let val where val == optionalForDemo:
    print(someValue)
default:
    break
}

// In exception-handling scenarios, we use error-states' enums widely (conforming to the error protocol)

enum HeightErrors: Error {
    case tooTall
    case tooShort
}

class HeightExaminer {
    
    func examineHeight(height: Float) throws -> Bool {
        if height > 170 {
            throw HeightErrors.tooTall
        } else if height < 150 {
            throw HeightErrors.tooShort
        } else {
            return true
        }
    }
}

let hex = HeightExaminer.init()
do {
    let result = try hex.examineHeight(height: 200)
} catch {
    print(HeightErrors.self)
}

// Error-handling gives us more clarity as to what the specific error is
enum BankingErrorsOrSuccess: Swift.Error {
    case tooPoor
    case tooRich
    
    case curatedMessage(availableAmount: Float, successMessage: String)
}

class Banking {
    var amountAvailable: float_t = 10000 * 10000
    func withdraw(amountToWithdraw: Float) throws -> BankingErrorsOrSuccess {
        if amountToWithdraw <= amountAvailable {
            
            amountAvailable = amountAvailable - amountToWithdraw
            return BankingErrorsOrSuccess.curatedMessage(availableAmount: amountAvailable, successMessage: "Successfully withdrawing")
            
        } else {
            throw BankingErrorsOrSuccess.curatedMessage(availableAmount: amountAvailable, successMessage: "Not enough balance")
        }
    }
}

let tryBanking = Banking()
tryBanking.amountAvailable = 22222

do {
    let messageCurated = try tryBanking.withdraw(amountToWithdraw: 100)
    print(messageCurated)
} catch {
    print("banking mistake caught")
}

// MARK: - July 6th Monday

class D {
    
    var x: Int
    
    init(x: Int) {
        self.x = x
    }
    
    deinit {
        // kvo (key-value observer)
        // timer
        // notification observer
    }
}

let arr = [1111, 111, 11]
let res = arr.map({return $0 * $0}) // map is a type of fast enumerations
print(res)

// optional binding (if let)
  
var optionalVar: String? = "optiV"
    
if let o = optionalVar {
    let result = o + "has been kicked butt"
    print(result)
} else {
    print("Nil nil nil")
}
     
// nil colascing ?? - simplicity

// guard let
// guard let always has a return, and exits the current scope  (more clarity)

func encriptString(optionalString: String?) -> String {
    guard let constantString = optionalString else {return "_"}
    return constantString
}

// guard..else

func checkHeight(height: Int) -> Bool {
    guard height < 130 else { return false}
    return true
}

// optional chaining

class Address {
    var stNa:String? = "713 Msl Street"
}
class Owner {
    var address: Address?
}
let owner: Owner? = Owner.init()
let osAddress: Address? = Address.init()

owner?.address = osAddress
let streetName = owner?.address?.stNa   //(question mark chaining haha) - safety
print(streetName) // if any chain component is nil, the chain break

// force unwrapping - very dangerous

var jk: Int? = 33

if jk != nil {  // do this to make force unwrapping a little more acceptable but still ..
    print(jk!)
}

// unwrap optional using swtch cases
  

fileprivate func unwrapWithSwitch(opVar: String?)-> String {
  switch (opVar) {
  case let ("not nil"):
    return "\(opVar)"
  case (nil):
    return "nothing"
  default:
    return "default"
  }
}
// no idea what the heck I'm thinking here smh (composed this load of crap)


// MARS: - Higher-Order Functions

func CompactMapEx() {
    let op1: String? = "Lok"
    let op2: String? = "Mit"
    
    let ar = [op1, op2, nil, ""]
    let unwrappedAr = ar.compactMap({$0})
    print(unwrappedAr)
}

func MapEx() {
    let mappable = ["shabee", "nubee"].map({$0.capitalized})
    print(mappable)
}

func FlatMapEx(){
    let flapped = [[3, 1], [11, 101], [77, 13]].flatMap({$0})
    print(flapped)
}

func FilterEx() {
    let filteration = ["shabee", "nubee", "kubee"].filter({$0.count <= 5})
    print(filteration)
}

CompactMapEx()
MapEx()
FlatMapEx()
FilterEx()
      
class BatchMate {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let kingsley = BatchMate(name: "Kingsley")
let sheryl = BatchMate(name: "Sheryl")
let chen = BatchMate(name: "Chen")
let omar = BatchMate(name: "Omar")
let batchmateList = [kingsley, sheryl, chen, omar].map({$0.name})
batchmateList.filter({$0.count >= 5})

// MARS: - July 8th Notes

enum info: CaseIterable {
    case name
    case hobby
}

var mInfo = [info: String]()

for cases in info.allCases {
    switch cases {
    case .hobby:
        mInfo[.hobby] = "set value to .hobby"
    case .name:
        mInfo[.name] = "set value to .name"
    }
}
print(mInfo.values)

#warning("my own warning message (look to the right)")


var intCollection = [1,3, 5, 7, 9, 11, 13, 15, 17]

// shuffled vs shuffle()
let q = intCollection.shuffle()
print(q)
print(intCollection)
print(intCollection.shuffled())
print(intCollection)

intCollection.allSatisfy { (individualNumber) -> Bool in
    return individualNumber >= 7
}
intCollection.allSatisfy{$0 >= 7}

            
