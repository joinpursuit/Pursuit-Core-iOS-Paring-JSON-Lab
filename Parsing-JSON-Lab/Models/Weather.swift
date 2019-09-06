//
//  Weather.swift
//  Parsing-JSON-Lab
//
//  Created by Eric Widjaja on 8/28/19.
//  Copyright © 2019 Eric Widjaja. All rights reserved.
//
import UIKit
import Foundation


struct CitiesWeather: Codable {
    let list: [CitiesInfo]
}

struct CitiesInfo: Codable {
    let name: String
    let main: mainWrapper
    let weather: [weatherWrapper]
    static func getWeather(from data: Data) throws -> [CitiesInfo] {
        do {
            let weatherCities = try JSONDecoder().decode(CitiesWeather.self, from: data)
            return weatherCities.list

        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct mainWrapper: Codable {
    let temp: Double
}

struct weatherWrapper: Codable {
    let description: String
    let main: String
}






































