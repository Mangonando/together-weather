import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            if let weather = viewModel.weatherData {
                Text("\(weather.name), \(weather.sys.country)")
                Text("\(weather.main.temp)")
                Text("\(weather.main.feels_like)")
                Text("\(weather.main.temp_min)")
                Text("\(weather.main.temp_max)")
                Text("\(weather.weather[0].main)")
            } else {
                Text("Fetching weather API")
            }
        }
        .onAppear {
            viewModel.getWeatherData(lat: 52.52, lon: 13.405)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
