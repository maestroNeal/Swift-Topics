import UIKit

class Employee {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    func getDetails() {
        print("\(name) is the employee of hastree.")
    }
    deinit {
        debugPrint("Employee class removed")
    }
}
protocol iosEngineerSkillsSet {
    func getLang()
}
class iosEngineer: Employee, iosEngineerSkillsSet, devOpsEngineerSkillsSet, backEndSkillsSet {
}

class androidEnginner: Employee {
    func getLang(){
        print("\(name) have knowledge of java and kotlin.")
    }
}

protocol devOpsEngineerSkillsSet {
    func getDevOpsEngineerInfo()
}
class devOpsEngineer: Employee, devOpsEngineerSkillsSet {
    
}

protocol backEndSkillsSet {
    func getBackEndEngineerInfo()
}
class backEndEngineer : Employee, backEndSkillsSet {
   
}

extension iosEngineerSkillsSet {
    func getLang() {
        print("knowledge of swift and swiftUI.")
    }
}

extension devOpsEngineerSkillsSet {
    func getDevOpsEngineerInfo(){
        print("jenkins")
    }
}
extension backEndSkillsSet {
    func getBackEndEngineerInfo(){
        print("kafka")
    }
}


    let emp = Employee(name: "jai")
    emp.getDetails()
    let emp1 = iosEngineer(name: "Rahul")
    emp1.getDetails()
    emp1.getLang()
    emp1.getBackEndEngineerInfo()
    emp1.getDevOpsEngineerInfo()

