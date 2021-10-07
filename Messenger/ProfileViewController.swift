//
//  ViewController.swift
//  Messenger
//
//  Created by Анна Заблуда on 27.09.2021.
//

import UIKit
import AVKit

final class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private lazy var width = UIScreen.main.bounds.width
    private lazy var height = UIScreen.main.bounds.height
    
    private lazy var profilePhoto: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: width * 0.18,
                                           y: height * 0.18,
                                           width: width * 0.64,
                                           height: width * 0.64))
        iv.backgroundColor = #colorLiteral(red: 0.8949689865, green: 0.9089159369, blue: 0.1692225933, alpha: 1)
        iv.layer.cornerRadius = width * 0.32
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var editButton: UIButton = {
        let but = UIButton(frame: CGRect(x: profilePhoto.frame.maxX - 40,
                                         y: profilePhoto.frame.maxY - 30,
                                         width: 40, height: 40))
        but.setTitle("Edit", for: .normal)
        but.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        but.setTitleColor(#colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1), for: .normal)
        but.addTarget(self,
                         action: #selector(pressedEditButton),
                         for: .touchUpInside)
        return but
    }()
    
    private lazy var profileInitials: UILabel = {
        let lbl = UILabel(frame: CGRect(x: profilePhoto.frame.width * 0.15,
                                        y:  profilePhoto.frame.width * 0.15,
                                        width: profilePhoto.frame.width * 0.7,
                                        height: profilePhoto.frame.width * 0.7))
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: profilePhoto.frame.width * 0.4)
        var initials = profileName.text?.split(separator: " ").compactMap { $0.first }
        if let initials = initials, initials.count > 0 {
            lbl.text = "\(initials[0])"
            if initials.count > 1 {
                lbl.text! += "\(initials[1])"
            }
        }
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

    // в init еще не проинициилизированы views поэтому никакой frame мы вывести не можем

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        print(editButton.frame)
        
        view.addSubview(profilePhoto)
        view.addSubview(profileName)
        profilePhoto.addSubview(profileInitials)
        view.addSubview(profileDescription)
        view.addSubview(editButton)
        view.addSubview(saveButton)
    }
    
    //MARK: - Editing Profile Photo
    
    func createAndPresentPickerController(for type: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(type) &&
            (type != .camera || AVCaptureDevice.authorizationStatus(for: .video) != .denied) {
            let vc = UIImagePickerController()
            vc.sourceType = type
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
        } else {
            let messege = type == .camera ? "Camera not allow" : "Gallery not allow"
            let alert = UIAlertController(title: "Oops", message: messege, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    @objc
    func pressedEditButton() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.view.tintColor = .black
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default) { _ in
            self.createAndPresentPickerController(for: .camera)
        })
        actionSheet.addAction(UIAlertAction(title: "Choose from library", style: .default) { _ in
            self.createAndPresentPickerController(for: .photoLibrary)
        })
        actionSheet.addAction(UIAlertAction(title: "Remove Current Photo", style: .default) { _ in
            self.profilePhoto.image = nil
            self.profileInitials.isHidden = false
        })
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else { return }
        self.profileInitials.isHidden = true
        self.profilePhoto.image = image
    }
    
    //MARK: - Debug from hw1
    
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

