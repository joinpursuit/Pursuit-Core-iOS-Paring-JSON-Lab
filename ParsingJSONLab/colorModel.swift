//
//  colorModel.swift
//  ParsingJSONLab
//
//  Created by Sam Roman on 8/27/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit

enum JSONError: Error {
    case decodingError(Error)
}

struct Colors: Codable {
    var colors: [ColorValue]
    
    static func getColors(from data: Data) throws -> [Colors] {
        do {
            let colors = try JSONDecoder().decode([Colors].self, from: data)
            return colors
        } catch {
            //            fatalError("couldn't decode")
            throw JSONError.decodingError(error)
        }
    }
}

struct ColorValue: Codable {
    var hex: hexWrapper
    var name: nameWrapper
    var rgb: rgb
}

struct nameWrapper: Codable {
    var value: String
}

struct rgb: Codable {
    var fraction: fractionWrapper
}

struct fractionWrapper: Codable {
    var r: Double
    var g: Double
    var b: Double
}

struct hexWrapper: Codable {
    var value: String
}


