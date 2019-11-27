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

//[{"id":2208791,"name":"Yafran","coord":{"lon":12.52859,"lat":32.06329},"main":{"temp":9.68,"temp_min":9.681,"temp_max":9.681,"pressure":961.02,"sea_level":1036.82,"grnd_level":961.02,"humidity":85},"dt":1485784982,"wind":{"speed":3.96,"deg":356.5},"rain":{"3h":0.255},"clouds":{"all":88},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]}


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
