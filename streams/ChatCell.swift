//
//  ChatCell.swift
//  streams
//
//  Created by Anudeep Reddy on 27/01/26.
//


// MARK: - ChatCell.swift
import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Avatar
        avatarImageView.layer.cornerRadius = 20
        avatarImageView.clipsToBounds = true

        // Fonts
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        statusLabel.font = .systemFont(ofSize: 12)
        messageLabel.font = .systemFont(ofSize: 13)
        timeLabel.font = .systemFont(ofSize: 12)

        // Colors
        statusLabel.textColor = .gray
        messageLabel.textColor = .lightGray
        timeLabel.textColor = .lightGray

        // IMPORTANT: spacing fix
        nameLabel.numberOfLines = 1
        statusLabel.numberOfLines = 1
        messageLabel.numberOfLines = 1
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        avatarImageView.isHidden = false
        statusLabel.isHidden = false
        messageLabel.isHidden = false
        timeLabel.isHidden = false
        nameLabel.textAlignment = .left
    }

    func configure(with item: PageItem) {
        nameLabel.text = item.title

        if item.isChat {
            avatarImageView.isHidden = false
            statusLabel.isHidden = false
            messageLabel.isHidden = false
            timeLabel.isHidden = false

            statusLabel.text = "Status"
            messageLabel.text = item.subtitle
            timeLabel.text = item.time

            // 🔽 This is what visually pushes "Last Message" down
            statusLabel.textAlignment = .left
            messageLabel.textAlignment = .left

        } else {
            avatarImageView.isHidden = true
            statusLabel.isHidden = true
            messageLabel.isHidden = true
            timeLabel.isHidden = true

            nameLabel.textAlignment = .center
        }
    }
}
