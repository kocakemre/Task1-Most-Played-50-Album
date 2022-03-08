//
//  Album.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import Foundation

class Feed : Codable {
    var title: String?
    var id: String?
    var author: Author?
    var links: [Link]?
    var copyright, country: String?
    var icon: String?
    var updated: String?
    var results: [Result]?
    
    init() {
        
    }

    init(title: String, id: String, author: Author, links: [Link], copyright: String, country: String, icon: String, updated: String, results: [Result]) {
        self.title = title
        self.id = id
        self.author = author
        self.links = links
        self.copyright = copyright
        self.country = country
        self.icon = icon
        self.updated = updated
        self.results = results
    }
}
