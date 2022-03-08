//
//  Link.swift
//  Task1
//
//  Created by Emre Koçak on 5.03.2022.
//

import Foundation

class Link: Codable {
    var linkSelf:String?

    init() {
        
    }

    init(linkSelf: String?) {
        self.linkSelf = linkSelf
    }
}
