//
//  ContentView.swift
//  pokedex
//
//  Created by Anshul Rokade on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(searchText == "" ? pokemon: pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })){entry in
                    HStack{
                        PokemonImage(imagelink: "\(entry.url)")
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized,
                                       destination: Text("Detail view for \(entry.name)"))
                    }
                }
                
            }
            .onAppear(){
                Pokeapi().getData(){pokemon in
                    self.pokemon = pokemon
                    
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
