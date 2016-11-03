//
//  ArchivingUnArchivingViewController.swift
//  Persistence
//
//  Created by Ashok on 10/30/16.
//  Copyright © 2016 Ashok. All rights reserved.
//

import UIKit

class ArchivingUnArchivingViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "FirstName LastName Age\n"
        displayInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        let filePath = dataFilePath()
        person = Person(firstName: firstNameTF.text!, lastName: lastNameTF.text!, age: Int(ageTF.text!)!)
        NSKeyedArchiver.archiveRootObject(person!, toFile: filePath)
        firstNameTF.text = ""
        lastNameTF.text = ""
        ageTF.text = ""
        displayInfo()
    }
    
    
    //Display Info
    
    func displayInfo() {
        let filePath = dataFilePath()
        if let person = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Person {
             textView.text = textView.text + person.description
        }
    }
    
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0] as NSString
        return documentDirectory.appendingPathComponent("ArchivingUnArchiving.txt")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
