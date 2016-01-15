//
//  ViewController.swift
//  WebViewUsingJS
//
//  Created by uitox_macbook on 2016/1/15.
//  Copyright © 2016年 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

	@IBOutlet weak var webView: UIWebView!
	var request:NSMutableURLRequest?
	
	override func viewDidLoad() {
		super.viewDidLoad()

		let indexUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("clickMe", ofType: "html")!)

		self.request = NSMutableURLRequest(URL: indexUrl)

		self.webView.loadRequest(self.request!)
		self.webView.delegate = self

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		let url = request.URL!
		
		if url.scheme == "devzeng" {
			if url.host == "login" {
				webView.stringByEvaluatingJavaScriptFromString("alert('呼叫成功')")
				return false
			}
		}
		
		return true
	}
}

