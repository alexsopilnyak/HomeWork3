//
//  CustomAlert.swift
//  Task4
//
//  Created by Alexandr Sopilnyak on 27.12.2020.
//

import UIKit

class CustomAlertViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var dismiss: UIButton!
  @IBOutlet weak var alertView: UIView!
  
  var titleText = ""
  var messageText = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.adjustsFontSizeToFitWidth = true
    titleLabel.minimumScaleFactor = 0.2
    alertView.layer.cornerRadius = 15
    view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  @IBAction func dismiss(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  
}

  
