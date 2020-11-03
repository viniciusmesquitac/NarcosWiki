//
//  JsonHelper.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import Foundation

class JsonHelper<Object: Codable> {
    
    var fileName: String!
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func getAll() -> [Object]? {
        if let data = retrive() {
            if let cartels = try? JSONDecoder().decode([Object].self, from: data) {
                return cartels
            }
        }
        
        return nil
    }
    
    func retrive() -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try? Data(contentsOf: url)
                return data
            }
        }
        return nil
    }
    
}
