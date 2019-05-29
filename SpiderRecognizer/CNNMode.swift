//
//  CNNMode.swift
//  SpiderRecognizer
//
//  Created by Zhenyuan Ye on 28/5/19.
//  Copyright © 2019 DonghanYang. All rights reserved.
//

import UIKit

class CNNMode: UIViewController {
    @IBOutlet weak var scan: UIButton!
    @IBOutlet weak var uploadPhoto: UIButton!
    
    let HeadColor = UIColor(red: 73/255, green: 82/255, blue: 99/255, alpha: 1)
    let bottomColor = UIColor(red: 31/255, green: 40/255, blue: 57/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setGradientBackground(colorOne: HeadColor, colorTwo: bottomColor)
        // set the background gradient color for the landing page
        
        scan.setTitleColor(UIColor.white, for: .normal)
        uploadPhoto.setTitleColor(UIColor.white, for: .normal)
        // set customized feature for the first button
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
