//
//  DetailPageProtocols.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import Foundation

protocol ViewToPresenterDetailPageProtocol {
    
    var detailPageInteractor:PresenterToInteractorDetailPageProtocol? {get set}
    
    func album(artistID: String)
    
}

protocol PresenterToInteractorDetailPageProtocol {
    
    func getAlbum(artistID: String)
    
}

protocol PresenterToRouterDetailPageProtocol {
    static func createModule(ref:DetailAlbumViewController)
}
