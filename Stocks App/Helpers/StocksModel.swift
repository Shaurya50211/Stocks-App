//
//  StocksModel.swift
//  Stocks App
//
//  Created by Shaurya Gupta on 2023-01-25.
//

import Foundation


struct StockModel: Hashable {
    let symbol: String // AAPL
    let descrption: String? // APPLE INC.
    let currentPrice: Double? // 144.6
    let percentChanged: Double? // 1.4%
    let candles: [CGFloat] // [144.3, 146.1...]
}
