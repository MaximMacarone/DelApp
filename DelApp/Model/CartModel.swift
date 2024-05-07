//
//  CartModel.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 08.05.2024.
//

import Foundation

class CartModel: ObservableObject {
    @Published var items: [ProductModel: Int] = [:] // Словарь товаров и их количества в корзине
    
    var totalPrice: Int {
            var totalPrice = 0
            for (product, count) in items {
                totalPrice += product.price * count
            }
            return totalPrice
        }
    
    var totalItemsCount: Int {
        var totalCount = 0
        for (_, count) in items {
            totalCount += count
        }
        return totalCount
    }
    
    func addItem(_ product: ProductModel) {
        if let count = items[product] {
            items[product] = count + 1
        } else {
            items[product] = 1
        }
    }
    
    func deleteItem(_ product: ProductModel) {
        if let count = items[product], count > 1 {
            items[product] = count - 1
        } else {
            items.removeValue(forKey: product)
        }
    }
}
