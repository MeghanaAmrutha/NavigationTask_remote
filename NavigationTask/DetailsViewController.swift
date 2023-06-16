//
//  DetailsViewController.swift
//  NavigationTask
//
//  Created by Meghana on 14/06/23.
//

import UIKit
import WebKit

protocol DetailsViewControllerDelegate: AnyObject {
    
}

class DetailsViewController: UIViewController, FinalViewControllerDelegate, WKNavigationDelegate {
    
    weak var delegate: DetailsViewControllerDelegate?
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
       
    }
    @IBAction func confirmButton(_ sender: Any){
        confirmButtonTapped()
    }
    
    func confirmButtonTapped() {
        guard let finalVC = storyboard?.instantiateViewController(withIdentifier: "FinalViewController") as? FinalViewController else {
            return
        }
        finalVC.delegate = self
        navigationController?.pushViewController(finalVC, animated: true)
    }
}
    

