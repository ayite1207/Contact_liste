//
//  TableViewCell.swift
//  Liste
//
//  Created by ayite  on 26/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundPicture()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func roundPicture(){
        photo.layer.masksToBounds = false
        photo.layer.cornerRadius = photo.frame.width/2
        photo.clipsToBounds = true
    }

}

