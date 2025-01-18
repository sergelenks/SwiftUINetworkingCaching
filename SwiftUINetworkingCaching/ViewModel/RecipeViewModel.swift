//
//  RecipeViewModel.swift
//  SwiftUINetworkingCaching
//
//  Created by Serg Tsogtbaatar on 1/18/25.
//

import Foundation

@Observable
class RecipesViewModel {
    let networkService: NetworkServiceProtocol
    var recipes: [Recipe] = []
    var error: Error?
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchAllRecipes() async {
        do {
            let wrapper: RecipesWrapper = try await networkService.fetch(from: RecipeEndpoint.allRecipes)
            await MainActor.run {
                self.recipes = wrapper.recipes
            }
        } catch {
            await MainActor.run {
                self.error = error
            }
        }
    }
}
