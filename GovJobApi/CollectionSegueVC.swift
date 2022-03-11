//
//  CollectionSegueVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/3/1.
//

import UIKit

class CollectionSegueVC: UIViewController {

    @IBOutlet weak var hideNav: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        hideNav.hidesBackButton = true  //因為設定，要將此 navigation button 隱藏
        
    }
    

   
}
