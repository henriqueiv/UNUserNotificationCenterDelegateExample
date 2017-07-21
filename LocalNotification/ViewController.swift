//
//  ViewController.swift
//  LocalNotification
//
//  Created by Henrique Valcanaia on 20/07/17.
//  Copyright © 2017 Henrique Valcanaia. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var secondsTextField: UITextField!
    
    @IBAction func didTouchSchedule(_ sender: Any) {
        scheduleNotification()
    }
    
    private func scheduleNotification() {
        guard let text = secondsTextField.text, let seconds = TimeInterval(text) else {
            print("Dude, type a TimeInterval!")
            return
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "subtitle"
        content.body = "Body"
        content.categoryIdentifier = "category"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: NotificationName.mySpeechNotification.rawValue, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error: Error?) in
            if error != nil {
                print("Ops, something happened: \(error!)")
            }
        }
        
    }
    
}

