//
//  weatherModel.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit


struct CityList: Codable {
    var list: [City]
    
    static func getResult(from data: Data) throws -> [City] {
        do {
            let cities = try JSONDecoder().decode(CityList.self, from: data)
            return cities.list
        } catch {
            //            fatalError("couldn't decode")
            throw JSONError.decodingError(error)
        }
    }
}

struct City: Codable {
    var name: String
    var weather: [Weather]
}




struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
}
