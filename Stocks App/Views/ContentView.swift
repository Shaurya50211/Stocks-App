//
//  ContentView.swift
//  Stocks App
//
//  Created by Shaurya Gupta on 2023-01-22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var stocksVM = StocksViewModel()
    
    @State private var isShowingStockSearchSheet = false
    
    var body: some View {
        VStack {
            HeaderView(showSheet: $isShowingStockSearchSheet)
                .padding()
            
            
            PortifolioCard(stocksVM: stocksVM)
            
            WatchlistView(stocksVM: stocksVM)
            
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $isShowingStockSearchSheet) {
            SearchStockView()   
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
