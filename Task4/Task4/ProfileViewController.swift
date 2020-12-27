//
//  ProfileViewController.swift
//  Task4
//
//  Created by Alexandr Sopilnyak on 27.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var avatarImage: UIImageView!
  
   var username: String = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()
    avatarImage.maskCircle(anyImage: #imageLiteral(resourceName: "Happy Face"))
    usernameLabel.text = username
        // Do any additional setup after loading the view.
    }
    
  @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
  override func viewWillLayoutSubviews() {
    avatarImage.maskCircle(anyImage: #imageLiteral(resourceName: "Happy Face"))
  }

}

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFit
    self.layer.cornerRadius = self.frame.width / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true

   self.image = anyImage
  }
}
