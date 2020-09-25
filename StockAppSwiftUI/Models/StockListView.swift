//
//  StockListView.swift
//  StockAppSwiftUI
//
//  Created by iraniya on 25/09/20.
//  Copyright © 2020 iraniya. All rights reserved.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
    }
}

struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.custom("Arial", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                Text(stock.description)
                    .foregroundColor(.gray)
                    .font(.custom("Arial", size: 18))
            }
            
            Spacer()
            VStack  {
                Text("\(stock.price)")
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                
                Button(stock.change) {}
                    .frame(width: 75)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                .cornerRadius(6)
            }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "GOOG", description: "Goolgle stock", price: 1200, change:"+0.23")
        
        return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
