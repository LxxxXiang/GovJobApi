//
//  Test.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/3/3.
//

import UIKit

class Test: UIViewController{
    
    var switchState = true
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switch5: UISwitch!
    @IBOutlet weak var switch6: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func btn(_ sender: UIButton) {
        switchState = !switchState
        if switchState == true {
            switch1.setOn(true, animated: true)
            switch2.setOn(true, animated: true)
            switch3.setOn(true, animated: true)
            switch4.setOn(true, animated: true)
            switch5.setOn(true, animated: true)
            switch6.setOn(true, animated: true)
        }else{
            switch1.setOn(false, animated: true)
            switch2.setOn(false, animated: true)
            switch3.setOn(false, animated: true)
            switch4.setOn(false, animated: true)
            switch5.setOn(false, animated: true)
            switch6.setOn(false, animated: true)
        }
    }
    
    
    
    @IBAction func switch1(_ sender: UISwitch) {
        
    }
    
    @IBAction func switch2(_ sender: UISwitch) {
        
    }
    
    @IBAction func switch3(_ sender: UISwitch) {
        
    }
    
    @IBAction func switch4(_ sender: UISwitch) {
        
    }
    
    @IBAction func switch5(_ sender: UISwitch) {
        
    }
    
    @IBAction func switch6(_ sender: UISwitch) {
        
    }
    
}
