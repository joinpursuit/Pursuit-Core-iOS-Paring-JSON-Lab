//
//  Weather.swift
//  ParsingJSON
//
//  Created by Yuliia Engman on 11/27/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [WeatherInCity]
}

struct WeatherInCity: Codable{
    let name: String
    let main: [String: Double]
    let wind: [String: Double]
    let clouds: [String: Int]
}

extension WeatherData {
    static func getWeather() -> [WeatherInCity] {
        var cityweather = [WeatherInCity]()
        
        guard let fileURL = Bundle.main.url(forResource: "weatherDataFile", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            cityweather = weatherData.list
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return cityweather
    }
}

