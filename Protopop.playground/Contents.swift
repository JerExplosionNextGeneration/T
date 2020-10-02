import Foundation
import UIKit

// 9.24 & 9.30 //


// 9/24 below ____________________________

protocol TogglableProtocol {
    mutating func toggle()
}

enum OnAndOff: TogglableProtocol {
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var electricSwitch = OnAndOff.on
electricSwitch.toggle()

protocol RandNumbGenerator: AnyObject { //class-only protocol
    func random() -> Double
}

protocol mockProtocol {
    mutating func whateverFunc()
    init(initializer1: String, initializer2: String)
    var protocolProperty: String { get }
}

extension mockProtocol {
    func whateverFunc() {
        print("whateverFunc inside protocol extension")
    }
}

struct MyStruct: mockProtocol {
    
    var protocolProperty: String { return "qpq"}
    var structProperty: String
    
    mutating func whateverFunc() {
        structProperty = structProperty + structProperty
        print("func inside struct")
    }
    
    init(initializer1: String, initializer2: String) {
        self.structProperty = initializer1
        //        self.protocolProperty = initializer2
    }
}

class MyClass: mockProtocol {
    var protocolProperty: String
    
    required init(initializer1: String, initializer2: String) {
        self.protocolProperty = initializer1 + initializer2
    }

    func whateverFunc() {
        print("whateverFunc inside class")
    }
}

var myObj = MyClass.init(initializer1: "init uno", initializer2: "init er")
myObj.whateverFunc()
 
 
 
// 9/30 below ___________________________________

@objc protocol ObjcPrintable {
    @objc optional func canPrint() -> Bool
}

protocol AppleEmployees {
    func attendWWDC()
}
extension AppleEmployees {
    func attendWWDC() {
        print("let's go")
    }
}
struct SteveJobs: AppleEmployees {
    func attendWWDC() {
        print("nah")
    }
}

protocol Logs {
    var fileName: String { get }
}

extension Logs {
    var fileName: String {
        return "default.logs"
    }
}

// 1. Default protocol implementation

// 2. Creating optional and required method for protocol

// 3. What type of property i can create inside protocol and its extension

// 4. Does init method allowed inside protocol


typealias CodableNewProtocolAlias = Encodable & Decodable
