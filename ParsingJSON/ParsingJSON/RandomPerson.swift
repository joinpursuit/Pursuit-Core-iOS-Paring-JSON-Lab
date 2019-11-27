//
//  RandomPerson.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/27/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

enum EitherOr: Decodable{
    case int(anInteger: Int)
    case string(aString: String)
    
    init(from decoder: Decoder) throws {
        if let xInt = try? decoder.singleValueContainer().decode(Int.self){
            self = EitherOr.int(anInteger: xInt)
            return
        }
        
        if let xString = try? decoder.singleValueContainer().decode(String.self){
            self = EitherOr.string(aString: xString)
            return
        }
        
        throw typeError.invalidData
    }
    
    enum typeError: Error{
        case invalidData
    }
}

struct RandomData: Decodable{
    var results: [RandomPerson]
}

struct RandomPerson: Decodable{
    var name: FullName
    var location: Address
    var email: String
    var dob: BirthDate
    var phone: String
}

struct FullName: Decodable{
    var title: String
    var first: String
    var last: String
}

struct Address: Decodable{
    var street: HouseAddress
    var city: String
    var state: String
    var country: String
    var postcode: EitherOr
}

struct HouseAddress: Decodable{
    var number: Int
    var name: String
}

struct BirthDate: Decodable{
    var date: String
    var age: Int
}

extension RandomPerson{
    
    static func getPeople() -> [RandomPerson]{
        var randomPeople = [RandomPerson]()
        guard let fileURL = Bundle.main.url(forResource: "RandomData", withExtension: "json") else {
            fatalError("Could not access file named \"RandomData.json\"")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let peopleData = try JSONDecoder().decode(RandomData.self, from: data)
            randomPeople = peopleData.results
            
        }catch{
            
            print("Could not access data. Error: \(error)")
            
        }
        return randomPeople
    }
    
}
