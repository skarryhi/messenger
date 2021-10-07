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
        self.name = person.name
        self.message = person.message
        self.date = person.date
        self.online = person.online
        self.hasUnreadMessages = person.hasUnreadMessages
        accessoryType = .disclosureIndicator
        if online {
            nameLable.backgroundColor = #colorLiteral(red: 0.8949689865, green: 0.9089159369, blue: 0.1692225933, alpha: 1)
        }
        nameLable.text = self.name == nil ? "User" : name
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
