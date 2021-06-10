//
//  CartelsViewModel.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import Foundation

final class CartelsViewModel: ViewModel {
    
    var handleUpdate: (() -> Void)?
    
    typealias Repository = CartelsRepository
    
    var cartels: [Cartel] = [] {
        didSet {
            DispatchQueue.main.async { self.handleUpdate?() }
        }
    }
    
    public var numberOfRows: Int {
        return cartels.count
    }
    
    public func cellViewModel(at index: Int) -> Cartel? {
        if cartels.count >= index {
            let cartel = cartels[index]
            return cartel
        }
        return nil
    }
    
    public func getAllCartels() -> [Cartel] {
        let cartels = Repository().getAll()
        self.cartels = cartels
        return cartels
    }
    
    public func getListOfCharacters(in cartel: Cartels) -> ListCharactersViewModel {
        let listChacterViewModel = ListCharactersViewModel()
        
        switch cartel {
        case .sinaloa:
            let helper = JsonHelper<Character>(fileName: "narcos_sinaloa")
            let characters = helper.getAll()
            listChacterViewModel.characters = characters!
            return listChacterViewModel
        default:
            return listChacterViewModel
        }
    }
    
}
