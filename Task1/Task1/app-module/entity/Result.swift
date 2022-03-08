//
//  Result.swift
//  Task1
//
//  Created by Emre Koçak on 5.03.2022.
//

import Foundation

class Result:Codable {
    var artistName, id, name, releaseDate: String?
    var kind: String?
    var artistID: String?
    var artistURL: String?
    var contentAdvisoryRating: String?
    var artworkUrl100: String?
    var genres: [Genre]?
    var url: String?

    init() {
        
    }

    init(artistName: String, id: String, name: String, releaseDate: String, kind: String, artistID: String, artistURL: String, contentAdvisoryRating: String, artworkUrl100: String, genres: [Genre], url: String) {
        self.artistName = artistName
        self.id = id
        self.name = name
        self.releaseDate = releaseDate
        self.kind = kind
        self.artistID = artistID
        self.artistURL = artistURL
        self.contentAdvisoryRating = contentAdvisoryRating
        self.artworkUrl100 = artworkUrl100
        self.genres = genres
        self.url = url
    }
}
