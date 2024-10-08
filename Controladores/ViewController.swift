//
//  ViewController.swift
//  reto-skiliket
//
//  Created by Usuario on 23/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func doLogOut(_ sender: UIButton) {
        let mainVC = self.storyboard?
            .instantiateViewController(withIdentifier: "Profile")
        self.dismiss( animated: true, completion: nil)
    }
    
    @IBAction func doLaunch (_ sender :Any){
        let mainVC = self.storyboard?
            .instantiateViewController(withIdentifier: "Login")
        mainVC?.modalPresentationStyle = .fullScreen
        self.present(mainVC!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

