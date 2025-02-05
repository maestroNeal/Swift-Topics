/*
 
 MARK: Codable is a type alias for both Encodable and Decodable.
 - Codable is a type alias for two protocols: Encodable & Decodable.
 Reduces boilerplate code compared to manual serialization.

 MARK: typealias is used to create an alternative name for an existing type.
 It helps in improving readability, reducing complexity, and making code more manageable.
 
 MARK: - Encodable
 - Encodable is used when you want to convert a Swift object into JSON (or another format).
 - Works with JSONEncoder.
 
 
 MARK: - Decodable
 - Decodable is used when you need to convert JSON data into a Swift object.
 - Works with JSONDecoder.
 
 */

import Foundation

typealias Codable = Encodable & Decodable

public typealias Name = String

struct User : Encodable {
    let userId: Int
    let name: Name
    
}

class Encodable_Decodable {
    let user : User? = User(userId: 01, name: "Rahul Gangwar")
    
    func printEncodedData(){
        if let jsonData = try? JSONEncoder().encode(user) {
            let jsonString =  String(data: jsonData, encoding: .utf8)
            debugPrint(jsonString ?? "Encoding Failed")
        }
    }
}
var data = Encodable_Decodable()
data.printEncodedData()




