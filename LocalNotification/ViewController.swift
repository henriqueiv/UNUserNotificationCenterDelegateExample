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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didTouchSchedule(_ sender: Any) {
        scheduleNotification()
    }
    
    private func scheduleNotification() {
        if let text = secondsTextField.text, let seconds = Int(text) {
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "subtitle"
            content.body = "Body"
            content.categoryIdentifier = "category"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: false)
            
            let request = UNNotificationRequest(identifier: "MySpeechNotification", content: content, trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request) { (error: Error?) in
                if error != nil {
                    print("Ops, something happened: \(error!)")
                }
            }
        } else {
            print("Dude, tap an Int!")
        }
    }
    
}

