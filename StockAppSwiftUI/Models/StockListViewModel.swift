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
    
    func load(){
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStock { (stocks) in
            if let stocks = stocks {
                DispatchQueue.main.sync {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
