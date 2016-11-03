//
//  PersistanceViewController.swift
//  Persistence
//
//  Created by Ashok on 10/29/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class PersistanceViewControllerB: UIViewController {
    
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCityNames()
    }
    
    func getPath() -> String {
        let plistFileName = "dataB.plist"
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentPath = paths[0] as NSString
        let plistPath = documentPath.appendingPathComponent(plistFileName)
        return plistPath
    }
    
    func displayCityNames() {
        let plistPath = self.getPath()
        self.cityTextView.text = ""
        if FileManager.default.fileExists(atPath: plistPath) {
            var cityArray = NSArray(contentsOfFile: plistPath) as! [String]
            for i in 0..<cityArray.count {
                self.cityTextView.text = self.cityTextView.text + "\(cityArray[i]), "
            }
        }
    }
    
    
    @IBAction func onSubmit(_ sender: UIButton) {
        let plistPath = self.getPath()
        if FileManager.default.fileExists(atPath: plistPath) {
            var cityArray = NSArray(contentsOfFile: plistPath) as! [String]
            cityArray.append(cityTextField.text!)
            (cityArray as NSArray).write(toFile: plistPath, atomically: true)
        }
        cityTextField.text = ""
        displayCityNames()
    }
}
