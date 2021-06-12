//
//  Repository.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 03/11/20.
//

import Foundation

class CharactersRepository: Repository {
    
    var helper: JsonHelper<Character>?
    
    private init() {}
    
    public init(fileName: String) {
        helper = JsonHelper<Character>(fileName: fileName)
    }
    
    typealias Object = Character
    
    func getAll() -> [Character] {
        helper!.getAll()!
    }
    
    func add(object: Character) -> Bool {
        return false
    }
    
    func delete(object: Character) -> Bool {
        return false
    }
    
}
