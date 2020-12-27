//
//  ViewController.swift
//  Task1
//
//  Created by Alexandr Sopilnyak on 23.12.2020.
//

import UIKit

class ViewController: UIViewController {  //landscape - portrait
  
  @IBOutlet weak var SAbottomToYellBottom: NSLayoutConstraint! // + +
  @IBOutlet weak var SABottomToPurpleBottom: NSLayoutConstraint! //+ +
  @IBOutlet weak var RedTopToSATop: NSLayoutConstraint! // + +
  @IBOutlet weak var RedLeadToSALead: NSLayoutConstraint! //+ +
  @IBOutlet weak var TrailingToGreenTrail: NSLayoutConstraint! //+ +
  @IBOutlet weak var GreenTopToSATop: NSLayoutConstraint! // + +
  @IBOutlet weak var PurpleWidthToYellWidth: NSLayoutConstraint! //+ +
  @IBOutlet weak var PurpleLeadToYellTrail: NSLayoutConstraint! //+ +
  @IBOutlet weak var RedHeightToYellHeight: NSLayoutConstraint!
  
  
  
  
  @IBOutlet weak var YellLeadToSALead: NSLayoutConstraint!
  @IBOutlet weak var YellTopRedBottom: NSLayoutConstraint!
  @IBOutlet weak var GreenLeadingToRedTrail: NSLayoutConstraint!
  @IBOutlet weak var TrailToPurpleTrail: NSLayoutConstraint!
  @IBOutlet weak var PurpleTopToGreenBottom: NSLayoutConstraint!
  @IBOutlet weak var GreenHeightPurpleHeight: NSLayoutConstraint!
  
  @IBOutlet weak var PurpleTopToSATop: NSLayoutConstraint!
  @IBOutlet weak var GreenLeadToPurpleTrail: NSLayoutConstraint!
  @IBOutlet weak var YellTopToSATop: NSLayoutConstraint!
  @IBOutlet weak var YellWidthToRedWidth: NSLayoutConstraint!
  @IBOutlet weak var YellLeadToRedTrail: NSLayoutConstraint!
  @IBOutlet weak var SAbottomToRedBottom: NSLayoutConstraint!
  @IBOutlet weak var SABottomTOGreenBottom: NSLayoutConstraint!
  @IBOutlet weak var GreenWidthToPurpleWidth: NSLayoutConstraint!
  
  var statusBarOrientation: UIInterfaceOrientation? {
    get {
      guard let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation else {
        #if DEBUG
        fatalError("Could not obtain UIInterfaceOrientation from a valid windowScene")
        #else
        return nil
        #endif
      }
      return orientation
    }
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    if statusBarOrientation == .portrait || statusBarOrientation == .portraitUpsideDown {
      applyPortraitConstraints()
    } else {
      applyLandscapeConstarints()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //view.translatesAutoresizingMaskIntoConstraints = false
    // Do any additional setup after loading the view.
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    coordinator.animate { (UIViewControllerTransitionCoordinatorContext) in
      switch self.statusBarOrientation {
      case .portrait:
        print("Portrait")
        self.applyPortraitConstraints()
        break
      case .portraitUpsideDown:
        self.applyPortraitConstraints()
        print("portrait uspside down")
      default:
        self.applyLandscapeConstarints()
        print("landscape")
      }
    } completion: { (UIViewControllerTransitionCoordinatorContext) in
      print("rotation completed")
    }
    
    super.viewWillTransition(to: size, with: coordinator)
  }
  
  
  func applyLandscapeConstarints() {
    
    if UIDevice.current.userInterfaceIdiom == .pad {
      self.view.removeConstraint(self.YellLeadToSALead)
      self.view.removeConstraint(self.YellTopRedBottom)
      //self.view.removeConstraint(self.GreenHeightPurpleHeight)
      self.view.removeConstraint(self.GreenLeadingToRedTrail)
      self.view.removeConstraint(self.TrailToPurpleTrail)
      self.view.removeConstraint(self.PurpleTopToGreenBottom)
      
      self.view.addConstraint(self.PurpleTopToSATop)
      self.view.addConstraint(self.GreenWidthToPurpleWidth)
      self.view.addConstraint(self.GreenLeadToPurpleTrail)
      self.view.addConstraint(self.YellTopToSATop)
      self.view.addConstraint(self.YellWidthToRedWidth)
      self.view.addConstraint(self.YellLeadToRedTrail)
      self.view.addConstraint(self.SAbottomToRedBottom)
      self.view.addConstraint(self.SABottomTOGreenBottom)
    }
    
    
  }
  
  func applyPortraitConstraints() {
    
    if UIDevice.current.userInterfaceIdiom == .pad {
      self.view.addConstraint(self.YellLeadToSALead)
      self.view.addConstraint(self.YellTopRedBottom)
      self.view.addConstraint(self.GreenHeightPurpleHeight)
      self.view.addConstraint(self.GreenLeadingToRedTrail)
      self.view.addConstraint(self.TrailToPurpleTrail)
      self.view.addConstraint(self.PurpleTopToGreenBottom)
      
      self.view.removeConstraint(self.PurpleTopToSATop)
      //self.view.removeConstraint(self.GreenWidthToPurpleWidth)
      self.view.removeConstraint(self.GreenLeadToPurpleTrail)
      self.view.removeConstraint(self.YellTopToSATop)
      self.view.removeConstraint(self.YellWidthToRedWidth)
      self.view.removeConstraint(self.YellLeadToRedTrail)
      self.view.removeConstraint(self.SAbottomToRedBottom)
      self.view.removeConstraint(self.SABottomTOGreenBottom)
    }
  }
  
}

