import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var cityName: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                TextField("Enter city name", text: $cityName)
                Button(action: {
                    viewModel.getWeatherData(city: cityName)
                }) {
                    Text("Search")
                }
            }
            if let weather = viewModel.weatherData {
                Text("\(weather.name), \(weather.sys.country)")
                Text("\(weather.main.roundedTemp) °c")
                Text("\(weather.main.roundedFeelsLike) °c")
                Text("\(weather.main.roundedTempMin) °c")
                Text("\(weather.main.roundedTempMax) °c")
                Text("\(weather.weather[0].main)")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onAppear{
            viewModel.getWeatherData(city: "Berlin")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
