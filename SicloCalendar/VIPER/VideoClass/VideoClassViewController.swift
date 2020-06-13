//
//  VideoClassViewController.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var goBackButton: UIButton!
    
    var presenter:VideoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
     func setupUI() {
        goBackButton.layer.cornerRadius = 25
        
        
        webView.uiDelegate = self
        guard let videoUrl = presenter?.requestForVideoUrl() else {
            return
        }
        let myRequest = URLRequest(url: videoUrl)
        
        webView.load(myRequest)
    }
    
    @IBAction func goBack(){
        presenter?.goBack()
    }

}
