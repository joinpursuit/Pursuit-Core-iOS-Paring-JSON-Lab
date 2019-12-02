//
//  jSONModel.swift
//  ParsingJSON
//
//  Created by Bienbenido Angeles on 11/25/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct Weather:Codable{
    let list: [HeadLineData]
}

struct HeadLineData:Codable {
    var name: String
    var main: [String:Double]
    //var weather : [WeatherDesc]
}

//struct WeatherDesc: Codable {
//    var main: String
//    var description: String
//}

extension HeadLineData{
    static func getTemp() -> [String:Double]{
        var dict = [String: Double]()
        guard let fileURL = Bundle.main.url(forResource: "customname", withExtension: ".json") else {
            fatalError("could not find json file")
        }
        do{
            let data = try Data(contentsOf: fileURL)
            let headLines = try JSONDecoder().decode(HeadLineData.self, from: data)
            dict = headLines.main
        } catch{
            fatalError("failed to parse data")
        }
        
        return dict
    }
}



extension Weather{
    static func getWeather() -> [HeadLineData]{
        var weather = [HeadLineData]()
        guard let fileURL = Bundle.main.url(forResource: "customname", withExtension: ".json") else {
            fatalError("could not find json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let headLines = try JSONDecoder().decode(Weather.self, from: data)
            weather = headLines.list
        } catch {
            fatalError("failed to parse data")
        }
        return weather
    }
}

//extension HeadLineData{
//    static func getWeatherDesc() -> [WeatherDesc]{
//        var weatherDesc = [WeatherDesc]()
//        guard let fileURL = Bundle.main.url(forResource: "customname", withExtension: ".json") else {
//            fatalError("could not find json file")
//        }
//        do{
//            let data = try Data(contentsOf: fileURL)
//            let weatherDescDec = try JSONDecoder().decode(HeadLineData.self, from: data)
//            weatherDesc = weatherDescDec.weather
//        } catch{
//            fatalError("failed to parse data")
//        }
//        return weatherDesc
//    }
//}
