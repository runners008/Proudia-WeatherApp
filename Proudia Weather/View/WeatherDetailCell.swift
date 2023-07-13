//
//  WeatherDetailCell.swift
//  Proudia Weather
//
//  Created by Runn Siriphuwanich on 11/7/2566 BE.
//

import SwiftUI

struct WeatherDetailCell: View {
    let hourlyInfo: ForeCastModel.Response
    let isCelsius: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(hourlyInfo.tileColor)
                .padding(EdgeInsets(top: -20, leading: -20, bottom: -20, trailing: -20))
                .frame(height: 60)
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(formattedDate(date: hourlyInfo.time))
                        .font(.system(size: 18, weight: .medium))
                    Text(hourlyInfo.description)
                        .font(.system(size: 18, weight: .light))
                }
                Spacer()
                VStack {
                    Image(systemName: hourlyInfo.conditionName).resizable()
                        .scaledToFit()
                    .frame(width: 40, height: 40)
                }
                Spacer()
                HStack {
                    Text(hourlyInfo.temperatureString)
                        .font(.system(size: 26, weight: .medium))
                    Text(isCelsius ? "°C" : "°F")
                        .font(.system(size: 26, weight: .medium))
                }
            }
        }
    }
    
    func formattedDate(date: String) -> String {
        let oldDateFormat = DateFormatter()
        let newDateFormat = DateFormatter()
        
        oldDateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        newDateFormat.dateFormat = "dd MMM h a"
        
        let newDate = oldDateFormat.date(from: date)
        let formattedDate = newDateFormat.string(from: newDate ?? Date())
        
        return formattedDate
    }
    
}

struct WeatherDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailCell(hourlyInfo: ForeCastModel.Response(temperature: 41.0, description: "Sunny", conditionName: "cloud", tileColor: Color.mint, time: "12.00 AM"), isCelsius: true)
    }
}
