import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let weather = viewModel.weatherData {
                Text("\(weather.name)")
                Text("\(weather.main.temp)")
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
