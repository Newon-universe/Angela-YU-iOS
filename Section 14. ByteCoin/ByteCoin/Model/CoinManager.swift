//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(_ coinManager: CoinManager, error: Error)
    func didUpdateWeather(_ coinManager: CoinManager, coin: CoinData?)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "92EFCAB2-49F2-4991-8A31-027BE3C69EA4"
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    delegate?.didFailWithError(self, error: error)
                    return
                }
                
                if let safeData = data {
//                    let encodedData = String(decoding: safeData, as: UTF8.self)
//                    print(encodedData)
//                    delegate?.didUpdateWeather(self)
                    let lastPrice = parseJSON(safeData)
                    delegate?.didUpdateWeather(self, coin: lastPrice)
                }
            }
            task.resume()
        }
    }
}

//MARK: - method for getting data from UI

extension CoinManager {
    func getCoinPrice(for currency: String) {
        performRequest(with: "\(baseURL)/\(currency)?apikey=\(apiKey)")
    }
}


//MARK: - parsing

extension CoinManager {
    func parseJSON(_ data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = CoinData(time: decodedData.time, asset_id_base: decodedData.asset_id_base, asset_id_quote: decodedData.asset_id_quote, rate: decodedData.rate)
            
            return lastPrice
        } catch {
            delegate?.didFailWithError(self, error: error)
            return nil
        }
    }
}
