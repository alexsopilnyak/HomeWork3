//
//  ViewController.swift
//  Task3
//
//  Created by Alexandr Sopilnyak on 26.12.2020.
//

import UIKit

class ViewController: UIViewController {
  
  let circleView = UIView()
  let colors: [UIColor] = [.yellow, .orange, .red, .blue, .green, .purple]

  override func viewDidLoad() {
    super.viewDidLoad()
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
    let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
    let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
    
    tap.numberOfTapsRequired = 1
    doubleTap.numberOfTapsRequired = 2
    tap.require(toFail: doubleTap)
    
    swipeRight.direction = .right
    swipeLeft.direction = .left
    swipeDown.direction = .down
    swipeUp.direction = .up

    view.addGestureRecognizer(swipeRight)
    view.addGestureRecognizer(swipeLeft)
    view.addGestureRecognizer(swipeDown)
    view.addGestureRecognizer(swipeUp)
    view.addGestureRecognizer(tap)
    view.addGestureRecognizer(doubleTap)
    
    drawCircle()
  }
  
  func drawCircle() {
    circleView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    circleView.backgroundColor = .red
    circleView.layer.cornerRadius = circleView.frame.height / 2
    circleView.clipsToBounds = true
    circleView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(circleView)
    
    NSLayoutConstraint.activate([
      circleView.widthAnchor.constraint(equalToConstant: circleView.frame.width),
      circleView.heightAnchor.constraint(equalToConstant: circleView.frame.height),
      circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
      }

  
  @objc func doubleTapGesture(_ sender: UITapGestureRecognizer) {
    
    UIView.animate(withDuration: 1.5) { [weak self] in
      guard let circleView = self?.circleView, let view = self?.view else {return}
      circleView.center = view.center
    } completion: { (Bool) in
      let circlePath = UIBezierPath(arcCenter: self.view.center, radius: 80, startAngle: CGFloat(0), endAngle: CGFloat(2 * Double.pi), clockwise: true)
      
      let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
      animation.duration = 3.0
      animation.repeatCount = 1
      animation.path = circlePath.cgPath
      self.circleView.layer.add(animation, forKey: nil)
      
    }
  }
  
  @objc func tapGesture(_ sender: UITapGestureRecognizer) {
    UIView.animate(withDuration: 1.5) { [weak self] in
      guard let circleView = self?.circleView, let view = self?.view else {return}
      circleView.center = view.center
    }
  }

  @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
    switch sender.direction {
    case .right:
      UIView.animate(withDuration: 1.5) { [weak self] in
        guard let circleView = self?.circleView else {return}
        circleView.frame = circleView.frame.offsetBy(dx: 30, dy: 0)
        circleView.backgroundColor = self?.colors.randomElement()
      }
      
    case .left:
      UIView.animate(withDuration: 1.5) { [weak self] in
        guard let circleView = self?.circleView else {return}
        circleView.frame = circleView.frame.offsetBy(dx: -30, dy: 0)
        circleView.backgroundColor = self?.colors.randomElement()
      }
    case .down:
      UIView.animate(withDuration: 1.5) { [weak self] in
        guard let circleView = self?.circleView else {return}
        circleView.frame = circleView.frame.offsetBy(dx: 0, dy: 30)
        circleView.backgroundColor = self?.colors.randomElement()
      }
    case .up:
      UIView.animate(withDuration: 1.5) { [weak self] in
        guard let circleView = self?.circleView else {return}
        circleView.frame = circleView.frame.offsetBy(dx: 0, dy: -30)
        circleView.backgroundColor = self?.colors.randomElement()
      }
    default:
      return
    }
  }
  
}

