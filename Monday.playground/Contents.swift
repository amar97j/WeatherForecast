import UIKit

let jsonData = """
{
    "city": "Kuwait",
    "temperature": 25,
    "condition": "Sunny",
    "forecast": [
        {
            "day": "Monday",
            "high": 29,
            "low": 17,
            "condition": "Partly Cloudy"
        },
        {
            "day": "Tuesday",
            "high": 18,
            "low": 13,
            "condition": "Rain"
        }
    ]
}
""".data(using: .utf8)!



struct Weather: Codable {
    
    var city: String
    var temperature: Int
    var condition: String
    var forecast: [Forecast]
    
    
    struct Forecast: Codable {
        var day: String
        var high: Int
        var low: Int
        var condition: String
        
        
    }
    
}


do {
    let weather = try JSONDecoder().decode(Weather.self, from: jsonData)
    
    print("City: \(weather.city)")
    print("Temperature: \(weather.temperature)°C")
    print("Condition: \(weather.condition)")
    
    print("\nForecast:")
    
    for dayForecast in weather.forecast {
        print("Day: \(dayForecast.day)")
        print("High: \(dayForecast.high)°C")
        print("Low: \(dayForecast.low)°C")
        print("Condition: \(dayForecast.condition)")
        print("-----")
    }
    
} catch {
    print("Decoding error: \(error)")
}


