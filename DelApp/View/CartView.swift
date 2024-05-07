//
//  CartView.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 07.05.2024.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: CartModel
    
    var body: some View {
        NavigationSplitView {
            List {
                        ForEach(cart.items.keys.sorted(by: { $0.name < $1.name }), id: \.self) { product in
                            NavigationLink {
                                ProductDetail(cart: cart, product: product)
                            } label: {
                                HStack {
                                    Text(product.name)
                                    Spacer()
                                    Text("Количество: \(cart.items[product] ?? 0)")
                                }
                            }
                        }
                    }
            Spacer()
            Button(action: {
                
            }, label: {
                HStack {
                    switch cart.totalItemsCount {
                    case 1:
                        Text("\(cart.totalItemsCount) товар")
                    case 2, 3, 4:
                        Text("\(cart.totalItemsCount) товара")
                    default:
                        Text("\(cart.totalItemsCount) товаров")
                    }
                    
                    Spacer()
                    Text("Оформить заказ")
                    Spacer()
                    Text("\(cart.totalPrice) ₽")
                }
                .padding()

            })
            .navigationTitle("Корзина")
        } detail: {
            Text("")
        }
    }
}

#Preview {
    CartView(cart: CartModel())
}
