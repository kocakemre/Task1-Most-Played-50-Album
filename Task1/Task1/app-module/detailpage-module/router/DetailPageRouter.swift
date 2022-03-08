//
//  DetailPageRouter.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import Foundation

class DetailPageRouter : PresenterToRouterDetailPageProtocol {
    
    static func createModule(ref: DetailAlbumViewController) {
        
        ref.detailPagePresenterObject = DetailPagePresenter()
        ref.detailPagePresenterObject?.detailPageInteractor = DetailPageInteractor()
        
    }
}
