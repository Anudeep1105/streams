// MARK: - HomeViewController.swift
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    // Top Tabs
    @IBOutlet weak var callsButton: UIButton!
    @IBOutlet weak var chatsButton: UIButton!
    @IBOutlet weak var voicemailButton: UIButton!
    @IBOutlet weak var smsButton: UIButton!
    @IBOutlet weak var faxButton: UIButton!

    // Bottom Tabs
    @IBOutlet weak var recentsButton: UIButton!
    @IBOutlet weak var contactsButton: UIButton!
    @IBOutlet weak var dialpadButton: UIButton!
    @IBOutlet weak var smartBoxButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!

    private var items: [PageItem] = []

    private let chatUsers: [PageItem] = [
        PageItem(title: "First Chat",  subtitle: "Last Message", time: "10:45 PM", isChat: true),
        PageItem(title: "Second Chat", subtitle: "Last Message", time: "10:45 PM", isChat: true),
        PageItem(title: "Third Chat",  subtitle: "Last Message", time: "10:45 PM", isChat: true),
        PageItem(title: "Fourth Chat", subtitle: "Last Message", time: "10:45 PM", isChat: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80

        highlightTopTab(chatsButton)
        highlightBottomTab(recentsButton)
        showChatList()
    }

    // MARK: - Top Tabs
    @IBAction func chatsTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showChatList()
    }

    @IBAction func callsTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPage("Calls")
    }

    @IBAction func voicemailTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPage("Voicemail")
    }

    @IBAction func smsTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPage("SMS")
    }

    @IBAction func faxTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPage("Fax")
    }

    // MARK: - Bottom Tabs
    @IBAction func recentsTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showChatList()
    }

    @IBAction func contactsTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPage("Contacts")
    }

    @IBAction func dialpadTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPage("Dialpad")
    }

    @IBAction func smartBoxTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPage("SmartBox")
    }

    @IBAction func connectTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPage("Connect")
    }

    // MARK: - Helpers
    private func showChatList() {
        items = chatUsers
        tableView.reloadData()
    }

    private func showPage(_ name: String) {
        items = [
            PageItem(title: "You are in \(name) page",
                     subtitle: nil,
                     time: nil,
                     isChat: false)
        ]
        tableView.reloadData()
    }

    private func highlightTopTab(_ selected: UIButton) {
        [callsButton, chatsButton, voicemailButton, smsButton, faxButton]
            .forEach { $0?.tintColor = UIColor.white.withAlphaComponent(0.5) }
        selected.tintColor = .white
    }

    private func highlightBottomTab(_ selected: UIButton) {
        [recentsButton, contactsButton, dialpadButton, smartBoxButton, connectButton]
            .forEach { $0?.tintColor = UIColor.white.withAlphaComponent(0.5) }
        selected.tintColor = .white
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChatCell",
            for: indexPath
        ) as! ChatCell

        cell.configure(with: items[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

