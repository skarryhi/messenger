//
//  ViewController.swift
//  Messenger
//
//  Created by Анна Заблуда on 27.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
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

