//
//  Appearences.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 31/10/20.
//

import Foundation

struct Appearence: Codable {
    let episode: String
    let link: String
}

struct Appearences: Codable {
    let first: Appearence
    let last: Appearence
    let episodeCount: Int
    let seasonCount: Int
}
