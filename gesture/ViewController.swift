//
//  ViewController.swift
//  gesture
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var file: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture()
        addTapGesture()
        // Do any additional setup after loading the view.
    }
    
    func addPanGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        file.addGestureRecognizer(pan)
    }

    @objc func handlePan(sender: UIPanGestureRecognizer) {
        // Raywenderlich.com
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)

        
        }
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        self.view.addGestureRecognizer(tap)
    }
    
     @objc func handleTap(recognizer: UITapGestureRecognizer) {
        
        recognizer.numberOfTouchesRequired = 2
        if recognizer.state == .ended{
        
            self.view.backgroundColor = UIColor.black
            
            
        }
        
//        if recognizer.state == .ended {      // Move the view down and to the right when tapped.
//            let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
//                recognizer.view!.center.x += 100
//                recognizer.view!.center.y += 100
//            })
//            animator.startAnimation()
//        }
    }
    
    
    
    
    
    // B a c k g r o u n d    c o l o r
 
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}


