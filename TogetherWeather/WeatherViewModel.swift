// Here the fetch and process of WeatherData will happen
import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    
    private let apiKey = "fe0e7506cb6f7cf9757ce482f344acd5"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeatherData(lat: Double, lon: Double) {
        guard let url = URL(string: "\(baseUrl)?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                print("Error fetching weather API")
                return
            }
            
            guard let data = data else {
                print("No data received response")
                return
            }
            
            do {let decodeData = try JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    self.weatherData = decodeData
                }
                print("JSON successfully decoded")
            }
            catch {print("Error decoding JSON")}
        }.resume()
    }
}
