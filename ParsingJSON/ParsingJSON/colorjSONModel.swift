//
//  colorjSONModel.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct ColorData: Codable{
    
    var colors: [Colors]
}

struct Colors:Codable {
    var hex: HexData
    var rgb: RGBData
    var name: NameData
}

struct HexData:Codable {
    var value:String
    var clean: String
}
struct RGBData: Codable {
    var fraction: RGBDecimalVal
    var value: String
}

struct NameData:Codable {
    var value: String
}

struct RGBDecimalVal:Codable {
    var r: Double
    var g: Double
    var b: Double
}

extension Colors{
    static func getColor() -> [Colors]{
        var colors = [Colors]()
        
        guard let fileURL = Bundle.main.url(forResource: "colorData", withExtension: "json") else {
            fatalError("colorData.json not found")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            colors = colorData.colors
            
        }catch{
            print("Could not load data. Error: \(error)")
        }
        
        return colors
    }
}

