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
    var openTab: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        hideKeyboardWhenTappedAround()

        if let tab = openTab {
            openTabFromSiri(tab)
        } else {
            setupInitialUI()
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        // 🔥 Large chat rows
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }

    private func setupInitialUI() {
        highlightTopTab(chatsButton)
        highlightBottomTab(recentsButton)
        showChatList()
    }

    // MARK: - Tabs
    @IBAction func chatsTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showChatList()
    }

    @IBAction func callsTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPlaceholder("Calls")
    }

    @IBAction func voicemailTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPlaceholder("Voicemail")
    }

    @IBAction func smsTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPlaceholder("SMS")
    }

    @IBAction func faxTapped(_ sender: UIButton) {
        highlightTopTab(sender)
        showPlaceholder("Fax")
    }

    @IBAction func recentsTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showChatList()
    }

    @IBAction func contactsTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPlaceholder("Contacts")
    }

    @IBAction func dialpadTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPlaceholder("Dialpad")
    }

    @IBAction func smartBoxTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPlaceholder("SmartBox")
    }

    @IBAction func connectTapped(_ sender: UIButton) {
        highlightBottomTab(sender)
        showPlaceholder("Connect")
    }

    private func showChatList() {
        items = ChatRepository.fetchChats()
        tableView.reloadData()
    }

    private func showPlaceholder(_ name: String) {
        items = [
            PageItem(title: name, subtitle: nil, time: nil, isChat: false, status: nil)
        ]
        tableView.reloadData()
    }

    private func highlightTopTab(_ selected: UIButton) {
        [callsButton, chatsButton, voicemailButton, smsButton, faxButton]
            .forEach { $0?.setUnselectedStyle() }
        selected.setSelectedStyle()
    }

    private func highlightBottomTab(_ selected: UIButton) {
        [recentsButton, contactsButton, dialpadButton, smartBoxButton, connectButton]
            .forEach { $0?.setUnselectedStyle() }
        selected.setSelectedStyle()
    }
     func openTabFromSiri(_ tab: String) {

        switch tab {

        case "chats":
            highlightTopTab(chatsButton)
            highlightBottomTab(recentsButton)
            showChatList()

        case "calls":
            highlightTopTab(callsButton)
            showPlaceholder("Calls")

        case "voicemail":
            highlightTopTab(voicemailButton)
            showPlaceholder("Voicemail")

        case "sms":
            highlightTopTab(smsButton)
            showPlaceholder("SMS")

        case "fax":
            highlightTopTab(faxButton)
            showPlaceholder("Fax")

        case "contacts":
            highlightBottomTab(contactsButton)
            showPlaceholder("Contacts")

        case "dialpad":
            highlightBottomTab(dialpadButton)
            showPlaceholder("Dialpad")

        case "smartbox":
            highlightBottomTab(smartBoxButton)
            showPlaceholder("SmartBox")

        case "connect":
            highlightBottomTab(connectButton)
            showPlaceholder("Connect")

        default:
            setupInitialUI()
        }
    }

}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
