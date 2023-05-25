//
//  Product.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//
//

import Foundation

struct Product: Codable, Identifiable {
    var id: UUID?
    var productName: String

    enum CodingKeys: String, CodingKey {
        case id
        case productName
    }
    
//    init(productName: String) {
//        self.productName = productName
//    }
}


class ReadData: ObservableObject {
    @Published var products = [Product]()

    init() {
        loadData()
    }

//    func loadData() {
//        guard let url = Bundle.main.url(forResource: "search-response", withExtension: "json") else {
//            print("JSON file not found")
//            return
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase // Optional: Converts snake_case keys to camelCase
//            self.products = try decoder.decode([Product].self, from: data)
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
//    }
    
func loadData() {
    guard let url = Bundle.main.url(forResource: "search-response", withExtension: "json") else {
        print("JSON file not found")
        return
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.products = try decoder.decode([Product].self, from: data)
        
        // Assign IDs to the products
        for index in 0..<self.products.count {
            self.products[index].id = UUID()
        }
    } catch {
        print("Error decoding JSON: \(error)")
    }
}

}

