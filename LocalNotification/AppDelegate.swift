//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Henrique Valcanaia on 20/07/17.
//  Copyright © 2017 Henrique Valcanaia. All rights reserved.
//

import AVFoundation
import UIKit
import UserNotifications

enum NotificationName: String {
    case mySpeechNotification
}


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
        if (notification.request.identifier == NotificationName.mySpeechNotification.rawValue) {
            print("Speaking...")
            let begin = AVSpeechUtterance(string: " Hello ")
            begin.voice = AVSpeechSynthesisVoice(language: "en-US")
            begin.rate = 0.08
            
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(begin)
        } else {
            print("Nothing to say...")
        }
        
        
    }
    
}

