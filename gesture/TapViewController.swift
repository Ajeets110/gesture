//
//  TapViewController.swift
//  gesture
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

    
    @IBOutlet weak var file: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        // Do any additional setup after loading the view.
    }
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        file.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        
        recognizer.numberOfTouchesRequired = 2
        if recognizer.state == .ended{
            
            let alert = UIAlertController(title: "Unable to open", message: "You don't have access to open the foler ", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        //        if recognizer.state == .ended {      // Move the view down and to the right when tapped.
        //            let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
        //                recognizer.view!.center.x += 100
        //                recognizer.view!.center.y += 100
        //            })
        //            animator.startAnimation()
        //        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    // B a c k g r o u n d    c o l o r
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 155.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 155.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
