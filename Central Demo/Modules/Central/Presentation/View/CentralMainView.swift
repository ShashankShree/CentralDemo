//
//  ContentView.swift
//  Central Demo
//
//  Created by Shashank Shree on 04/10/23.
//

import SwiftUI

struct CentralMainView: View {
    @ObservedObject var viewModel = CentralViewModel()
    @State private var searchText = ""

    // 1. Number of items will be display in row
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    // 2. Get mock cards data
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Button(action:{}){
                    Image("back")
                }
                Spacer()
                Text("Product Listing page")
                    .font(.title3)
                Spacer()
                Button("Add"){
                }
                .foregroundColor(.white)
                .frame(width: 45, height: 30)
                .background(.blue)
                .cornerRadius(5)
                
            }.padding(.leading,10)
                .padding(.trailing,10)
            Spacer()
            
            Rectangle().frame(maxWidth: .infinity, maxHeight: 2)
                .foregroundColor(Color(red: 23/155, green: 78/255, blue: 115/255))
            
            SearchView(text: $searchText)
            
            ScrollView {
                // 4. Populate into grid
                LazyVGrid(columns: columns, spacing: 0) {
                    if let products = viewModel.productList{
                        ForEach(products.filter({ searchText.isEmpty ? true : (($0.brandName ?? "").localizedCaseInsensitiveContains(searchText)) || (($0.name ?? "").localizedCaseInsensitiveContains(searchText))})) { obj in
                            CardView(product: obj)
                                .frame(height: 380)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CentralMainView()
    }
}
