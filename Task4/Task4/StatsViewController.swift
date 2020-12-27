//
//  GamesViewController.swift
//  Task4
//
//  Created by Alexandr Sopilnyak on 27.12.2020.
//

import UIKit

class StatsViewController: UIViewController {
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.layer.cornerRadius = 15
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction func statsButtonPressed(_ sender: UIButton) {
    let alertController = self.storyboard?.instantiateViewController(withIdentifier: K.alertID.rawValue) as! CustomAlertViewController
    alertController.providesPresentationContextTransitionStyle = true
    alertController.definesPresentationContext = true
    alertController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
    alertController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
    self.present(alertController, animated: true, completion: nil)
  }
}
