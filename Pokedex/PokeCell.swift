//
//  PokeCell.swift
//  Pokedex
//
//  Created by Brandon Byrne on 2016-12-03.
//  Copyright © 2016 ZeahSoft. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
 
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 10
    }
    
    func configureCell(_ pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalized
        if shiny == false {
            
            thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        } else {
            
            thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)s")
        }
        
    }
        
} 
