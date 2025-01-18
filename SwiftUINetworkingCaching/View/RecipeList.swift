//
//  RecipeList.swift
//  SwiftUINetworkingCaching
//
//  Created by Serg Tsogtbaatar on 1/18/25.
//

import SwiftUI

struct RecipesList: View {
    @State private var viewModel = RecipesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
                
                if viewModel.recipes.isEmpty {
                    EmptyView()
                } else {
                    List {
                        ForEach(viewModel.recipes) { recipe in
                            RecipeView(recipe: recipe)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.fetchAllRecipes()
                    }
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.fetchAllRecipes()
            }
        }
    }
}

#Preview {
    RecipesList()
}
