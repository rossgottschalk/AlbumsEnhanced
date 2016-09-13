//
//  AlbumsTableViewController.swift
//  Albums
//
//  Created by Ben Gohlke on 9/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController
{
    var dataProvider: AlbumDataProviderProtocol?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Beatles Albums"
        dataProvider = AlbumDataProvider()
        if let dataProv = dataProvider as? AlbumDataProvider
        {
            tableView.dataSource = dataProv
            dataProv.setAndRegisterNib(tableView: tableView)
        }
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return CGFloat(66.0)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = DetailViewController()
        if let dataProvider = tableView.dataSource as? AlbumDataProvider
        {
            let album = dataProvider.albums[indexPath.row]
            destVC.anAlbum = album 
        }
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    
}
