//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Henrique Valcanaia on 20/07/17.
//  Copyright © 2017 Henrique Valcanaia. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                if error != nil {
                    print("Ops, error trying to get authorization")
                } else {
                    if !granted {
                        print("Dude, let me use notifications!")
                    }
                }
            }
        }
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Oh, will present a notification, let's see the identifier: \(notification.request.identifier)")
        print("Maybe I should start my speech thing...")
    }
    
}

