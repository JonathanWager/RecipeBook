//
//  ContentView.swift
//  RecipeList
//
//  Created by Jonathan Wåger on 2023-09-28.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List(sampleRecipes) { recipe in
                NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                    RecipeRow(recipe: recipe)
                }
            }
            .listStyle(PlainListStyle()) // Remove the default list style
            .navigationBarTitle("Recept")
            .padding(.top, 20) // Add top padding to move the list down
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            Image(recipe.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(recipe.title)
        }
    }
}

struct RecipeDetail: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Image(recipe.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text("Ingredienser:")
                .font(.headline)
            
            List(recipe.ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
            
            Text("Instruktioner:")
                .font(.headline)
            
            List(recipe.instructions, id: \.self) { instruction in
                Text(instruction)
            }
        }
        .navigationBarTitle(recipe.title)
    }
}

