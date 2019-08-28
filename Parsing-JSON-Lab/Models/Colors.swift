//
//  Colors.swift
//  Parsing-JSON-Lab
//
//  Created by Eric Widjaja on 8/27/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//
import UIKit
import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct AllColors: Codable {
    let colors: [ColorsInfo]
    
    static func getColors(from data: Data) throws -> [ColorsInfo] {
        do {
            let allColors = try JSONDecoder().decode(AllColors.self, from: data)
            return allColors.colors
            
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct ColorsInfo: Codable {
    let hex: hexWrapper
    let rgb: rgbWrapper
    let name: nameWrapper
    
}

struct hexWrapper: Codable {
    let value: String
    let clean: String
}

struct rgbWrapper: Codable {
    let fraction: fractionWrapper
    let value: String
}

struct fractionWrapper: Codable {
    let r: CGFloat
    let g: CGFloat
    let b: CGFloat
}

struct nameWrapper: Codable {
    let value: String
}
