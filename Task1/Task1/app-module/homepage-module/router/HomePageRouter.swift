//
//  HomePageRouter.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import Foundation

class HomePageRouter : PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePageViewController) {
        
        let presenter : ViewToPresenterHomePageProtocol & InteractorToPresenterHomePageProtocol = HomePagePresenter()
        
        //View controller için
        ref.homepagePresenterObject = presenter
        
        //Presenter için
        ref.homepagePresenterObject?.homepageInteractor = HomePageInteractor()
        ref.homepagePresenterObject?.homepageView = ref
        
        //Interactor için
        ref.homepagePresenterObject?.homepageInteractor?.homepagePresenter = presenter
        
    }
}
