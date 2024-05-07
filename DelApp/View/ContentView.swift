//
//  ContentView.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 06.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var modelData = ModelData()
    @StateObject var cartModel = CartModel()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CatalogueView(cart: cartModel, products: modelData.products)
                .tabItem {
                    Label("Каталог", systemImage: "house")
                }
                .tag(0)
            CartView(cart: cartModel)
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
                .tag(1)
            AccountView()
                //.navigationTitle("Корзина")
                .tabItem {
                    Label("Аккаунт", systemImage: "person")
                }
                .tag(2)
        }
        .onChange(of: selectedTab) { newTab, _ in
            if selectedTab == newTab {
                selectedTab = 0
            }
        }
    }
}

#Preview {
    ContentView()
}
