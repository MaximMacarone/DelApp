//
//  CatalogueView.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 07.05.2024.
//

import SwiftUI

struct CatalogueView: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var cart: CartModel
    var products: [ProductModel]
    var body: some View {
        NavigationSplitView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                    ForEach(products) { product in
                        NavigationLink {
                            ProductDetail(cart: cart,product: product)
                        } label :{
                            ProductRow(product: product)
                                .foregroundStyle(.black)
                        }
                        
                    }
                }
                .padding()
                .navigationTitle("Каталог")
            }
        } detail: {
            Text("")
        }
    }
}

#Preview {
    CatalogueView(cart: CartModel(), products: ModelData().products)
}
