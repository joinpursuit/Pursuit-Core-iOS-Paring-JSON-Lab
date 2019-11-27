//
//  Colour.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/27/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

struct ColourData: Codable{
    var colors: [Colour]
}

struct Colour: Codable{
    var name: ColourName
    var hex: HexValue
    var rgb: RGBValue
}

struct ColourName: Codable{
    var value: String
}

struct HexValue: Codable{
    var value: String
    var clean: String
}

struct RGBValue: Codable{
    var fraction: RGBDecimal
}

struct RGBDecimal: Codable{
    var r: Double
    var g: Double
    var b: Double
}

extension Colour{
    static func getColours() -> [Colour]{
        var colours = [Colour]()
        
        guard let fileURL = Bundle.main.url(forResource: "ColourData", withExtension: "json") else {
            fatalError("Could not access file named \"ColourData.json\".")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let colourData = try JSONDecoder().decode(ColourData.self, from: data)
            colours = colourData.colors
            
        }catch{
            print("Could not load data. Error: \(error)")
        }
        
        return colours
    }
}
