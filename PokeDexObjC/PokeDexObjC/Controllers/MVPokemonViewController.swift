//
//  MVPokemonViewController.swift
//  PokeDexObjC
//
//  Created by Markus Varner on 9/11/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class MVPokemonViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var abilitiesLabel: UILabel!
    @IBOutlet var pokeSearchBar: UISearchBar!
    
    var pokemon: MVPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokeSearchBar.delegate = self
        MVPokemonController.fetchPokemon(forSearchTerm: "Dewgong") { (pokemon) in
            
            self.pokemon = pokemon
            self.updateViews()
        }
        
    }
    
    func updateViews() {
        guard let pokemon = pokemon else {return}
        DispatchQueue.main.async {
            self.nameLabel.text = pokemon.name
            self.idLabel.text = "ID: \(String(describing: pokemon.identifier))"
            self.abilitiesLabel.text = "Abilities: \(String(describing: pokemon.abilities.joined(separator: ", ")))"
        }
        
        
    }
    
    //MARK: - Actions
    
    

}
extension MVPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var search = pokeSearchBar.text
        MVPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
}
