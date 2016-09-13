//
//  AlbumCell.swift
//  Albums
//
//  Created by Ben Gohlke on 9/13/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell
{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
