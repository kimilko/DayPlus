//
//  ViewController.swift
//  DayPlus
//
//  Created by 김승호 on 2/17/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        webView.isInspectable = true
        
        // 웹페이지 로드 (웹앱 주소 변경 가능)
        if let url = URL(string: "http://devsun.work:18080") {
            webView.load(URLRequest(url: url))
        }
        
//        // https://velog.io/@wannabe_eung/UserNotifications-Framework%EB%A5%BC-%EC%95%8C%EC%95%84%EB%B3%B4%EC%9E%90
//        
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            
//            if let error = error {
//                // Handle the error here.
//            }
//            
//            // Enable or disable features based on the authorization.
//        }
//        
//        let content = UNMutableNotificationContent()
//        content.title = "Weekly Staff Meeting"
//        content.body = "Every Tuesday at 2pm"
//        
//        
//        
//        // Configure the recurring date.
//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//
//        dateComponents.weekday = 4  // Tuesday
//        dateComponents.hour = 15    // 14:00 hours
//        dateComponents.minute = 13
//           
//        // Create the trigger as a repeating event.
//        let trigger = UNCalendarNotificationTrigger(
//                 dateMatching: dateComponents, repeats: true)
//        
//        
//        
//        
//        // Create the request
//        let uuidString = UUID().uuidString
//        let request = UNNotificationRequest(identifier: uuidString,
//                    content: content, trigger: trigger)
//
//        // Schedule the request with the system.
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.add(request) { (error) in
//           if error != nil {
//              // Handle any errors.
//           }
//        }
    }
}
