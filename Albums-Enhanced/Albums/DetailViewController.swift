//
//  DetailViewController.swift
//  Albums
//
//  Created by Ross Gottschalk on 9/13/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    var anAlbum: Album!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let titleLabel = UILabel(frame: CGRect(x:30, y:380, width:260, height:50))
        titleLabel.text = anAlbum.title
        self.view.addSubview(titleLabel)
        

        let trackCountLabel = UILabel(frame: CGRect(x:30, y:400, width:260, height:50))
        trackCountLabel.text = "Number of tracks: \(anAlbum.trackCount)"
        self.view.addSubview(trackCountLabel)
        
        
        let genreLabel = UILabel(frame: CGRect(x:30, y:420, width:260, height:50))
        genreLabel.text = "Genre: \(anAlbum.genre)"
        self.view.addSubview(genreLabel)
        
        let priceLabel = UILabel(frame: CGRect(x:30, y:440, width:260, height:50))
        priceLabel.text = "Price: \(anAlbum.price)"
        self.view.addSubview(priceLabel)

        
        
        
        
        
        
        
        
        
        let bigImageView: UIImageView
        
        bigImageView = UIImageView(frame: CGRect(x: 60, y: 170, width: 200, height: 200))
        let request = URLRequest(url: URL(string: anAlbum.largeImageURL)!)
        URLSession.shared.dataTask(with: request, completionHandler: {
            data, response, error in
            if error == nil
            {
                let image = UIImage(data: data!)
                let queue = DispatchQueue.main
                queue.async {
                    bigImageView.image = image
                    //if let cellToUpdate = tableView.cellForRow(at: indexPath) as? AlbumCell
                    //{
                       //cellToUpdate.activityView.stopAnimating()
                        //cellToUpdate.artworkImageView.image = image
                    //}
                }
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
            }
        }).resume()
        self.view.addSubview(bigImageView)

        
        
        // Do any additional setup after loading the view.
        //var  bigImageView: UIImageView
        //bigImageView = UIImageView(frame )
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
