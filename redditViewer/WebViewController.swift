//
//  WebViewController.swift
//  redditViewer
//
//  Created by Andy Woodard on 10/5/16.
//  Copyright © 2016 Andy Woodard. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webContent: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let url = NSURL (string: base + suffix);
        let requestObj = NSURLRequest(URL: url!);
        webContent.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        suffix = ""
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}
