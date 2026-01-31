import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var callsButton: UIButton!
    @IBOutlet weak var chatsButton: UIButton!
    @IBOutlet weak var voicemailButton: UIButton!
    @IBOutlet weak var smsButton: UIButton!
    @IBOutlet weak var faxButton: UIButton!

    @IBOutlet weak var recentsButton: UIButton!
    @IBOutlet weak var contactsButton: UIButton!
    @IBOutlet weak var dialpadButton: UIButton!
    @IBOutlet weak var smartBoxButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!

    private var items: [PageItem] = []

    private let chatUsers: [PageItem] = [
        PageItem(title: "Sam", subtitle: "Last Message", time: "10:20 PM", isChat: true, status: "On Mobile"),
        PageItem(title: "India", subtitle: "Hello", time: "11:45 PM", isChat: true, status: "Company Team")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80

        showChatList()
        hideKeyboardWhenTappedAround()
    }

    private func showChatList() {
        items = chatUsers
        tableView.reloadData()
    }
}

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
        return cell
    }
}

