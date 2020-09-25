//
//  Stock.swift
//  StockAppSwiftUI
//
//  Created by iraniya on 25/09/20.
//  Copyright © 2020 iraniya. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: String
    let change: String
}
