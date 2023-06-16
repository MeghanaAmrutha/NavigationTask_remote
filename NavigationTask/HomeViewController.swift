//
//  HomeViewController.swift
//  NavigationTask
//
//  Created by Meghana on 14/06/23.
//

import UIKit
protocol HomeViewControllerDelegate: AnyObject{
    
}
class HomeViewController: UIViewController, DetailsViewControllerDelegate {

    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func browseButton(_ sender: Any) {
        browseButtonTapped()
    }
    
    func browseButtonTapped() {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {
            return
        }
        detailVC.delegate = self
        detailVC.title = "BROWSE"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

