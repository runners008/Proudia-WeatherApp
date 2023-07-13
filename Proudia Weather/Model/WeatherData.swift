//
//  WeatherData.swift
//  Proudia Weather
//
//  Created by Runn Siriphuwanich on 11/7/2566 BE.
//

import Foundation

struct WeatherData: Codable {
    let list: [WeatherInfo]
}

struct WeatherInfo: Codable {
    var id: UUID?
    let main: Main
    let weather: [Weather]
    let dt_txt: String
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
}
