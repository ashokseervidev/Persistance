//
//  PersistanceViewController.swift
//  Persistence
//
//  Created by Ashok on 10/29/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class PersistanceViewControllerA: UIViewController {
 
    @IBOutlet weak var nationTextField: UITextField!
    @IBOutlet weak var capitalTextField: UITextField!
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayNationAndCapitalCityNames()
    }
    
    //Get Path
    func getPath() -> String {
        let plistFileName = "dataA.plist"
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentPath = paths[0] as NSString
        let plistPath = documentPath.appendingPathComponent(plistFileName)
        return plistPath
    }
    
    //Display Nation and Capital
    func displayNationAndCapitalCityNames() {
        let plistPath = self.getPath()
        self.textView.text = ""
        if FileManager.default.fileExists(atPath: plistPath) {
            if let nationAndCapitalCitys = NSMutableDictionary(contentsOfFile: plistPath) {
                for (_, element) in nationAndCapitalCitys.enumerated() {
                    self.textView.text = self.textView.text + "\(element.key) --> \(element.value) \n"
                }
            }
        }
    }
    
    //On Click OF Submit
    @IBAction func onSubmit(_ sender: UIButton) {
        let plistPath = self.getPath()
        if FileManager.default.fileExists(atPath: plistPath) {
            let nationAndCapitalCitys = NSMutableDictionary(contentsOfFile: plistPath)!
            nationAndCapitalCitys.setValue(capitalTextField.text!, forKey: nationTextField.text!)
            nationAndCapitalCitys.write(toFile: plistPath, atomically: true)
        }
        nationTextField.text = ""
        capitalTextField.text = ""
        displayNationAndCapitalCityNames()
    }
}
