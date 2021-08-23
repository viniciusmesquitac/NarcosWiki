//
//  Character.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import Foundation

struct Character: Codable {
    let fullName: String
    let nicknames: [String]
    let status: String
    let birth: String
    let birthLocation: String
    let nationality: String
    let description: String
    let imageUrl: ImageUrl
    let functional: Bool
    let appearances: Appearences
    let career: Career
}
