//
//  ProductDetail.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 06.05.2024.
//

import SwiftUI

struct ProductDetail: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var cart: CartModel
    var product: ProductModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    product.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                    Divider()
                        .padding()
                    Text(product.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding()
                    Text("\(product.price) ₽")
                        .font(.title2)
                        .padding()
                    Text(product.description)
                        .padding()
                    
                    
                }
                
            }
            
            HStack {
                if cart.items[product] == nil {
                    Button(action: {
                        cart.addItem(product)
                    }) {
                        Text("Добавить в корзину")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                } else {
                    Button(action: {
                        cart.deleteItem(product)
                    }) {
                        Text("-")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    
                    Text("В корзине: \( cart.items[product] ?? 0)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                    Button(action: {
                        cart.addItem(product)
                    }) {
                        Text("+")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                
            }
            .padding()
            
        }
        .navigationTitle("Информация о товаре")
    }
    
}

#Preview {
    ProductDetail(cart: CartModel(), product: ModelData().products[0])
}
