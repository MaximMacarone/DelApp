//
//  ModelData.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 07.05.2024.
//

import Foundation


class ModelData: ObservableObject {
    var products: [ProductModel] = load("ProductData.json")

}
private func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find file \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
        
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


