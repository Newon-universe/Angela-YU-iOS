//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Kim Yewon on 2022/08/06.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    // Nib is old name for xib
    override func awakeFromNib() {
        super.awakeFromNib()
        // similar viewDidLoad()
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
