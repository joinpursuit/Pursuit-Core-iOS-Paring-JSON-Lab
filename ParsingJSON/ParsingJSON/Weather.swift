//
//  Weather.swift
//  ParsingJSON
//
//  Created by Cameron Rivera on 11/27/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

struct WeatherList: Codable{
    var list: [Weather]
}

struct Weather: Codable{
    var name: String
    var main: Temperature
    var weather: [WeatherWrapper]
}

struct WeatherWrapper: Codable{
    var description: String
}

struct Temperature: Codable{
    var temp: Double
}

extension WeatherList{
    static func getWeather() -> [Weather]{
        var weather = [Weather]()
        
        guard let fileURL = Bundle.main.url(forResource: "WeatherData", withExtension: "json") else {
            fatalError("Could not locate file named \"WeatherData.json\"")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            
            let weatherData = try JSONDecoder().decode(WeatherList.self, from: data)
            weather = weatherData.list
            
        } catch {
            print("Failed to load contents. Error: \(error)")
        }
        
        return weather
    }
}
