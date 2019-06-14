//
//  EventWebViewController.swift
//  'Bout Time
//
//  Created by Arwin Oblea on 6/6/19.
//  Copyright © 2019 Arwin Oblea. All rights reserved.
//

import UIKit
import WebKit

class EventWebViewController: UIViewController {
  
  // MARK: - Properties
  let webView = WKWebView()
  var transferredURL: String = ""

  override func loadView() {
    self.view = webView
    
    setupNavBar()
    requestAndLoadURL()
  }
  
  // MARK: - Methods
  func requestAndLoadURL() {
    // Request url and loads it
    if let url = URL(string: transferredURL) {
      let request = URLRequest(url: url)
      webView.load(request)
    }
  }
  
  func setupNavBar() {
    let webViewBarImage = UIImage(named: "webview_bar")
    navigationController?.navigationBar.setBackgroundImage(webViewBarImage , for: UIBarMetrics.default)
    let close = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(closeButtonTapped))
    navigationItem.rightBarButtonItem = close
    navigationItem.rightBarButtonItem?.tintColor = .white
  }
  
  @objc func closeButtonTapped() {
    dismiss(animated: true, completion: nil)
  }
}
