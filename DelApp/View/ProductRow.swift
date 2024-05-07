//
//  ProductRow.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 07.05.2024.
//

import SwiftUI

struct ProductRow: View {

    var product: ProductModel
    var body: some View {
        VStack {
            product.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
            Text(product.name)
                .frame(width: 100, height: 60)
                .font(.footnote)
            Text("\(product.price) ₽")
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(.gray, lineWidth: 1)
                
        )
        
    }
}

#Preview {
    Group {
        ProductRow(product: ModelData().products[0])
        ProductRow(product: ModelData().products[4])
    }
}
