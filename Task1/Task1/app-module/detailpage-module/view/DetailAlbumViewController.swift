//
//  DetailAlbumViewController.swift
//  Task1
//
//  Created by Emre Koçak on 4.03.2022.
//

import UIKit

class DetailAlbumViewController: UIViewController {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var result:Result?
    var detailPagePresenterObject:ViewToPresenterDetailPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let r = result {
            
            albumImageView.image = UIImage(named: r.name!)
            artistNameLabel.text = "Artist Name: \(r.artistName!)"
            genresLabel.text = "Genre: \(r.genres!)"
            releaseDateLabel.text = "Release Date: \(r.releaseDate!)"
            
            
            if let url = URL(string:"https://rss.applemarketingtools.com/api/v2/us/music/most-played/50/albums.json/\(r.artworkUrl100!)") {
                
                DispatchQueue.main.async {
                    self.albumImageView.image = UIImage(named: "url")
                }
            }
        }
        DetailPageRouter.createModule(ref: self)
    }
}



