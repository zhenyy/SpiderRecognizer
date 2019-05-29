//
//  SpiderGallery.swift
//  SpiderRecognizer
//
//  Created by Zhenyuan Ye on 10/5/19.
//  Copyright © 2019 Zhenyuan Ye. All rights reserved.
//

import UIKit


extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        // Swift 4.1 and below
        // self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
    }
}

class SpiderGallery: UIViewController {
    
    @IBOutlet weak var introduction: UILabel!
    
    var vImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func spiderSelected(_ sender: UIButton) {
        let image = UIImage(named: sender.currentTitle!)
        vImg = UIImageView(image: image);   //初始化图片View
        //            vImg.frame.origin = CGPoint(x:0,y:20);   //指定图片显示的位置
        vImg.frame = CGRect(x: 0, y: 63, width: 414, height: 414);   //指定图片的位置以及显示的大小
        self.view.addSubview(vImg);   //显示在View上
        vImg.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(SpiderGallery.closeIntro))
        vImg.addGestureRecognizer(gesture)
        let toxicity = ConstantsEnum.spiderMapping[sender.currentTitle!]!
        introduction.text = ConstantsEnum.spiderMapping[sender.currentTitle!]! + "\n" +
                            ConstantsEnum.spiderIntro[sender.currentTitle!]!
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: introduction.text!)
        attributedString.setColorForText(textForAttribute: toxicity, withColor: ConstantsEnum.colorMapping[toxicity]!)
        introduction.attributedText = attributedString
        self.view.addSubview(introduction)
    }
    
    
    @objc func closeIntro(){
        vImg.removeFromSuperview()
        introduction.text = "Click on the image to view introduction"
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
