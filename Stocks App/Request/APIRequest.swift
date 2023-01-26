//
//  APIRequest.swift
//  Stocks App
//
//  Created by Shaurya Gupta on 2023-01-24.
//

import Foundation


struct APIRequest {
    static let instance = APIRequest()
    
    public func getSymbol(symbol: String, handler: @escaping(_ returnedQuote: Quote?) -> ()) {
        let url = URL(string: "https://finnhub.io/api/v1/quote?symbol=\(symbol)&token=cf84ahqad3i8qmbtj11gcf84ahqad3i8qmbtj120")
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("ERROR 💥: \(error)")
                    return
                }
                guard let quoteData = data else {
                    print("symbol search data not valid")
                    return
                }
                
                let returnedQuote = try? JSONDecoder().decode(Quote.self, from: quoteData)
                
//                print(returnedQuote)
                
                handler(returnedQuote)
            }.resume()
        }
    }
    
    public func symbolLookup(searchQuery: String, handler: @escaping(_ returnedLookup: StockSymbolSearch?) -> ()) {
        let url = URL(string: "https://finnhub.io/api/v1/search?q=\(searchQuery)&token=cf84ahqad3i8qmbtj11gcf84ahqad3i8qmbtj120")
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("ERROR 💥💥: \(error)")
                    return
                }
                guard let quoteData = data else {
                    print("Symbol not valid")
                    return
                }
                
                let returnedSymbol = try? JSONDecoder().decode(StockSymbolSearch.self, from: quoteData)
                
                handler(returnedSymbol)
                
            }.resume()
        }
    }
    
    public func getCandle(symbol: String, hourLength: Int, handler: @escaping(_ returnedCandle: Candles?) -> ()) {
        let endDate = Int(Date().timeIntervalSince1970)
        let startDate = Int((Calendar.current.date(byAdding: .hour, value: -(hourLength), to: Date())?.timeIntervalSince1970 ?? Date().timeIntervalSince1970))
        let url = URL(string: "https://finnhub.io/api/v1/stock/candle?symbol=\(symbol)&resolution=5&from=\(startDate)&to=\(endDate)&token=cf84ahqad3i8qmbtj11gcf84ahqad3i8qmbtj120")
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("ERROR 💥💥💥: \(error)")
                    return
                }
                guard let quoteData = data else {
                    print("Symbol not valid")
                    return
                }
                
                let returnedCandels = try? JSONDecoder().decode(Candles.self, from: quoteData)
                handler(returnedCandels)
                
            }.resume()
        }
    }
    
}
