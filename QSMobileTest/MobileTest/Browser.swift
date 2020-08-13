//
//  Browser.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-13.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI
import WebKit

class Browser: UIViewController  {
    
    var webView = WKWebView()
    override func viewDidLoad() {
        self.view.addSubview(webView)
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.webView.load(URLRequest(url: URL(string: "https://www.quickseries.com")!))
    }
    

}

