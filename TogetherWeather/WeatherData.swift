// This is the model. Here the api response structure will be managed
import Foundation

struct WeatherData: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
    
    struct Weather: Codable {
        let description: String
    }
    
    struct Main: Codable {
        let temp: Double
    }
}
