//
//  Webservice.swift
//  StockAppSwiftUI
//
//  Created by iraniya on 25/09/20.
//  Copyright © 2020 iraniya. All rights reserved.
//

import Foundation

class Webservice {
    
    func getStock(completion: @escaping (([Stock]?) -> Void)) {
        guard let url = URL(string: "") else {
            fatalError("URL is incorrect")
        }
    }
}
