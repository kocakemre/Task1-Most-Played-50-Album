//
//  HomePageProtocols.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol {
    var homepageInteractor:PresenterToInteractorHomePageProtocol? {get set}
    var homepageView:PresenterToViewHomePageProtocol? {get set}
    
    func albumsLoad()
    func search(searchWord:String)
    
}

protocol PresenterToInteractorHomePageProtocol {
    var homepagePresenter:InteractorToPresenterHomePageProtocol? {get set}
    
    func allAlbumsGet()
    func albumSearch(searchWord:String)
    
}

protocol InteractorToPresenterHomePageProtocol {
    func presenterToDataDispatch(resultList:Array<Result>)
}

protocol PresenterToViewHomePageProtocol {
    func viewToDataDispatch(resultList:Array<Result>)
}

protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref:HomePageViewController)
}

