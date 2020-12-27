//
//  ViewController.swift
//  Task4
//
//  Created by Alexandr Sopilnyak on 27.12.2020.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var buttonOutlet: UIButton!
  @IBOutlet weak var usernameTextField: UITextField!
  var username: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }

  
  
 
  
  @IBAction func detailsButtonPressed(_ sender: UIButton) {
    guard let username = usernameTextField.text else {return}
    if username.isEmpty {
      usernameTextField.text = ""

}
    else {
      self.username = username
      performSegue(withIdentifier: K.segueID.rawValue, sender: self)
    }
    
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == K.segueID.rawValue else { return }
    guard let destinationVC = segue.destination as? ProfileViewController else {return}

    destinationVC.username = self.username
  
}

}






@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
