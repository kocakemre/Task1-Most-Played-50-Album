//
//  HomePagePresenter.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import Foundation

class HomePagePresenter : ViewToPresenterHomePageProtocol {
    
    var homepageInteractor: PresenterToInteractorHomePageProtocol?
    var homepageView: PresenterToViewHomePageProtocol?
    
    func albumsLoad() {
        homepageInteractor?.allAlbumsGet()
    }
    
    func search(searchWord: String) {
        homepageInteractor?.albumSearch(searchWord: searchWord)
    }
    
    
}

extension HomePagePresenter : InteractorToPresenterHomePageProtocol {
    
    func presenterToDataDispatch(resultList: Array<Result>) {
        homepageView?.viewToDataDispatch(resultList: resultList)
    }
}
