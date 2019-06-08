//
//  LandingPage.swift
//  SpiderRecognizer
//
//  Created by Zhenyuan Ye on 4/4/19.
//  Copyright © 2019 Zhenyuan Ye. All rights reserved.
//

import UIKit
import SafariServices

/**
 The controller for the landing page
 - contains four buttons
 - redirect users to four different parts
 */
class LandingPage: UIViewController {
    
    // four buttons that redirect users to four different parts
    @IBOutlet weak var basicMode: UIButton!
    @IBOutlet weak var advancedMode: UIButton!
    @IBOutlet weak var spiderGallery: UIButton!
    @IBOutlet weak var spiderMap: UIButton!
    
    // set up the head color and bottom color
    let HeadColor = UIColor(red: 73/255, green: 82/255, blue: 99/255, alpha: 1)
    let bottomColor = UIColor(red: 31/255, green: 40/255, blue: 57/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the background gradient color for the landing page
        self.view.setGradientBackground(colorOne: HeadColor, colorTwo: bottomColor)
        
        // set customized feature for four buttons
        basicMode.setTitleColor(UIColor.white, for: .normal)
        advancedMode.setTitleColor(UIColor.white, for: .normal)
        spiderGallery.setTitleColor(UIColor.white, for: .normal)
        spiderMap.setTitleColor(UIColor.white, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     Redirect users to the web page of Spider Map
     - parameter sender: the SpiderMap button
     */
    @IBAction func jumpToMap(_ sender: Any) {
        showSpiderMap(for: "https://zhenyy.github.io/SpiderMap/#/")
    }
    
    /**
     Accept an url and open safari with that url
     - parameter url: the url that redirect to
     */
    func showSpiderMap(for url: String){
        guard let url = URL(string: url)else{
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
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
