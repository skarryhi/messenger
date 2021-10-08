//
//  MessageTableViewCell.swift
//  Messenger
//
//  Created by mklotz on 08.10.2021.
//

import UIKit

protocol MessageCellConfuguration: AnyObject {
    var messageText: String? {get set}
}

class MessageTableViewCell: UITableViewCell, MessageCellConfuguration {

    var messageText: String?
    
    @IBOutlet weak var sentLable: UILabel!
    @IBOutlet weak var receivedLable: UILabel!

    func configure(message: Message) {
        if message.sent {
            sentLable.text = message.text
            sentLable.layer.masksToBounds = true
            sentLable.layer.cornerRadius = 5
            receivedLable.isHidden = true
        } else {
            receivedLable.text = message.text
            receivedLable.layer.masksToBounds = true
            receivedLable.layer.cornerRadius = 5
            sentLable.isHidden = true
        }
    }
    
}
