//
//  ViewController.swift
//  DayPlus
//
//  Created by 김승호 on 2/17/25.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if let body = message.body as? [String: Any],
           let data = body["data"] as? String {
            print(data)
        }
    }
    
    private var webView: WKWebView!
    
    override func viewDidLoad() {
//        // 웹페이지 로드 (웹앱 주소 변경 가능)
//        if let url = URL(string: "http://devsun.work:18080") {
//            webView.load(URLRequest(url: url))
//        }
        
        setWebView()
        
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
    
    func setWebView() {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "getRequestData")
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.userContentController = contentController
        
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        
        webView = WKWebView(frame: view.frame, configuration: configuration)
        webView.isInspectable = true
        
        loadLocalUrl()
    }
    
    func loadLocalUrl() {
        if let localUrl = Bundle.main.url(forResource: "sample", withExtension: "html") {
            let request = URLRequest(url:localUrl)
            webView.load(request)
            self.view.addSubview(webView)
        }
    }
}
