//
//  ViewModel.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import Foundation


protocol ViewModel {
    associatedtype Repository
    var handleUpdate: (() -> Void)? { get set }
}
