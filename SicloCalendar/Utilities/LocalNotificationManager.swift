//
//  LocalNotificationManager.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit

class LocalNotificationManager: NSObject {
    
    static let shared = LocalNotificationManager()

    private override init() {
        
    }
    
    func scheduleNotification(title:String, body:String, timeInterval: TimeInterval = 1.0, identifier: String? = "Local Notification"){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
                self.requestLocalNotificationAuthorization()
            }else{
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = body
                content.sound = UNNotificationSound.default
                let date = Date(timeIntervalSinceNow: timeInterval)
                let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                let request = UNNotificationRequest(identifier: identifier!, content: content, trigger: trigger)
                notificationCenter.add(request) { (error) in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func cancelLocalNotificationBy(identifier:String){
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [identifier])
    }
    
    func requestLocalNotificationAuthorization(){
        let notificationCenter = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }
}
