// This is the model. Here the api response structure will be managed
import Foundation

struct WeatherData: Codable {
    let name: String
    let temp: Double
    let description: [String]
}
