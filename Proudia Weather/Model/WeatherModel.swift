//
//  WeatherModel.swift
//  Proudia Weather
//
//  Created by Runn Siriphuwanich on 11/7/2566 BE.
//

import Foundation
import SwiftUI
struct WeatherModel {
    struct Request {
        let city: String
        let unit: String
    }
    struct Response {
        let cityName: String
        let conditionName: String
        let temperature: Double
        let humidity: Int
        let weatherDescription: String
        let backgroundColor: Color
        let forecast: [ForeCastModel.Response]
        
        var capitalizedCityName: String {
            return cityName.capitalized
        }
        
        var temperatureString: String {
            return String(format: "%.1f", temperature)
        }
    }
}

struct ForeCastModel {
    struct Request {}
    struct Response {
        let temperature: Double
        let description: String
        let conditionName: String
        let tileColor: Color
        let time: String
        
        var temperatureString: String {
            return String(format: "%.1f", temperature)
        }
    }
}
