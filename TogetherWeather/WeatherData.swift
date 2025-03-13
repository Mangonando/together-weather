// This is the model. Here the api response structure will be managed
import Foundation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
    let sys: Sys
    
    struct Weather: Codable {
        let description: String
        let main: String
    }
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    struct Sys: Codable {
        let country: String
    }
}
