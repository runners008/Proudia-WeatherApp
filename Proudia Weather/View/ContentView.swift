//
//  ContentView.swift
//  Proudia Weather
//
//  Created by Runn Siriphuwanich on 11/7/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = WeatherViewModel()
    @State private var cityNameInput: String = "Bangkok"
    @State private var isCelsius: Bool = true
    @State private var isSheetOpened: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            TextField("Search city", text: $cityNameInput, onCommit: {
                let request = WeatherModel.Request(city: cityNameInput, unit: isCelsius ? "metric" : "imperial")
                model.fetchCurrentWeather(request: request)
            })
            .padding()
            .foregroundColor(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.black, lineWidth: 1.0))
            
            if let weather = model.weatherResponse {
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        HStack(alignment: .firstTextBaseline ,spacing: 8) {
                            Text(weather.capitalizedCityName).font(.system(size: 48, weight: .bold))
                            Spacer()
                            Text("Now").font(.system(size: 24, weight: .light))
                        }
                        Text(weather.weatherDescription).font(.system(size: 24, weight: .light))
                        HStack {
                            Text(weather.temperatureString).font(.system(size: 60, weight: .regular))
                            Text(isCelsius ? " °C" : " °F").font(.system(size: 60, weight: .regular))
                            Spacer()
                            Button(action: {
                                isCelsius.toggle()
                                let request = WeatherModel.Request(city: cityNameInput, unit: isCelsius ? "metric" : "imperial")
                                model.fetchCurrentWeather(request: request)
                            }) {
                                Text(isCelsius ? "°C" : "°F")
                                    .font(.headline)
                                    .padding()
                                    .cornerRadius(8)
                            }
                        }
                        HStack {
                            Spacer()
                            Image(systemName: weather.conditionName).resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            Spacer()
                        }
                        Text("Humidity: \(weather.humidity)%").font(.system(size: 32, weight: .regular))
                        Button {
                            self.isSheetOpened = true
                        } label: {
                            Text("Click for hourly forecast.")
                        }
                        
                        
                    }
                    Spacer()
                }
                Spacer()
            }
            else {
                ProgressView()
            }
            }
                .sheet(isPresented: $isSheetOpened, content: {
                    WeatherDetailView(
                        hourlyInfo: model.weatherResponse?.forecast ?? [],
                        isCelsius: isCelsius
                    )
                })
                .padding(.vertical, 60)
                .padding(.horizontal, 8)
                .background(model.weatherResponse?.backgroundColor)
                .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
