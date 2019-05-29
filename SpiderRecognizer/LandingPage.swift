//
//  LandingPage.swift
//  SpiderRecognizer
//
//  Created by Zhenyuan Ye on 4/4/19.
//  Copyright © 2019 Zhenyuan Ye. All rights reserved.
//

import UIKit
import SafariServices

class LandingPage: UIViewController {
    @IBOutlet weak var basicMode: UIButton!
    @IBOutlet weak var advancedMode: UIButton!
    @IBOutlet weak var spiderGallery: UIButton!
    @IBOutlet weak var spiderMap: UIButton!
    
    
    let HeadColor = UIColor(red: 73/255, green: 82/255, blue: 99/255, alpha: 1)
    let bottomColor = UIColor(red: 31/255, green: 40/255, blue: 57/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setGradientBackground(colorOne: HeadColor, colorTwo: bottomColor)
        // set the background gradient color for the landing page
        
        basicMode.setTitleColor(UIColor.white, for: .normal)
        advancedMode.setTitleColor(UIColor.white, for: .normal)
        spiderGallery.setTitleColor(UIColor.white, for: .normal)
        spiderMap.setTitleColor(UIColor.white, for: .normal)
        // set customized feature for the first button
        
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func jumpToMap(_ sender: Any) {
        showSpiderMap(for: "https://zhenyy.github.io/SpiderMap/#/")
    }
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
