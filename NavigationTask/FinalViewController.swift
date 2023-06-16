//
//  FinalViewController.swift
//  NavigationTask
//
//  Created by Meghana on 14/06/23.
//

import UIKit
protocol FinalViewControllerDelegate: AnyObject {
    
}

class FinalViewController: UIViewController {

    weak var delegate: FinalViewControllerDelegate?
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
