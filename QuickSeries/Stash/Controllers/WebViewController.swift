//
//  WebViewController.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView:UIWebView!
    
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: url)
        else{ return }

        setupWebView(url: url)
    }
    func setupWebView(url:URL)
    {
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
