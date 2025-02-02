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
    deinit {
        debugPrint("iosEngineer class removed")
    }
}

class androidEnginner: Employee {
    func getLang(){
        print("\(name) have knowledge of java and kotlin.")
    }
    deinit {
        debugPrint("androidEnginner class removed")
    }
}

protocol devOpsEngineerSkillsSet {
    func getDevOpsEngineerInfo()
}
class devOpsEngineer: Employee, devOpsEngineerSkillsSet {
    deinit {
        debugPrint("devOpsEngineer class removed")
    }
}

protocol backEndSkillsSet {
    func getBackEndEngineerInfo()
}
class backEndEngineer : Employee, backEndSkillsSet {
    deinit {
        debugPrint("backEndEngineer class removed")
    }
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


var emp: Employee? = Employee(name: "jai")
    emp?.getDetails()
emp = nil
var emp1:iosEngineer? = iosEngineer(name: "Rahul")
    emp1?.getDetails()
    emp1?.getLang()
    emp1?.getBackEndEngineerInfo()
    emp1?.getDevOpsEngineerInfo()
emp1 = nil
