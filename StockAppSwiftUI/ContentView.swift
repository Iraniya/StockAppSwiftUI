//
//  ContentView.swift
//  StockAppSwiftUI
//
//  Created by iraniya on 25/09/20.
//  Copyright © 2020 iraniya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                Text("September 25 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)).offset(y:-380)
                
                SearchView(searchTerm: $searchTerm).offset(y:-300)
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
