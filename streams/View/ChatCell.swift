import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {

        // Avatar
        avatarImageView.layer.cornerRadius = 28
        avatarImageView.clipsToBounds = true

        // Title
        nameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        nameLabel.textColor = .white

        // Status (subtitle)
        statusLabel.font = .systemFont(ofSize: 14, weight: .medium)
        statusLabel.textColor = UIColor.white.withAlphaComponent(0.7)

        // Message preview
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.textColor = UIColor.white.withAlphaComponent(0.55)
        messageLabel.numberOfLines = 1

        // Time
        timeLabel.font = .systemFont(ofSize: 12)
        timeLabel.textColor = UIColor.white.withAlphaComponent(0.5)
    }

    func configure(with item: PageItem) {

        nameLabel.text = item.title
        statusLabel.text = item.status
        messageLabel.text = item.subtitle
        timeLabel.text = item.time

        avatarImageView.isHidden = !item.isChat
        timeLabel.isHidden = !item.isChat

        statusLabel.isHidden = item.status == nil
        messageLabel.isHidden = item.subtitle == nil

        nameLabel.textAlignment = item.isChat ? .left : .center
    }
}
