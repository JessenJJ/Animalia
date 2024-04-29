//
//  AnimalModel.swift
//  Animalia
//
//  Created by User50 on 29/04/24.
//

import Foundation

struct AnimalModel: Codable, Identifiable {
    let id, name, headline, description, link, image: String
    let gallery: [String]
    let fact: [String]
}
