//
//  UploadPhoto.swift
//  SpiderRecognizer
//
//  Created by Zhenyuan Ye on 16/4/19.
//  Copyright © 2019 DonghanYang. All rights reserved.
//

import UIKit
import CoreML
import AVFoundation
import Vision
import CoreLocation
import Firebase
import FirebaseDatabase


class CNNUploadPhoto: UIViewController, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    var refSpider: DatabaseReference!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classifier: UILabel!
    var lat:String?
    var lng:String?
    var spiderName:String!
    var alert: UIAlertController!
    
    var model: VNCoreMLModel!
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        refSpider = Database.database().reference().child("SpiderWithLocation");
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        model = try? VNCoreMLModel(for: ConstantsEnum.imageClassifier)
    }
    
    @IBAction func camera(_ sender: Any) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        cameraPicker.allowsEditing = false
        
        present(cameraPicker, animated: true)
    }
    
    @IBAction func openLibrary(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        lat = locValue.latitude.description
        lng = locValue.longitude.description
    }

}

extension CNNUploadPhoto: UIImagePickerControllerDelegate {
    func prediciton(_ image: CVPixelBuffer) {
        // load our CoreML model
        
        // run an inference with CoreML
        let request = VNCoreMLRequest(model: model) { (finishedRequest, error) in
            
            // grab the inference results
            guard let results = finishedRequest.results as? [VNClassificationObservation] else { return }
            
            // grab the highest confidence result
            guard let Observation = results.first else { return }
            
            // create the label text components
            let predclass = "\(Observation.identifier)"
            self.spiderName = predclass
            let predconfidence = String(format: "%.02f", Observation.confidence * 100)
            let toxicity = ConstantsEnum.spiderMapping[predclass]!
            
            // set the label text
            DispatchQueue.main.async(execute: {
                self.classifier.textColor = ConstantsEnum.colorMapping[toxicity]!
                self.classifier.text = "\(predclass) \(predconfidence)%\n" +
                                       "Hazard Level: \(toxicity)"
            })
        }
        
        // create a Core Video pixel buffer which is an image buffer that holds pixels in main memory
        // Applications generating frames, compressing or decompressing video, or using Core Image
        // can all make use of Core Video pixel buffers
        // guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // execute the request
        try? VNImageRequestHandler(cvPixelBuffer: image, options: [:]).perform([request])
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true)
        classifier.text = "Analyzing Image..."
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 299, height: 299), true, 2.0)
        image.draw(in: CGRect(x: 0, y: 0, width: 299, height: 299))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) //3
        
        context?.translateBy(x: 0, y: newImage.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        UIGraphicsPushContext(context!)
        newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        imageView.image = newImage
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        // Core ML
        prediciton(pixelBuffer!)
        
        // add a button allowing users to send the information of the spider to database
        let newButton:UIButton = UIButton(type: .system)
        newButton.frame = CGRect(x: 125, y: 590, width: 164, height: 30)
        newButton.setTitle("Add Spider to Map", for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.backgroundColor = UIColor.darkGray
        newButton.layer.cornerRadius = newButton.frame.height/2
        newButton.addTarget(self, action: #selector(sendSpiderLocation), for: .touchUpInside)
        self.view.addSubview(newButton)
        
        alert = UIAlertController(title: "Add Spider to Map", message: "You have successfully added the spider to Spider Map", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            print("clicked OK")
        }
        alert.addAction(okAction)
    }
    
    @objc func sendSpiderLocation() {
        let key = refSpider.childByAutoId().key
        let Spider = [ "id":key,
                       "SpiderName":spiderName!,
                       "SpiderLat":lat,
                       "SpiderLng":lng]
        refSpider.child(key!).setValue(Spider)
        self.present(alert, animated: true, completion: nil)
    }
    
}
