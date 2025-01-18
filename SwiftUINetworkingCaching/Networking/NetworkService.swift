//
//  NetworkService.swift
//  SwiftUINetworkingCaching
//
//  Created by Serg Tsogtbaatar on 1/18/25.
//

import Foundation

public protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T
}

public protocol Endpoint {
    var url: URL? { get }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(Int)
    case unknown
}

struct NetworkService: NetworkServiceProtocol {
    // Simple cache using dictionary with timestamps
    private static var cache: [URL: (data: Data, timestamp: Date)] = [:]
    private let cacheTimeout: TimeInterval = 300 // 5 minutes
    
    func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        if let cached = Self.cache[url],
           Date().timeIntervalSince(cached.timestamp) < cacheTimeout {
            return try JSONDecoder().decode(T.self, from: cached.data)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)

            Self.cache[url] = (data, Date())
            return decoded
        } catch {
            throw NetworkError.decodingError
        }
    }
}

enum RecipeEndpoint: Endpoint {
    case allRecipes
    case malformed
    case emptyData
    
    var url: URL? {
        switch self {
        case .allRecipes:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        case .malformed:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
        case .emptyData:
            return URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
        }
    }
}
