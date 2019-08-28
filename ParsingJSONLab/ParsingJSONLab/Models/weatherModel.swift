//
//  weatherModel.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit

struct Cities: Codable {
    var name: String
    var main: Main
    
    static func getResult(from data: Data) throws -> [Cities] {
        do {
            let cities = try JSONDecoder().decode([Cities].self, from: data)
            return cities
        } catch {
            //            fatalError("couldn't decode")
            throw JSONError.decodingError(error)
        }
    }
}


struct Main: Codable {
    var weather: Weather
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
}
