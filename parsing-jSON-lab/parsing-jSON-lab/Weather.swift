//
//  weather.swift
//  parsing-jSON-lab
//
//  Created by Ahad Islam on 11/12/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}


struct Weather: Codable {
    let id: Double
    let name: String
    let coord: LonLat
    let main: WeatherStatistic
    let dt: Double
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
    let weather: [WeatherDesc]
    
    struct LonLat: Codable {
        let lon: Double
        let lat: Double
    }
    
    struct WeatherStatistic: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let sea_level: Double?
        let grnd_level: Double?
        let humidity: Double
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Double
    }
    
    struct Rain: Codable {
        let threeh: Double
        
        private enum CodingKeys: String, CodingKey {
            case threeh = "3h"
        }
    }
    
    struct Clouds: Codable {
        let all: Double
    }
    
    struct WeatherDesc: Codable {
        let id: Double
        let main: String
        let description: String
        let icon: String
    }
    
    
    static func getWeather(from data: Data) throws -> [Weather] {
        do {
            let weather = try JSONDecoder().decode([Weather].self, from: data)
            return weather
        } catch {
            throw JSONError.decodingError(error)
        }
}
}


