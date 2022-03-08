//
//  Genre.swift
//  Task1
//
//  Created by Emre Koçak on 5.03.2022.
//

import Foundation

class Genre: Codable {
    var genreID, name: String?
    var url: String?

    init() {
        
    }

    init(genreID: String?, name: String?, url: String?) {
        self.genreID = genreID
        self.name = name
        self.url = url
    }
}
