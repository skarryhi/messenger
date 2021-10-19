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
    
    private var color = UserDefaults.standard.string(forKey: "color") ?? "white"
    private var profileName: String? = "Marina Dudarenko"
    private var profileImage: UIImage?
    
    let personsOnline = [Person(name: "Jon", message: "Hi, who are u?", date: Date(), online: true, hasUnreadMessages: true),
                         Person(name: "Mary", message: nil, date: Date(), online: true, hasUnreadMessages: false),
                         Person(name: "Ann", message: "Where?", date: Date(), online: true, hasUnreadMessages: true),
                         Person(name: nil, message: "Hi", date: Date(), online: true, hasUnreadMessages: false),
                         Person(name: "Nina", message: "Pls", date: Date(), online: true, hasUnreadMessages: true)]
    let personsOffline = [Person(name: "Sasha", message: nil, date: nil, online: false, hasUnreadMessages: false),
                          Person(name: nil, message: "No, I'm hear", date: Date(), online: false, hasUnreadMessages: false),
                          Person(name: "L", message: "Ok", date: Date(), online: false, hasUnreadMessages: true),
                          Person(name: "Miya", message: "💗💗💗", date: Date(), online: false, hasUnreadMessages: true),
                          Person(name: "CJ", message: "Not now", date: Date(), online: false, hasUnreadMessages: false)]
    
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
        var initials = profileName?.split(separator: " ").compactMap { $0.first }
        if let initials = initials, initials.count > 0 {
            mp.title = "\(initials[0])"
            if initials.count > 1 {
                mp.title! += "\(initials[1])"
            }
        }
        return mp
    }()
    
    private lazy var themesButton: UIBarButtonItem = {
        let bb = UIBarButtonItem()
        bb.action = #selector(pressedThemesButton)
        bb.target = self
        bb.tintColor = #colorLiteral(red: 0.2553068697, green: 0.274802655, blue: 0.3004902601, alpha: 1)
        bb.title = "Settings"
        return bb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Tinkoff Chat"
        navigationItem.searchController =  UISearchController()
        navigationItem.searchController?.delegate = self
        navigationItem.rightBarButtonItem = myProfile
        navigationItem.leftBarButtonItem = themesButton
        navigationController?.navigationBar.prefersLargeTitles = true
        switch color {
        case "white":
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.backgroundColor = .white
        case "yellow":
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.957610786, green: 0.9575006366, blue: 0.6299677491, alpha: 1)
            navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.957610786, green: 0.9575006366, blue: 0.6299677491, alpha: 1)
        case "green":
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8643452525, green: 0.9681846499, blue: 0.7687479854, alpha: 1)
            navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.8643452525, green: 0.9681846499, blue: 0.7687479854, alpha: 1)
        default:
            break
        }
    }
    
    @objc private func pressedProfileButton() {
        let vc = ProfileViewController()
        vc.profileName.text = profileName
        vc.profilePhoto.image = profileImage
        vc.profileInitials.text = myProfile.title
        vc.profileInfoChanging = { image, name in
            self.profileName = name
            self.profileImage = image
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func pressedThemesButton() {
        let vc = ThemesViewController()
        vc.logThemeChanging = { color, name in
            self.navigationController?.navigationBar.barTintColor = color
            self.navigationController?.navigationBar.backgroundColor = color
            UserDefaults.standard.set(name, forKey: "color")
            UserDefaults.standard.synchronize()
        }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatController = ConversationViewController()
        if indexPath.section == 0 {
            chatController.name = personsOnline[indexPath.row].name
        } else {
            chatController.name = personsOffline[indexPath.row].name
        }
        if chatController.name == nil {
            chatController.name = "User"
        }
        navigationController?.pushViewController(chatController, animated: true)
    }
}

extension ConversationsListViewController: UISearchControllerDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController){
        print("\(type(of: self)) \(#function)")
    }
}
