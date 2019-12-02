//
//  RandomData.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/27/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import Foundation


struct UserData: Codable {
    let results: [Results]
}

struct Results: Codable {
    let name: Name2
    let email: String
    let location: Location
    let phone: String
    let cell: String
    let dob: DOB
}

struct Name2: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct DOB: Codable {
    let date: String
    let age: Int
}

        
extension UserData {
static func getUsersData() -> [Results] {
var result = [Results]()
    
    guard let fileURL = Bundle.main.url(forResource: "randomUserData", withExtension: "json") else {
        fatalError("could not locate json file")
    }
    do {
        let data = try Data(contentsOf: fileURL)
        
        let userData = try JSONDecoder().decode(UserData.self, from: data)
        
        result = userData.results.sorted{$0.name.last < $1.name.last}
    } catch {
        fatalError("fail to load contents \(error)")
    }
    return result
    }
}


