
//#MARK: - Generic
import Foundation

class Generic {

    init() {
        var a: Any = 99
        var b: Any = 0
        swapAny(&a, &b)
    }

    func swapAny(_ a: inout Any, _ b: inout Any) {
        let temp = a
        a = b
        b = temp
    }
}
//struct StringSaver: DataSaver {
//    typealias dataType = <#type#>
//    
//    func save(_ data: String) {
//        print("Saving string: \(data)")
//    }
//
//    func fetch() -> String {
//        return "Rahul"
//    }
//}

protocol IdentifiableEntity {
    associatedtype IDType
    var id: IDType { get }
    var title: String { get }
    var isActive: Bool { get }
}
struct User: IdentifiableEntity {
    let id: Int
    let title: String
    let isActive: Bool
    let email: String
}

struct Product: IdentifiableEntity {
    let id: Int
    let title: String
    let isActive: Bool
    let price: Double
}

struct Book: IdentifiableEntity {
    let id: Int
    let title: String
    let isActive: Bool
    let author: String
}
class EntityManager {
    func printDetails<T: IdentifiableEntity>(of entity: T) {
        print("🧾 ID: \(entity.id)")
        print("📖 Title: \(entity.title)")
        print("✅ Active: \(entity.isActive), \(entity)")
    }
}
let manager = EntityManager()

let user = User(id: 1, title: "Rahul", isActive: true, email: "rahul@x.com")
let product = Product(id: 2, title: "iPhone", isActive: false, price: 999)

manager.printDetails(of: user)
//manager.printDetails(of: product)
