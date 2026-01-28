//
//  ChatCell.swift
//  streams
//
//  Created by Anudeep Reddy on 27/01/26.
//


import UIKit
//hi
class ChatCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    func configure(text: String) {
        nameLabel.text = text
    }
}

