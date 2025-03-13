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
                Text("\(weather.main.temp)")
                Text("\(weather.main.feels_like)")
                Text("\(weather.main.temp_min)")
                Text("\(weather.main.temp_max)")
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
