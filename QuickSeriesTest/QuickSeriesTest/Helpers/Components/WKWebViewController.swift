//
//  WKWebViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-19.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import WebKit

class WkWebViewController: UIViewController {
  var webview: WKWebView?
  var Url = ""
  
  @objc func touchUp() {
    self.dismiss(animated: true, completion: {})
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if Url != "", let url = URL(string: Url) {
      self.webview!.load(URLRequest(url: url))
    }
  }
  
  override func loadView() {
    super.loadView()
    
    let configuration = WKWebViewConfiguration()
    configuration.allowsInlineMediaPlayback = true
    
    if #available(iOS 9.0, *) {
      configuration.requiresUserActionForMediaPlayback = false
      configuration.allowsAirPlayForMediaPlayback=true
    } else {
      configuration.mediaPlaybackAllowsAirPlay=true
      configuration.mediaPlaybackRequiresUserAction = false
    }
    
    self.webview = WKWebView(frame: UIScreen.main.bounds, configuration: configuration)
    
    self.view = self.webview
    let button = UIButton(frame: CGRect(x: 3, y: 15, width: 80, height: 30))
    button.setTitle("Close", for: UIControl.State.normal)
    button.addTarget(self, action: #selector(touchUp), for: UIControl.Event.touchUpInside)
    button.setTitleColor(self.view.tintColor, for: UIControl.State.normal)
    self.view.addSubview(button)
  }
}
