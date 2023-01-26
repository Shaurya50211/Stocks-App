//
//  StocksViewModel.swift
//  Stocks App
//
//  Created by Shaurya Gupta on 2023-01-25.
//

import Foundation
import SwiftUI

class StocksViewModel: ObservableObject {
    var tickers = ["AAPL", "MSFT", "NKE", "TSLA", "SBUX", "BA", "HD", "GOOG", "NFLX", ""]
    
    @Published var stocks: [StockModel] = [StockModel]()
    
    init() {
        self.fetchStockData()
    }
    
    public func fetchStockData() {
        
        for ticker in tickers {
            
            APIRequest.instance.symbolLookup(searchQuery: ticker) { returnedLookup in
                APIRequest.instance.getSymbol(symbol: ticker) { returnedQuote in
                    APIRequest.instance.getCandle(symbol: ticker, hourLength: 12) { returnedCandle in
                        let candleArray: [CGFloat] = returnedCandle?.c.map{CGFloat($0)} ?? []
                        let stockInfo = returnedLookup?.result[0]
                        let newStock = StockModel(symbol: ticker, descrption: stockInfo?.description, currentPrice: returnedQuote?.c, percentChanged: returnedQuote?.dp, candles: candleArray)
                        
                        DispatchQueue.main.async {
                            self.stocks.append(newStock)
                        }
                    }
                }
            }
            
        }
        
    }
}
