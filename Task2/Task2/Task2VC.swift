//
//  ViewController.swift
//  Task2
//
//  Created by Alexandr Sopilnyak on 24.12.2020.
//

import UIKit

class Task2VC: UIViewController {
  
  @IBOutlet weak var blackView: UIView!
  @IBOutlet weak var whiteView: UIView!
  @IBOutlet weak var roundedView: UIView!
  @IBOutlet weak var tealView: UIView!
  
  var circleView = UIView()
  
  
  var removeAnimation = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpViews()
    setUpCircles()
    rotateCircles()

  }
  
  func setUpCircles() {
    let firstCircle = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    let offsetY = firstCircle.frame.height / 2
    let secondCircle = UIView(frame: CGRect(x: 0, y: offsetY, width: 150, height: 150))
    let circleViewWidth = firstCircle.frame.width
    let circleViewHeight = firstCircle.frame.height + (secondCircle.frame.height / 2)
    
    circleView.frame = CGRect(x: 130, y: 620, width: circleViewWidth, height: circleViewHeight)
    
    firstCircle.layer.cornerRadius = firstCircle.frame.height / 2
    secondCircle.layer.cornerRadius = firstCircle.frame.height / 2
    
    firstCircle.backgroundColor = .yellow
    secondCircle.backgroundColor = .green

    
    
    circleView.addSubview(secondCircle)
    circleView.addSubview(firstCircle)

    view.addSubview(circleView)
  }
  
  func setUpViews() {
    roundedView.layer.cornerRadius = roundedView.frame.height / 2
    whiteView.backgroundColor = .white
  }
  
  @IBAction func tapToBlackView(_ sender: UITapGestureRecognizer) {
    animateFirstBlackView()
    removeAnimation = !removeAnimation
  }
  
  @IBAction func tapToRoundedView(_ sender: UITapGestureRecognizer) {
    changeColorAnimation()
    removeAnimation = !removeAnimation
  }
  
  @IBAction func tapToTealView(_ sender: UITapGestureRecognizer) {
    transformViewToCircle()
    removeAnimation = !removeAnimation
  }
  
  
  func rotateCircles() {
    
    UIView.animate(withDuration: 1.5, delay: 0.5, options: [.curveLinear, .repeat, .autoreverse]) { [weak self] in
      
      self?.circleView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
      
    }
  }
  
  func transformViewToCircle() {
    UIView.animateKeyframes(withDuration: 4, delay: 0, options: []) { [weak self] in
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
        guard let height = self?.tealView.frame.height else {return}
        self?.tealView.layer.cornerRadius = height / 2
      }
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
        self?.tealView.layer.cornerRadius = 0
      }
    }
    
  }
  
  func animateFirstBlackView() {
    UIView.animate(withDuration: 1){ [weak self] in
      guard let removeAnimation = self?.removeAnimation else {return}
      switch removeAnimation {
      case true: self?.blackView.transform = CGAffineTransform.identity
      case false:
        self?.blackView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
      }
    }
  }
  
  func changeColorAnimation() {
    
    UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.overrideInheritedDuration]) { [weak self] in
      UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0) {
        self?.whiteView.backgroundColor = .black
        self?.roundedView.backgroundColor = .white
      }
      UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0) {
        self?.whiteView.backgroundColor = .red
        self?.roundedView.backgroundColor = .blue
      }
      UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0) {
        self?.whiteView.backgroundColor = .green
        self?.roundedView.backgroundColor = .orange
      }
      UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0) {
        self?.whiteView.backgroundColor = .brown
        self?.roundedView.backgroundColor = .systemPink
      }
    }
    completion: { [weak self] (isCompleted) in
      self?.whiteView.backgroundColor = .white
      self?.roundedView.backgroundColor = .black
    }
  }
}
