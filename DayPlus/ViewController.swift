//
//  ViewController.swift
//  DayPlus
//
//  Created by 김승호 on 2/17/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        webView = WKWebView(frame: view.bounds)
        
        webView.isInspectable = true
        
        // 웹페이지 로드 (웹앱 주소 변경 가능)
        if let url = URL(string: "http://devsun.work:18080") {
            webView.load(URLRequest(url: url))
        }
        
        view.addSubview(webView)
    }
}
