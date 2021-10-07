//
//  ViewController.swift
//  Messenger
//
//  Created by Анна Заблуда on 07.10.2021.
//

import UIKit

struct Person {
    var name: String?
    var message: String?
    var date: Date?
    var online: Bool
    var hasUnreadMessages: Bool
}

class ConversationsListViewController: UIViewController {
    
    private lazy var width = UIScreen.main.bounds.width
    private lazy var height = UIScreen.main.bounds.height
    
    let personsOnline = [Person(name: "Jon", message: "Hi, who are u?", date: Date(), online: true, hasUnreadMessages: true)]
    let personsOffline = [Person(name: nil, message: nil, date: nil, online: false, hasUnreadMessages: false)]
    
    private let cellIdentifire = String(describing: ChatTableViewCell.self)
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: view.frame)
        tv.register(UINib(nibName: cellIdentifire, bundle: nil), forCellReuseIdentifier: cellIdentifire)
        return tv
    }()
    
    private lazy var myProfile: UIBarButtonItem = {
        let mp = UIBarButtonItem()
        mp.action = #selector(pressedProfileButton)
        mp.tintColor = #colorLiteral(red: 0.2553068697, green: 0.274802655, blue: 0.3004902601, alpha: 1)
        mp.target = self
        mp.title = "MD"
        return mp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Tinkoff Chat"
        navigationItem.searchController =  UISearchController()
        navigationItem.rightBarButtonItem = myProfile
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func pressedProfileButton() {
        let vc = ProfileViewController()
        self.present(vc, animated: true, completion: nil)
    }
}

extension ConversationsListViewController: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return personsOnline.count
        }
        return personsOffline.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Online"
        }
        return "Offline"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = indexPath.section == 0 ? personsOnline[indexPath.row] : personsOffline[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.configure(person: person)
        return cell
    }
    
}

extension ConversationsListViewController: UITableViewDelegate {
    
}

extension ConversationsListViewController: UISearchControllerDelegate {

    func willPresentSearchController(_ searchController: UISearchController){
        print("\(type(of: self)) \(#function)")
    }
}
