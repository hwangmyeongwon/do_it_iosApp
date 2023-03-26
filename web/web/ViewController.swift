//
//  ViewController.swift
//  web
//
//  Created by 황명원 on 2022/01/06.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(url: String){
        let myUrl=NSURL(string: url)
        let myRequest=NSURLRequest(url: myUrl as! URL)
        myWebView.loadRequest(myRequest as URLRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.delegate=self
        loadWebPage(url: "http://2sam.net")
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage(url: "http://fallinmac.tistory.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage(url: "http://blog.2sam.net")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString="<h1> HTML String </h1><p> String 변수를 이용한 웹페이지 </p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let myHtmlBundle = Bundle.main
        let filePath=myHtmlBundle.path(forResource: "htmlView", ofType: "html")
        
        loadWebPage(url: filePath!)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

