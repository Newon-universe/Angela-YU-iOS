import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    // if you try to load data from "http", you got error of "App Transport Security policy requires the use of a secure connection."
    // than you should use https
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ea19a6872a1856598051300b953de50e&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func perfomrRequest(with urlString: String) {
        // 1. create a URL
        if let url = URL(string: urlString) {
           
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task -- in this point, task is suspended until called resume()
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString)
//                    JSON == JavaScript bject Notation
                    
                    if let weather = self.parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    
    func parseJSON(_ wearherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        //.self is for representing structure, for proving it's not object
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: wearherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                        
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

//MARK: - Fetch Collections

extension WeatherManager {
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        perfomrRequest(with: urlString)
    }
    
    func fetchWeather(_ latitude: Double, _ longitude: Double) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        perfomrRequest(with: urlString)
    }
    
}
