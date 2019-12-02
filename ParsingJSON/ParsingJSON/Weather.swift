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

struct WeatherInCity: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let clouds: Clouds
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}

struct Clouds: Codable {
    let all: Int
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
            cityweather = weatherData.list.sorted{$0.name < $1.name}
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return cityweather
    }
}
