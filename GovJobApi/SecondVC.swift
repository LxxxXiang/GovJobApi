//
//  SecondVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/2/28.
//

import UIKit

class SecondVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var navRightBtn: UIButton!
    @IBOutlet weak var myTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTV.delegate = self
        myTV.dataSource = self

    }
    

    @IBAction func navRightBtn(_ sender: UIButton) {
        print("Right")
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondTVC", for: indexPath) as! SecondTVC
        return cell
    }
    


}


class SecondTVC: UITableViewCell {
    
    
    
    
    
    
    
    
    
    
    
    
}
