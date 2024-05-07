//
//  Model.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 06.05.2024.
//

import Foundation
import SwiftUI

struct ProductModel: Hashable, Identifiable, Codable {
    var id: Int
    var name: String
    var price: String
    var quantity: Int
    var description: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
