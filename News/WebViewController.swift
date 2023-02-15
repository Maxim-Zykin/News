//
//  WebViewController.swift
//  News
//
//  Created by Максим Зыкин on 15.02.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var selectedNews: String?
    var newsURL = ""
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedNews
    }
}
