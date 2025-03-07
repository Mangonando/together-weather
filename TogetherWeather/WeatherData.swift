// This is the model. Here the api response structure will be managed
import Foundation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
    
    struct Weather: Codable {
        let description: String
    }
    
    struct Main: Codable {
        let temp: Double
    }
}
