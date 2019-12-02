//
//  randomUserModel.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct ResultsData:Codable{
    var results: [Results]
}

struct Results:Codable {
    var name: NameData1
    var email: String
    var location: LocationData
    var phone: String
    var dob: DOBData
}
struct NameData1:Codable{
    var title: String
    var first: String
    var last:String
}

struct LocationData:Codable {
    var street: StreetData
    var city: String
    var state: String
    var country: String
    var postcode: IntOrString
    
}

//Need help understanding this code block
//https://stackoverflow.com/questions/50526204/how-to-decode-a-json-property-with-different-types
enum IntOrString: Codable {
    case int(Int)
    case string(String)

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let v): try container.encode(v)
        case .string(let v): try container.encode(v)
        }
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()

        if let v = try? value.decode(Int.self) {
            self = .int(v)
            return
        } else if let v = try? value.decode(String.self) {
            self = .string(v)
            return
        }

        throw IntOrString.ParseError.notRecognizedType(value)
    }

    enum ParseError: Error {
        case notRecognizedType(Any)
    }
}

struct StreetData:Codable {
    var number: Int
    var name: String
}

struct DOBData:Codable {
    var date: String
    var age: Int
}

extension Results{
    static func getUsers() -> [Results]{
        var users = [Results]()
        
        guard let fileURL = Bundle.main.url(forResource: "randomUser", withExtension: "json") else {
            fatalError("randomUser.json not found")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(ResultsData.self, from: data)
            users = userData.results
            
        }catch{
            print("Could not load data. Error: \(error)")
        }
        
        return users
    }
}
