//
//  PokemonSelected.swift
//  pokedex
//
//  Created by Anshul Rokade on 21/07/22.
//

import Foundation

struct PokemonSelected: Codable{
    var sprites: Pokemonsprites
    var weight: Int
}

struct Pokemonsprites: Codable {
    var front_default: String
}

class PokemonSelectedApi{
    func getData(url: String, completion: @escaping(Pokemonsprites) -> ()){
        guard let url = URL(string: url) else{return}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {return}
            
            let pokemonsprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            DispatchQueue.main.async {
                completion(pokemonsprite.sprites)
            }

        }.resume()
    }
}
