//
//  PokemonImage.swift
//  pokedex
//
//  Created by Anshul Rokade on 21/07/22.
//

import SwiftUI

struct PokemonImage: View {
    var imagelink = ""
    @State private var pokemonsprite = ""
    var body: some View {
        AsyncImage(url: URL(string: pokemonsprite))
            .frame(width: 75, height: 75)
            .onAppear{
                let loadData = UserDefaults.standard.string(forKey: imagelink)
                
                if loadData == nil {
                    getsprite(url: imagelink)
                    UserDefaults.standard.set(imagelink, forKey: imagelink)
                   // print("New URL caching....")
                }else{
                    getsprite(url: loadData!)
                   // print("Using Loaded url")
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.white.opacity(0.60))
    }
    
    func getsprite(url: String){
        var tempsprite: String?
        
        PokemonSelectedApi().getData(url: url){ sprite in
            tempsprite = sprite.front_default
            self.pokemonsprite = tempsprite ?? "Placeholder"
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
    }
}
