//: [Previous](@previous)

import UIKit

@objc public enum RequiredLanguage: Int {
    case english, japanese, spanish
    
     var language: String {
        switch self {
        case .english:
            return "English"
        case .japanese:
            return "Japanese"
        case .spanish:
            return "Spanish"
        }
    }
}

@objc public protocol PublicProtocal {
    @objc optional func sayHello(in lang: RequiredLanguage)
}

class SetLanguage {
    
    public weak var greetingDelegate: PublicProtocal?
    
    init(){
        debugPrint("Set Language init")
    }
    deinit {
        debugPrint("Set Language deinit")
    }
    
    func setLangForGreeting(lang: RequiredLanguage){
        greetingDelegate?.sayHello?(in: lang)
    }
    
}

class Greetings: PublicProtocal {
    
    private var languageHandler: SetLanguage?
    var requiredLanguage: RequiredLanguage?
    
    func sayHello(in lang: RequiredLanguage) {
        debugPrint(greeting(lang: lang) + " Rahul")
    }
    init(requiredLanguage: RequiredLanguage? = nil, languageHandler: SetLanguage? = nil) {
            self.requiredLanguage = requiredLanguage
            self.languageHandler = languageHandler
            
            self.languageHandler?.greetingDelegate = self
            self.languageHandler?.setLangForGreeting(lang: requiredLanguage ?? .english)
            
            debugPrint("Greetings init")
        }
    
    deinit {
        debugPrint("Greetings deinit")
    }
    func removeLanguage() -> (Bool , String ){
        do {
            try performRemoveLanguage()
            return (true, "Language Removed")
        }catch {
            return (false, "Failed to remove language handler: \(error.localizedDescription)")
        }
        
    }
    private func performRemoveLanguage() throws {
        guard languageHandler != nil else {
            throw NSError(domain: "LanguageHandlerError", code: 404, userInfo: [NSLocalizedDescriptionKey: "No language handler to remove"])
        }
        languageHandler = nil
    }
    
    private func greeting(lang: RequiredLanguage) -> String {
        switch lang {
        case .english:
            return "Hello"
        case .japanese:
            return "こんにちは"
        case .spanish:
            return "Holla"
        }
    }
}
let greeting = Greetings(requiredLanguage: .english, languageHandler: SetLanguage())
debugPrint(greeting.removeLanguage().self)
print(greeting.removeLanguage().self)



