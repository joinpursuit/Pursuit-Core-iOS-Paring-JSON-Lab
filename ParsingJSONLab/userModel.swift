//
//  userModel.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit
//name,email,address,dobb

struct Result: Codable {
    var name: userName
    var location: userLocation
    var email: String
    var dob: UserDOB
    var phone: String
    
    static func getResult(from data: Data) throws -> [Result] {
        do {
            let results = try JSONDecoder().decode([Result].self, from: data)
            return results
        } catch {
            //            fatalError("couldn't decode")
            throw JSONError.decodingError(error)
        }
    }
}



struct userName: Codable {
    var title: String
    var first: String
    var last: String
    
    
    
    func fullName() -> String {
        return "\(title) \(first) \(last)"
}
}

struct userLocation: Codable {
    var street: String
    var city: String
    var state: String
    
    func fullAddress() -> String {
    return "\(street), \(city), \(state)"
    }
    
}

struct UserDOB: Codable {
    var date: String
    var age: Int
}
