//
//  Color.swift
//  parsing-jSON-lab
//
//  Created by Ahad Islam on 12/5/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

struct ColorWrapper: Codable {
    let count: String
    let colors: [Color]
}

struct Color: Codable {
    let hex: Hex
    let rgb: RGB
    let name: Name
}

struct Hex: Codable {
    let value: String
}

struct RGB: Codable {
    let r: Int
    let g: Int
    let b: Int
    let value: String
}

struct Name: Codable {
    let value: String
}

extension Color {
    static func getColors(from data: Data) throws -> [Color] {
        do {
            let colors = try JSONDecoder().decode(ColorWrapper.self, from: data)
            return []
        }
    }
}
