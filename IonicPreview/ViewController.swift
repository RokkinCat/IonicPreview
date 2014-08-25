//
//  ViewController.swift
//  IonicPreview
//
//  Created by Nicholas Gartmann on 8/22/14.
//  Copyright (c) 2014 RokkinCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    required init(coder aDecoder: NSCoder) {
        self.webView = UIWebView()
        super.init(coder: aDecoder)
    }
    
    var webView:UIWebView

    override func viewDidLoad() {
        self.webView = UIWebView(frame: self.view.frame)
        self.webView.scrollView.scrollEnabled = false
        self.webView.scrollView.bounces = false

        
        self.view.addSubview(self.webView)
        
        let ipssec:Array = IPUtils.getIPAddress().componentsSeparatedByString(".")
        let fmt:String = "http://" + ".".join(ipssec[0...2]) + ".%i:8100"
        
        NSURLSession.sharedSession().configuration.timeoutIntervalForRequest = 250
        var found:Bool = false
        
        // Cycle through the LAN IP space to and hit the port for the 
        // live reload server to see who responds.
        for j in 0...255 {
            if(found) {
             break
            }
            
            let url = NSURL(string:NSString(format: fmt, j))
            let sem = dispatch_semaphore_create(9999999)
            NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
                if(response != nil) {
                    // If we get a response, load that URL up in the webView and 
                    //
                    self.loadURL(url)
                    found = true
                }
                dispatch_semaphore_signal(sem)
            }.resume()
            dispatch_semaphore_wait(sem, 250)
        }
        
        super.viewDidLoad()
    }
    
    func loadURL(url:NSURL) {
        let request = NSURLRequest(URL: url)
        self.webView.loadRequest(request)
    }
}


