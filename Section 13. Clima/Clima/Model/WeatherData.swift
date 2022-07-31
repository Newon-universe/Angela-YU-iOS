import Foundation

struct WeatherData: Codable {
    let coord: Coord
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Weather: Codable {
    let id: Int
    let description: String
}

struct Main: Codable {
    let temp: Double
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}
