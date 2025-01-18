//
//  Recipes.swift
//  SwiftUINetworkingCaching
//
//  Created by Serg Tsogtbaatar on 1/18/25.
//

import Foundation

struct RecipesWrapper: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let cuisine: String
    let name: String
    let photo_large: String?
    let photo_small: String?
    let id: String
    let source: String?
    let youtube: String?
}

extension Recipe {
    private enum CodingKeys: String, CodingKey {
        case photo_large = "photo_url_large"
        case photo_small = "photo_url_small"
        case id = "uuid"
        case source = "source_url"
        case youtube = "youtube_url"
        case cuisine, name
    }
}
