//
//  AppDelegate.swift
//  Messenger
//
//  Created by Анна Заблуда on 27.09.2021.
//

import UIKit

#if DEBUG
let applicationLifecycleIsOn: Bool = true
let viewControllerLifecycleIsOn: Bool = true
#else
let applicationLifecycleIsOn: Bool = false
let viewControllerLifecycleIsOn: Bool = false
#endif

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if applicationLifecycleIsOn {
            print("Application moved from Not Running to Inactive:", #function)
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
         let controller = ProfileViewController()
         window?.rootViewController = controller
         window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        if applicationLifecycleIsOn {
            print("Application moved from Active to Inactive:", #function)
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if applicationLifecycleIsOn {
            print("Application moved from Inactive to Active:", #function)
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        if applicationLifecycleIsOn {
            print("Application moved from Inactive to Background:", #function)
        }
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        if applicationLifecycleIsOn {
            print("Application moved from Background to Inactive:", #function)
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        if applicationLifecycleIsOn {
            print("Application moved from Background to Not Running:", #function)
        }
    }
}

