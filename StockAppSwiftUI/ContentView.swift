//
//  ContentView.swift
//  StockAppSwiftUI
//
//  Created by iraniya on 25/09/20.
//  Copyright © 2020 iraniya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter {
            $0.symbol.starts(with: self.stockListVM.searchTerm)
        }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                Text("September 25 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)).offset(y:-400)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm).offset(y:-350)
                
                StockListView(stocks: filteredStocks)
                    .offset(y:150)
                
                NewsArticleView(newsArticles: stockListVM.news, onDragBegain: {
                    value in
                    print(value)
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { value in
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 650)
                    }
                })
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height)
            }
            
            .navigationBarTitle("Stock")
        }.edgesIgnoringSafeArea(Edge.Set.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
