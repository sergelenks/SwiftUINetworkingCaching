//
//  RecipeView.swift
//  SwiftUINetworkingCaching
//
//  Created by Serg Tsogtbaatar on 1/18/25.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: recipe.photo_small ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
                Spacer()
                
                HStack(spacing: 12) {
                    if let source = recipe.source, !source.isEmpty {
                        Image(systemName: "link")
                            .foregroundStyle(.blue)
                    }
                    
                    if let youtube = recipe.youtube, !youtube.isEmpty {
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
                .font(.footnote)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    RecipeView(recipe: Recipe(cuisine: "Mongolian", name: "Buuz", photo_large: "", photo_small: "", id: "1", source: "", youtube: ""))
}
