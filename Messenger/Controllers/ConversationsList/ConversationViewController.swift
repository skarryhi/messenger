//
//  ConversationViewController.swift
//  Messenger
//
//  Created by mklotz on 08.10.2021.
//

import UIKit


struct Message {
    let text: String
    let sent: Bool
}

class ConversationViewController: UIViewController {

    private let cellIdentifire = String(describing: MessageTableViewCell.self)
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.frame)
        tv.register(UINib(nibName: cellIdentifire, bundle: nil), forCellReuseIdentifier: cellIdentifire)
        tv.separatorStyle = .none
        tv.estimatedRowHeight = UITableView.automaticDimension
        tv.allowsSelection = false
        return tv
    }()
    
    var name: String?
    
    let messages = [Message(text: "Lisa, I need help moving this box of toys for the garage sale. Will you help me?", sent: true),
                   Message(text: "Sure!", sent: false),
                   Message(text: "You can't give away your Harry Potter collection!", sent: false),
                   Message(text: "Well, I am not taking them to college with me Do you want them?", sent: true),
                   Message(text: "Yes", sent: false),
                   Message(text: "I will read them all again, and it will remind me of how we used to pretend to be Harry and Hermione", sent: true),
                   Message(text: "They are yours, Squirt", sent: false)]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        navigationItem.title = name
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2553068697, green: 0.274802655, blue: 0.3004902601, alpha: 1)
    }
}

extension ConversationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? MessageTableViewCell else { return UITableViewCell() }
        cell.configure(message: messages[indexPath.row])
        return cell
    }
}
