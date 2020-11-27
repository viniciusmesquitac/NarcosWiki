//
//  CharactersViewModel.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 03/11/20.
//

import Foundation

final class ListCharactersViewModel: ViewModel {
    
    var handleUpdate: (() -> Void)?
    
    typealias Repository = CharactersRepository
    
    var characters: [Character] = [] {
        didSet {
            DispatchQueue.main.async { self.handleUpdate?() }
        }
    }
    
    var numberOfRows: Int {
        // Tentar carregar os dados caso esteja vazio.
        return characters.count
    }
    
    public func cellViewModel(at index: Int) -> Character? {
        if characters.count >= index {
            let character = characters[index]
            return character
        }
        return nil
    }
    
}


// Resources:

// Convenience init ->
// MVVM -> https://www.devmedia.com.br/entendendo-o-pattern-model-view-viewmodel-mvvm/18411
// MVVM x MVC -> https://www.toptal.com/swift/static-patterns-swift-mvvm-tutorial
// https://medium.com/@GeraldoBastos/parte-2-qual-a-melhor-arquitetura-para-aplicações-ios-mvvm-803f09cbd989
