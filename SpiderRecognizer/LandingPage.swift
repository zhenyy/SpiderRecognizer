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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicMode.backgroundColor = UIColor.darkGray
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
