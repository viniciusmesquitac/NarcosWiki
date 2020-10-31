//
//  CartelsRepository.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import Foundation

class CartelsRepository: Repository {
    typealias Object = Cartel

    func getAll() -> [Cartel] {
        let cartels: [Cartel] = [
            Cartel(name: "Guadalajara", characters: nil),
            Cartel(name: "Juarez", characters: nil),
            Cartel(name: "Gulf", characters: nil),
            Cartel(name: "Tijuana", characters: nil)
        ]
        
        return cartels
    }
    
    func add(object: Cartel) -> Bool {
        return false
    }
    
    func delete(object: Cartel) -> Bool {
        return false
    }
    
    
    
}
