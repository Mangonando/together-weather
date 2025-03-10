// Here the fetch and process of WeatherData will happen
import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    
    private let apiKey = "381d05859658f31ed63e13e5da45cbef"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeatherData(lat: Double, lon: Double) {
        guard let url = URL(string: "\(baseUrl)?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric") else {
            print("Invalid URL")
            return
        }
        
        print("Fetching weather from: \(url.absoluteString)")
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if error != nil {
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
