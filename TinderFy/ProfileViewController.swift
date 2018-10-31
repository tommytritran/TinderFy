//
//  ProfileViewController.swift
//  TinderFy
//
//  Created by Tommy Tran on 26/10/2018.
//  Copyright © 2018 Tommy Tran. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var profileIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onDone(_ sender: Any) {
        performSegue(withIdentifier: "onDone", sender: Any?.self)
    }
    
}
