//
//  ViewController.swift
//  Persistence
//
//  Created by Ashok on 10/29/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lineFields: [UITextField]!
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0] as NSString
        return documentDirectory.appendingPathComponent("data.plist")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = self.dataFilePath()
        if FileManager.default.fileExists(atPath: filePath)  {
            let array = NSArray(contentsOfFile: filePath) as! [String]
            for i in 0 ..< array.count {
                lineFields[i].text = array[i]
            }
        }
        
        
        let app = UIApplication.shared
        //Register for the applicationWillResignActive anywhere in your app.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.applicationWillResignActive(notification:)), name: NSNotification.Name.UIApplicationWillResignActive, object: app)
    }
    
    func applicationWillResignActive(notification: NSNotification) {
        let filePath = self.dataFilePath()
        let array = (self.lineFields as NSArray).value(forKey: "text") as! NSArray
        array.write(toFile: filePath, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

