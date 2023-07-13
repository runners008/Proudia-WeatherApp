//
//  WeatherDetailView.swift
//  Proudia Weather
//
//  Created by Runn Siriphuwanich on 11/7/2566 BE.
//

import SwiftUI

struct WeatherDetailView: View {
    let hourlyInfo: [ForeCastModel.Response]
    let isCelsius: Bool
    var body: some View {
        
        VStack(spacing: 8) {
            Text("Forecast").font(.headline).padding()
            
            List(hourlyInfo, id: \.temperature) { hour in
                WeatherDetailCell(hourlyInfo: hour, isCelsius: isCelsius).padding()
            }.listRowSeparator(.hidden)
                .padding(EdgeInsets(top: -20, leading: -20, bottom: -20, trailing: -20))
        }
        }
    }

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(hourlyInfo: [ForeCastModel.Response(temperature: 40.1, description: "Sunny", conditionName: "cloud", tileColor: .mint, time: "12.00AM")], isCelsius: true)
    }
}
