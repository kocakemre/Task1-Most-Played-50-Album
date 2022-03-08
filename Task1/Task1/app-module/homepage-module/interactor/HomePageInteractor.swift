//
//  HomePageInteractor.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import Foundation

class HomePageInteractor : PresenterToInteractorHomePageProtocol {
    
    var homepagePresenter: InteractorToPresenterHomePageProtocol?
    
    func allAlbumsGet() {
        
        let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json")!
        
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do{
                
                let response = try JSONDecoder().decode(ResultResponse.self, from: data!)
                var list = [Result]()
                
                if let getList = response.result {
                    list = getList
                }
                
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    print(json)
                }
                
                self.homepagePresenter?.presenterToDataDispatch(resultList: list)
            }catch{
                
                print("Error : \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    func albumSearch(searchWord: String) {
        
        print("Search word: \(searchWord)")
        
    }
}




