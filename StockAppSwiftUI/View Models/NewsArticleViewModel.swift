//
//  NewsArticleViewModel.swift
//  StockAppSwiftUI
//
//  Created by iraniya on 25/09/20.
//  Copyright © 2020 iraniya. All rights reserved.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var title: String {
        return article.title
    }
    
    var publication: String {
        return article.publication.uppercased()
    }
    
    var imageURL: String {
        return article.imageURL
    }
}
