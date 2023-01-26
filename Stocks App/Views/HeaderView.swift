//
//  HeaderView.swift
//  Stocks App
//
//  Created by Shaurya Gupta on 2023-01-22.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSheet: Bool
    var body: some View {
        HStack {
            Text("My Stocks")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.darkBlue)
            Spacer()
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .tint(Color.darkBlue)
                    .font(.system(size: 40))
            }
        }
    }
}

//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView()
//            .padding()
//    }
//}
