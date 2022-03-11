//
//  SearchDetailTextFieldVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/3/4.
//

import UIKit

class SearchDetailTextFieldVC: UIViewController {

    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func leftBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rightBtn(_ sender: UIButton) {
        
    }
    
}
