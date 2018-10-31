//
//  CardsViewController.swift
//  TinderFy
//
//  Created by Tommy Tran on 23/10/2018.
//  Copyright © 2018 Tommy Tran. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    
    @IBOutlet weak var imageCard: UIImageView!
    
    var cardInitialCenter:CGPoint!
    var divisor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width / 2)/0.61
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let xFromCenter = imageCard.center.x - view.center.x
        
        imageCard.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        if sender.state == .began {
            cardInitialCenter = imageCard.center
            print("Gesture began")
        } else if sender.state == .changed {
            imageCard.center = CGPoint(x: cardInitialCenter.x+translation.x, y: cardInitialCenter.y+translation.y)
        } else if sender.state == .ended {
            if (imageCard.center.x < 50){
                UIView.animate(withDuration: 0.3, animations: {
                    self.imageCard.alpha = 0
                    self.imageCard.center = CGPoint(x: self.imageCard.center.x - 150, y: self.imageCard.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
            }else if (imageCard.center.x > (view.frame.width - 50)) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.imageCard.alpha = 0
                    self.imageCard.center = CGPoint(x: self.imageCard.center.x + 150, y: self.imageCard.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
                //resetCard()
            }
            resetCard()
        }
            print("Gesture ended")
        }

    
    func resetCard() {
        self.imageCard.transform = CGAffineTransform.identity
        self.imageCard.center = self.view.center
        self.imageCard.alpha = 1
    }

    @IBAction func onImageViewTap(_ sender: Any) {
        performSegue(withIdentifier: "profileViewSegue", sender: Any?.self)
    }
}
