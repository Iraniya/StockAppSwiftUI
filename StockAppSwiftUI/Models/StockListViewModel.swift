//
//  StockListViewModel.swift
//  StockAppSwiftUI
//
//  Created by iraniya on 25/09/20.
//  Copyright © 2020 iraniya. All rights reserved.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load(){
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        Webservice().getNews { news in
            if let news = news {
                self.news = news.map(NewsArticleViewModel.init)
            }
        }
    }
    
    private func fetchStocks() {
        Webservice().getStock { (stocks) in
            if let stocks = stocks {
                self.stocks = stocks.map(StockViewModel.init)
            }
        }
    }
}
