//
//  WeatherModel.swift
//  Weather Map
//
//  Created by Hồ Bảo An on 09/02/2023.
//

import Foundation

struct Weather: Codable{
    let name: String
    let timezone: Int
    let main: Main
    let coord: Coord
    let wind: Wind
    let clouds: CloudS
    let weather: [WeatherElement]
}

struct Coord: Codable {
    let lat: Double
    let lon: Double
}

struct Main: Codable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}

struct CloudS: Codable {
    let all: Int
}

struct WeatherElement: Codable {
    let icon: String
}
