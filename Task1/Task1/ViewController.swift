//
//  ViewController.swift
//  Task1
//
//  Created by Alexandr Sopilnyak on 23.12.2020.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var blackView1: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
    if view.bounds.width < view.bounds.height {
        return UITraitCollection(horizontalSizeClass: .compact)
    } else {
        return UITraitCollection(horizontalSizeClass: .regular)
    }
  }


}

