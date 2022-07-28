//
//  WeatherModel.swift
//  Clima
//
//  Created by Kim Yewon on 2022/07/28.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case ..<300: return "cloud.bolt.rain.fill"
        case ..<400: return "cloud.drizzle"
        case ..<600: return "cloud.rain.fill"
        case ..<700: return "cloud.snow.fill"
        case ..<800: return "cloud.fog"
        case 800: return "sun.max.fill"
        case ..<900: return "cloud"
        default: return ""
        }
    }
    
    
}
