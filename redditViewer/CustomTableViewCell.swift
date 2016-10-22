//
//  CustomTableViewCell.swift
//  redditViewer
//
//  Created by Andy Woodard on 9/20/16.
//  Copyright © 2016 Andy Woodard. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var subredditLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var backgroundSquare: UIImageView!

    @IBOutlet weak var loadButton: UIButton!
   
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }

}
