//
//  SecondSwiftUIView.swift
//  SampleApp
//
//  Created by Ryota on 2020/12/22.
//

import UIKit
import WebKit

class SecondViewController: UIViewController {
    
    var webView: WKWebView!
    var argTitle: String!
    var argURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = argTitle
        self.navigationController?.setToolbarHidden(false , animated: true)
        webView = WKWebView(frame: view.frame)
        edgesForExtendedLayout = [] //ナビゲーションバーでWebViewが隠れるのを防ぐ
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight] //デバイスを回転した際にwebViewのサイズが変更されるようにしました。
        self.navigationController?.navigationBar.titleTextAttributes = AppCongig.Navigation.titleTextAttributesWithSize13
        if let myURL = URL(string: argURL) {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
            self.view.addSubview(webView)
        }
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.titleTextAttributes = AppCongig.Navigation.titleTextAttributesWithSize17
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    @IBAction func forward(_ sender: UIBarButtonItem) {
        self.webView?.goForward()
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.webView?.goBack()
    }
    
    @IBAction func reflesh(_ sender: UIBarButtonItem) {
        self.webView?.reload()
    }
}
