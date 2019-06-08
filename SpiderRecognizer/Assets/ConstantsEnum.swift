//
//  Constant.swift
//  SpiderRecognizer
//
//  Created by DonghanYang on 29/5/19.
//  Copyright © 2019 DonghanYang. All rights reserved.
//

import Foundation
import UIKit

/**
 An enum stores all static information of this project
 - information of image classifier model and object detector model
 - poisonousness level of spiders
 - color mapping of poisonousness level
 - introduction of 9 kinds of spiders
 */
public enum ConstantsEnum {
    
    /** information of image classifier model */
    static let imageClassifier = NASNetMobile().model
    
    /** information of object detector model */
    static let objectDetector = MobileNetV2_SSDLite().model
    
    /** poisonousness level of spiders */
    static let spiderMapping = ["Daddy Long Legs Spider": "Low Risk",
                                "Funnel-Web Spider": "Deadly & Dangerous",
                                "Garden Orb Weaver Spider": "Low Risk",
                                "Huntsman Spider": "Low Risk",
                                "Redback Spider": "Deadly & Dangerous",
                                "Red-Headed Mouse Spider": "Toxic & Painful Bite",
                                "St Andrews Cross Spider": "Low Risk",
                                "Tarantula Spider": "Toxic & Painful Bite",
                                "White-Tailed Spider": "Deadly & Dangerous"]
    
    /** color mapping of poisonousness level */
    static let colorMapping = ["Low Risk": UIColor.green,
                               "Deadly & Dangerous": UIColor.red,
                               "Toxic & Painful Bite": UIColor.orange]
    
    /** introduction of 9 kinds of spiders */
    static let spiderIntro = [
                              "Tarantula Spider": "Australian Tarantula Spider: it has a large, heavy body, which varies in colour from dark chocolate-brown to pale fawn, often with a silvery sheen. Although large, Australian tarantulas are not usually aggressive, but sometimes they bite human. The bite is painful, as the fangs are large and as long as those of many snakes. Severe illness sometimes results and nausea and vomiting for six to eight hours",
                              "Daddy Long Legs Spider": "Daddy Long Legs Spider: also known as Pholcidae, which is found in every continent in the world. The body (resembling the shape of a peanut) being approximately 2–10 mm (0.08-0.39 inches) in length with legs which may be up to 50 mm (1.97 inches) long.  they almost never bite. But they were able to penetrate human skin, and were reported nothing more than a very mild burning sensation from the venom that lasted just a few seconds.",
                              "Funnel-Web Spider": "Sydney Funnel-Web Spider: is a species of venomous mygalomorph spider native to eastern Australia, usually found within a 100 km (62 mi) radius of Sydney. The bite of a Sydney funnel-web is initially very painful, with clear fang marks separated by several millimetres. In some cases, the spider will remain attached until dislodged by shaking or flicking it off. Physical symptoms can include copious secretion of saliva, muscular twitching and breathing difficulty, disorientation and confusion leading to unconsciousness.",
                              "Garden Orb Weaver Spider": "Australian Garden Orb Weaver Spider: it is a very common species of spider across the coastal regions of the eastern states of Australia. The female is larger than the male, having a body length of 20 – 25 mm compared with 15 – 17 mm for the males. Their bite is not dangerous to humans but may induce mild, local pain, redness, and occasionally swelling for a period of 30 minutes up to three to four hours.",
                              "Huntsman Spider": "Huntsman Spider: is generally widely distributed throughout Australia. There have been reports of members of various genera such as Palystes, Neosparassus (formerly called Olios) and several others, inflicting severe bites. The effects vary, including local swelling and pain, nausea, headache, vomiting, irregular pulse rate, and heart palpitations.",
                              "Red-Headed Mouse Spider": "Red-Headed Mouse Spider: is found across mainland Australia, however mainly west of the Great Dividing Range. Mouse Spider has a smooth, glossy carapace and their head area is high, steep and broad with very large, bulbous jaws.  Their venom may be very toxic, but few cases of serious envenomation has been recorded. Other bites have occurred causing minor effects.",
                              "Redback Spider": "Australian Redback Spider: it is a member of the cosmopolitan genus Latrodectus, the widow spiders. And it is a species of highly venomous spider believed to originate in the South Australian or adjacent Western Australian deserts. Females usually have a body length of about 10 millimetres (0.4 in), while the male is much smaller, being only 3–4 mm (0.12–0.16 in) long.",
                              "St Andrews Cross Spider": "St Andrew’s Cross Spider: is a common species of orb-web spider found on the east coast of Australia, from central New South Wales to northern Queensland. They build medium-sized orb webs, occupied day and night, on low shrubby vegetation. The bite of the St Andrews Cross is of low risk (non-toxic) to humans. They are a non-aggressive group of spiders.",
                              "White-Tailed Spider": "Australian White-tailed Spider : it is native to southern and eastern Australia, and so named because of the whitish tips at the end of their abdomens. Body size is up to 18 mm, with leg-span of 28 mm. They are reported to bite humans; effects include local pain, a red mark, local swelling and itchiness; rarely nausea, vomiting, malaise or headachemay occur"]
}
