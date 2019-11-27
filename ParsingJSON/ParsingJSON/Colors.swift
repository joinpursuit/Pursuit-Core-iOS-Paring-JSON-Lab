//
//  Colors.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/27/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import Foundation

struct ColorsData: Codable {
    let colors: [Colors]
}

struct Colors: Codable {
    let hex: Hex
    let rgb: RGB
    let name: Name
}

struct Hex: Codable {
    let value: String
    let clean: String
}

struct RGB: Codable {
    let value: String
}

struct Name: Codable {
    let value: String
    let closest_named_hex: String
    let exact_match_name: Bool
    let distance: Int
}

extension ColorsData {
    static func getColors() -> [Colors] {
        var color = [Colors]()
        
        guard let fileURL = Bundle.main.url(forResource: "colorData", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let colorData = try JSONDecoder().decode(ColorsData.self, from: data)
            color = colorData.colors.sorted{$0.name.value < $1.name.value}
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return color
    }
}

