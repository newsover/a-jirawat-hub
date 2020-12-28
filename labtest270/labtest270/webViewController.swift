//
//  webViewController.swift
//  labtest270
//
//  Created by Student on 7/11/2561 BE.
//  Copyright © 2561 Student. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController {
    var schoolSite:String=""
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myUrl = URL(string: schoolSite)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
