//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Manas on 05/12/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightimageview: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Make sure the messageBubble has a non-zero height
        guard messageBubble.frame.size.height > 0 else {
            return
        }
        
        // Set corner radius based on half of the view's height
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 2
        messageBubble.layer.masksToBounds = true
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
