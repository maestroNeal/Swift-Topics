/*

 //MARK: - Class
 A class is a reference type, meaning that when an instance is assigned to another variable, it does not create a new copy. Instead, both variables refer to the same instance in memory.

 Key Features of Class
 Reference Type (Stored in Heap)
 Supports Inheritance
 Automatic Reference Counting (ARC)
 Mutable Even When Assigned to a Constant (let)
 Can Have Deinitializers (deinit)
 
 //MARK: - Struct
 A struct is a value type, meaning that when an instance is assigned to another variable, a new copy is created.

 Key Features of Struct
 Value Type (Stored in Stack)
 Does NOT Support Inheritance
 Does NOT Require ARC
 Immutable When Declared as let
 More Performance Efficient for Small Data Models
 
*/

import Foundation

class Human {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    deinit{
        debugPrint("Human deinit")
    }
    
    func haveBirthdat() {
        self.age += 1
    }
    
}

class Worker: Human {
    var company: String
    
    init(company: String, name: String, age: Int) {
        self.company = company
        super.init(name: name, age: age)
    }
    deinit{
        debugPrint("Worker deinit")
    }
    
}

var obj : Worker? =  Worker(company: "Hastree", name: "jai", age: 23)
var newObj = obj
debugPrint("\(obj?.age) year old worker \(obj?.name) works in \(obj?.company)")
obj?.haveBirthdat()
obj?.haveBirthdat()
debugPrint(obj?.age)
debugPrint(newObj?.age)

struct Company {
    
    let companyName: String
    let worker: Human?
    var value: Int
    
    init(companyName: String, worker: Human?, value: Int) {
        self.companyName = companyName
        self.worker = worker
        self.value = value
    }
    mutating func companyUpdate(increase:Int? = nil, decreses:Int? = nil){
        if decreses ?? 0 < value {
            self.value -= decreses ?? 0
        }
        if increase != nil {
            self.value += increase ?? 0
        }
       
    }
    
}

var company : Company? = Company(companyName: "Hastree", worker: nil, value: 100000)
var newCompany = company
newCompany?.companyUpdate(decreses: 100)
company?.companyUpdate(increase: 100)
debugPrint(company?.value)
debugPrint(newCompany?.value)

