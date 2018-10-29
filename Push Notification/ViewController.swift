//
//  ViewController.swift
//  Push Notification
//
//  Created by mac on 10/27/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import UserNotifications    //  Bước 1: Thêm thư viện

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createNotification()    //  Gọi hàm ở viewDidLoad
        UNUserNotificationCenter.current().delegate = self      //  Delegate
    }
    
    func createNotification()   //  Bước 2: Tạo hàm cài đặt Notif
    {
        let content = UNMutableNotificationContent()       //  Tạo nội dung
        content.title = "This is Title"
        content.subtitle = "This is Subtitle"
        content.body  = "This is Body"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        //  Tạo yêu cầu
        let requets = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        
        //  Thêm yêu cầu vào hệ thống Thông Báo
        UNUserNotificationCenter.current().add(requets) { (error) in
            if error != nil {   print("Lỗi: \(error as Any)")  }
        }
    }
}

        //  Đoạn code này giúp hiện notif trong khi app chạy
extension ViewController: UNUserNotificationCenterDelegate
{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .alert, .badge])
    }
}

