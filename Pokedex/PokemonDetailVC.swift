//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Brandon Byrne on 2016-12-06.
//  Copyright © 2016 ZeahSoft. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        
        pokedexLbl.text = "\(pokemon.pokedexId)"
        nameLbl.text = pokemon.name.capitalized
        
        pokemon.downloadPokemonDetails {
            // whatever we write will only be called after network call is complete
         
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        if pokemon.nextEvolutionText != "" {
            evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionText) LVL X"
        } else {
            evoLbl.text = "\(pokemon.name.capitalized) does not evolve"
            nextEvoImg.isHidden = true
        }
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
