//
//  JSONDecoders.swift
//  Stocks App
//
//  Created by Shaurya Gupta on 2023-01-24.
//

import Foundation


struct Quote: Decodable {
    let c: Double
    let d: Double
    let dp: Double
    let h: Double
    let o: Double
    let pc: Double
    let t: Double
}

struct StockSymbolSearch: Decodable {
    let result: [StockSymbol]
}

struct StockSymbol: Decodable, Hashable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}

struct Candles: Decodable {
    let c: [Double]
}
