//
//  WeatherViewModel.swift
//  Proudia Weather
//
//  Created by Runn Siriphuwanich on 11/7/2566 BE.
//

import Foundation
import SwiftUI
class WeatherViewModel: ObservableObject {
    @Published var weatherResponse: WeatherModel.Response?
    
    private let baseUrl = "http://api.openweathermap.org/data/2.5/forecast?id=524901"
    private let apiKey = "aa9f3f3d993a70cb4504ea66a83c5a27"
//    http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=aa9f3f3d993a70cb4504ea66a83c5a27&q=bangkok&units=metric
    
    init() {
        let request = WeatherModel.Request(city: "bangkok", unit: "metric")
        fetchCurrentWeather(request: request)
    }
    
    func fetchCurrentWeather(request: WeatherModel.Request) {
        let city = request.city.isEmpty ? weatherResponse?.cityName : request.city
        
        let urlString = "\(baseUrl)&appid=\(apiKey)&q=\(city ?? "")&units=\(request.unit)"
        print(urlString)
        let session = URLSession.shared
        let url = URL(string: urlString)!
            
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            if let weatherData = data {
                let decoder = JSONDecoder()
                do {
                let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                    guard let currentWeather = decodedData.list.first else { return }
                    
                    let cityName = request.city
                    let condId = currentWeather.weather[0].id
                    let conditionName = self.getConditionName(conditionId: condId)
                    let temp = currentWeather.main.temp
                    let humidity = currentWeather.main.humidity
                    let weatherDescription = currentWeather.weather[0].description
                    let weatherColor = self.getBackGroundColor(conditionId: condId)
                    var forecastWeather: [ForeCastModel.Response] = []
                    
                    for (index, forecast) in decodedData.list.enumerated() {
                        if (index != 0) {
                            let fTemp = forecast.main.temp
                            let fDesc = forecast.weather[0].main
                            let fTime = forecast.dt_txt
                            let fCondName = self.getConditionName(conditionId: forecast.weather[0].id)
                            let fCol = self.getBackGroundColor(conditionId: forecast.weather[0].id)
                            
                            forecastWeather.append(ForeCastModel.Response(
                                temperature: fTemp,
                                description: fDesc,
                                conditionName: fCondName,
                                tileColor: fCol,
                                time: fTime
                            ))
                        }
                    }

                    let weatherResponse = WeatherModel.Response(
                        cityName: cityName,
                        conditionName: conditionName,
                        temperature: temp,
                        humidity: humidity,
                        weatherDescription: weatherDescription,
                        backgroundColor: weatherColor,
                        forecast: forecastWeather
                    )
                    
                    DispatchQueue.main.async {
                        self.weatherResponse = weatherResponse
                    }
                } catch {
                    return
                }
            }
        }
            task.resume()
        
    }
    
    private func getConditionName(conditionId: Int) -> String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
    }
    
    private func getBackGroundColor(conditionId: Int) -> Color {
        switch conditionId {
        case 200...232, 300...321, 500...531, 801...804:
            return Color(red: 0.565, green: 0.6, blue: 0.631)
        case 600...622, 701...781:
            return Color(red: 0.725, green: 0.75, blue: 0.769)
        case 800:
            return Color(red: 0.467, green: 0.733, blue: 0.831)
        default:
            return Color(red: 0.565, green: 0.6, blue: 0.631)
        }
    }
    
    }
