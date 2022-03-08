//
//  Author.swift
//  Task1
//
//  Created by Emre Koçak on 5.03.2022.
//

import Foundation

class Author: Codable {
    var name: String?
    var url: String?
    
    init() {
        
    }

    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}
