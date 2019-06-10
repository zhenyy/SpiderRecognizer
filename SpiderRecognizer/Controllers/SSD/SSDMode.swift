//
//  SSDMode.swift
//  SpiderRecognizer
//
//  Created by Zhenyuan Ye on 28/5/19.
//  Copyright © 2019 Zhenyuan Ye. All rights reserved.
//

import UIKit

/**
 The controller for the advanced mode page
 - contains two buttons
 - redirect users to scan/upload photo part
 */
class SSDMode: UIViewController {
    @IBOutlet weak var scan: UIButton!
    @IBOutlet weak var uploadPhoto: UIButton!
    
    /**
     back to the previous controller
     - parameter sender: button going back to the prevous page
     */
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // set up the head color and bottom color
    let HeadColor = UIColor(red: 73/255, green: 82/255, blue: 99/255, alpha: 1)
    let bottomColor = UIColor(red: 31/255, green: 40/255, blue: 57/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the background gradient color for the landing page
        self.view.setGradientBackground(colorOne: HeadColor, colorTwo: bottomColor)
        
        // set customized feature for buttons
        scan.setTitleColor(UIColor.white, for: .normal)
        uploadPhoto.setTitleColor(UIColor.white, for: .normal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
