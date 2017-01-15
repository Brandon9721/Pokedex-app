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
        
        if shiny == false {
           
            mainImg.image = img
            currentEvoImg.image = img
        } else {
            
            mainImg.image = UIImage(named: "\(pokemon.pokedexId)s")
            currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)s")
        }
        
        
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
        descriptionLbl.text = pokemon.description
        if pokemon.nextEvolutionId == "" {
           
            evoLbl.text = "\(pokemon.name.capitalized) has no evolutions"
            nextEvoImg.isHidden = true
        } else {
            
            evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionName.capitalized) - LVL \(pokemon.nextEvolutionLevel)"
            
            if shiny == false {
            
                nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            } else {
                
                
                nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId + "s")
            }
            nextEvoImg.isHidden = false
        }
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
