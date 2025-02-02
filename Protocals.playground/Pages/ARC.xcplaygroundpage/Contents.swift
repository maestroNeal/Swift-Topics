/*
 
 //MARK: Memory Management
 Memory management in Swift is handled by Automatic Reference Counting (ARC), which tracks and manages object lifecycles by counting references(strong).
 When the reference count drops to zero, the object is automatically deallocated.
 However, ARC can create retain cycles, which lead to memory leaks. To prevent this, we use weak and unowned references.
 Memory management also applies to closures, where captured values can cause retain cycles, and we resolve them using [weak self]
 
 //MARK: 1. How ARC Works:
 When an object is created, ARC assigns it a reference count.
 Every time a new reference is made to the object, the count increases.
 When a reference is removed, the count decreases.
 Once the reference count reaches zero, the object is automatically deallocated from memory.
 
 //MARK: 2. Retain Cycles and Solutions:
 If two objects hold strong references to each other, they create a retain cycle, preventing deallocation (causing a memory leak).
 To fix this, Swift provides weak and unowned references to break strong reference cycles.
 
 //MARK: 3. Memory Issues in Closures:
 Closures capture values, which can create memory leaks if a class captures itself strongly.
 To avoid this, use [weak self] or [unowned self] inside closures.
 
 //MARK: No ARC For Structs/Enums
 ARC (Automatic Reference Counting) does not apply to structs in Swift.
 ARC is used only for reference types (classes) because they are stored in the heap and shared across different parts of the program.

 Why Doesn't ARC Apply to Structs?

 Structs are value types, meaning they are copied whenever assigned to a new variable or passed to a function.
 Each copy is independent, so there is no shared reference that needs ARC to track it.
 Since structs are stored on the stack (in most cases), Swift automatically manages their memory without the need for ARC.
 
 //MARK: When Are Structs Stored on the Heap?
 Although structs are usually stored on the stack, Swift can store them on the heap in certain cases, such as:
 When a struct/Enums is inside a class.
 When using large structs that exceed a certain threshold.
 When using escaping closures that capture a struct.
 However, even in these cases, ARC still does not apply to structs, only to the class that holds them.
 */

import Foundation

class iOSDevloper {
    var name: String
    var company: Company?
    
    init(_ name: String) {
        self.name = name
        debugPrint("\(name) allocated to company.")
    }
    deinit {
        debugPrint("\(name) deallocated from company.")
    }
}
 
class androidDev {
    let name: String
    var company: Company?
    
    init(_ name: String) {
        self.name = name
        debugPrint("\(name) allocated to company.")
    }
    deinit {
        debugPrint("\(name) deallocated from company.")
    }
    
}
class backEndDev {
    var name: String
    var company: Company?
    
    init(name: String) {
        self.name = name
        debugPrint("\(name) allocated to company.")
    }
    deinit{
        debugPrint("\(name) deallocated from company.")
    }
}

class Company {
    let name: String
    var iOSDev: iOSDevloper?
    weak var android: androidDev?
    unowned var bandEnd: backEndDev
    
    init(_ name: String, bandEnd: backEndDev) {
        self.name = name
        self.bandEnd = bandEnd
        debugPrint("\(name) allocated.")
    }
    deinit {
        debugPrint("\(name) deallocated")
    }
}
var rocky: backEndDev? = backEndDev(name: "Rocky")
var hastree: Company? = Company("Hastree", bandEnd: rocky!)
var rahul: iOSDevloper? = iOSDevloper("Rahul")
var jai: androidDev? = androidDev("Jai")

//here only jai and rocky is deallocated beacuse we make the property(android) weak for optionals and unowned for non-optionals
hastree?.iOSDev = rahul
hastree?.android = jai
hastree?.bandEnd = rocky!
rahul?.company = hastree
jai?.company = hastree
hastree = nil
rahul = nil
jai = nil
rocky = nil
