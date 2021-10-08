//
//  ChatTableViewCell.swift
//  Messenger
//
//  Created by Анна Заблуда on 07.10.2021.
//

import UIKit

protocol ConversationCellConfiguration: AnyObject {
    var name: String? {get set}
    var message: String? {get set}
    var date: Date? {get set}
    var online: Bool {get set}
    var hasUnreadMessages: Bool {get set}
}

class ChatTableViewCell: UITableViewCell, ConversationCellConfiguration {
    
    var name: String?
    var message: String?
    var date: Date?
    var online: Bool = false
    var hasUnreadMessages: Bool = false
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    func configure(person: Person) {
        selectionStyle = .none
        self.name = person.name
        self.message = person.message
        self.date = person.date
        self.online = person.online
        self.hasUnreadMessages = person.hasUnreadMessages
        accessoryType = .disclosureIndicator
        if online {
            nameLable.backgroundColor = #colorLiteral(red: 1, green: 0.9981806874, blue: 0.6548470855, alpha: 1)
            nameLable.layer.masksToBounds = true
            nameLable.layer.cornerRadius = 5
        }
        nameLable.text = self.name == nil ? "User" : name
        nameLable.font = UIFont.boldSystemFont(ofSize: 20)
        messageLable.text = self.message == nil ? "No messages yet" : self.message
        if let date = date {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("HH:mm")
            dateLable.text = formatter.string(from: date)
        }
        if hasUnreadMessages {
            messageLable.font = UIFont.boldSystemFont(ofSize: 17)
        }
    }
}
