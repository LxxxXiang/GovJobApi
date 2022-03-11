//
//  ThirdVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/2/28.
//

import UIKit

class ThirdVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTV.delegate = self
        myTV.dataSource = self
        
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdTVC", for: indexPath) as! ThirdTVC
        return cell
    }
    
    

}


class ThirdTVC: UITableViewCell {
    
    
    
    
    
}
