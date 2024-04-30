//
//  VideoModel.swift
//  Animalia
//
//  Created by User50 on 30/04/24.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    var id: String
    var name, headline: String
    
    // computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
