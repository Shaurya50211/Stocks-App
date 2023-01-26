//
//  WatchlistView.swift
//  Stocks App
//
//  Created by Shaurya Gupta on 2023-01-22.
//

import SwiftUI

struct WatchlistView: View {
    @StateObject var stocksVM: StocksViewModel
    var body: some View {
        // Watchlist
        VStack {
            HStack {
                Text("Watchlist")
                    .font(.title)
                    .bold()
                    .foregroundColor(.darkBlue)
                Spacer()
            }
            
            ScrollView {
                VStack {
                    ForEach(stocksVM.stocks, id: \.self) { stock in
                        StockCard(stockModel: stock)
                    }
                }
            }
        }
        .padding()
    }
}
