//
//  ViewController.swift
//  Messenger
//
//  Created by Анна Заблуда on 27.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var width = UIScreen.main.bounds.width
    private lazy var height = UIScreen.main.bounds.height
    
    private lazy var profilePhoto: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: width * 0.18,
                                           y: height * 0.18,
                                           width: width * 0.64,
                                           height: width * 0.64))
        iv.backgroundColor = #colorLiteral(red: 0.8949689865, green: 0.9089159369, blue: 0.1692225933, alpha: 1)
        iv.layer.cornerRadius = width * 0.32
        return iv
    }()
    
    private lazy var editButton: UIButton = {
        let but = UIButton(frame: CGRect(x: profilePhoto.frame.width - 40,
                                         y: profilePhoto.frame.width - 30,
                                         width: 40, height: 40))
        but.setTitle("Edit", for: .normal)
        but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        but.setTitleColor(#colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1), for: .normal)
        return but
    }()
    
    private lazy var profileInitials: UILabel = {
        let lbl = UILabel(frame: CGRect(x: profilePhoto.frame.width * 0.15,
                                        y:  profilePhoto.frame.width * 0.15,
                                        width: profilePhoto.frame.width * 0.7,
                                        height: profilePhoto.frame.width * 0.7))
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 100)
        var initials = profileName.text?.split(separator: " ").compactMap { $0.first }
        lbl.text = "\(initials?.first ?? " ")\(initials?.last ?? " ")"
        lbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return lbl
    }()
    
    private lazy var profileName: UILabel = {
        let lbl = UILabel(frame: CGRect(x: width * 0.1,
                                        y: height * 0.56,
                                        width: width * 0.8,
                                        height: 20))
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.text = "Marina Dudarenko"
        return lbl
    }()
    
    private lazy var profileDescription: UILabel = {
        let lbl = UILabel(frame: CGRect(x: width * 0.2,
                                        y: height * 0.62,
                                        width: width * 0.6,
                                        height: 120))
        lbl.numberOfLines = 0
        lbl.text = "UX/UI designer, web-designer\nMoscow, Russia"
        return lbl
    }()
    
    private lazy var saveButton: UIButton = {
        let but = UIButton(frame: CGRect(x: width * 0.15,
                                         y: height * 0.91,
                                         width: width * 0.7,
                                         height: 40))
        but.setTitle("Save", for: .normal)
        but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        but.setTitleColor(#colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1), for: .normal)
        but.backgroundColor = #colorLiteral(red: 0.9646012187, green: 0.9647662044, blue: 0.9645908475, alpha: 1)
        but.layer.cornerRadius = 15
        return but
    }()
    
    // в init еще не проинициилизированы view поэтому никакой frame мы вывести не можем

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        print(editButton.frame)
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(profilePhoto)
        view.addSubview(profileName)
        profilePhoto.addSubview(profileInitials)
        view.addSubview(profileDescription)
        profilePhoto.addSubview(editButton)
        view.addSubview(saveButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if viewControllerLifecycleIsOn {
            print("ViewController:", #function)
        }
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if viewControllerLifecycleIsOn {
            print("ViewController:", #function)
        }
        print(editButton.frame) // выведутся одинаковые значения, так как я вручную их прописываю.
        // если делать через сториборд, то выведутся разные, так как нас просят поставить разные модели в сториборде и симуляторе от чего в ходе программы frame будет перерасчитан.
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        if viewControllerLifecycleIsOn {
            print("ViewController:", #function)
        }
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        if viewControllerLifecycleIsOn {
            print("ViewController:", #function)
        }
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if viewControllerLifecycleIsOn {
            print("ViewController:", #function)
        }
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if viewControllerLifecycleIsOn {
            print("ViewController:", #function)
        }
        super.viewDidDisappear(animated)
    }
}

