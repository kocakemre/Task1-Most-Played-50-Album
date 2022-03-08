//
//  ViewController.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var albumTableView: UITableView!
    
    var albumList = [Result]()
    var homepagePresenterObject:ViewToPresenterHomePageProtocol?
    var filterAlbumList = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumTableView.delegate = self
        albumTableView.dataSource = self
        
        searchBar.delegate = self
        
        HomePageRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenterObject?.albumsLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let result = sender as? Result
            let goToVC = segue.destination as! DetailAlbumViewController
            goToVC.result = result
        }
    }
}

extension HomePageViewController : PresenterToViewHomePageProtocol {
    func viewToDataDispatch(resultList: Array<Result>) {
        self.albumList = resultList
        self.filterAlbumList = resultList
        
        DispatchQueue.main.async {
            self.albumTableView.reloadData()
        }
    }
}

extension HomePageViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filterAlbumList = self.albumList.filter{album in
            if album.name!.lowercased().contains(searchText.lowercased()){
                return true
            }
            if searchText == ""{
                return true
            }
            return false
        }
        self.albumTableView.reloadData()
        
        homepagePresenterObject?.search(searchWord: searchText)
        
        print("Arama Sonucu : \(searchText)")
    }
}

extension HomePageViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let album = albumList[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetail", sender: album)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let album = albumList[indexPath.row]
        let cell = albumTableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! HomePageTableViewCell
        
        if let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json/\(album.artworkUrl100!)"){
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    cell.albumImageView.image = UIImage(data: data!)
                }
            }
        }
        
        cell.albumImageView.image = UIImage(named: album.artworkUrl100!)
        cell.albumNameLabel.text = album.name
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}


