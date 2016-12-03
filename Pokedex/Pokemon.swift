//
//  Pokemon.swift
//  Pokedex
//
//  Created by Brandon Byrne on 2016-12-02.
//  Copyright © 2016 ZeahSoft. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId + 1
    }
    
    
}
