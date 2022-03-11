//
//  SearchSugueVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/3/1.
//

import UIKit

class SearchSugueVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var hideNav: UINavigationItem!
    @IBOutlet weak var navRightBtn: UIButton!
    @IBOutlet weak var navLeftBtn: UIButton!
    
    @IBOutlet weak var myTV: UITableView!
    var myArray = [[Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTV.delegate = self
        myTV.dataSource = self
        hideNav.hidesBackButton = true  //因為設定，要將此 navigation button 隱藏
        myArray.append(["人員區分", "職稱", "職系","工作地點"])
        myArray.append(["歡迎身心障礙者參加甄選之職務", "歡迎原住民族參加甄選之職務", "原住民族地區之職務","通過「專員級人士人員進階職能培訓專班」人員專區","官等類別"])
        myArray.append(["還原預設"])
    }
    
    @IBAction func navRightBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func navLeftBtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (myArray[0] as AnyObject).count
        }else if section == 1 {
            return (myArray[1] as AnyObject).count
        }else if section == 2 {
            return (myArray[2] as AnyObject).count
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "一般選項"
        }else if section == 1 {
            return "進階選項"
        }else if section == 2 {
            return "預設"
        }else {
            return "\(section)"
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath == [0,indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchTVC0", for: indexPath) as! SearchTVC0
            cell.lab.text = (myArray[0][indexPath.row] as! String)
            return cell
        }else if indexPath == [1,indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchTVC1", for: indexPath) as! SearchTVC1
            cell.lab.text = (myArray[1][indexPath.row] as! String)
            return cell
        }else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchTVC2", for: indexPath) as! SearchTVC2
            cell.lab.text = (myArray[2][indexPath.row] as! String)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        if indexPath == [0,0] {
            self.performSegue(withIdentifier: "searchTableViewLine", sender: self)
        }else if indexPath == [0,3]{
            self.performSegue(withIdentifier: "searchTableViewLine", sender: self)
        }else {
            self.performSegue(withIdentifier: "searchTextFieldLine", sender: self)
        }
        
    }
    
}


class SearchTVC0: UITableViewCell {
    
    @IBOutlet weak var lab: UILabel!
    
    
}


class SearchTVC1: UITableViewCell {
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var lab: UILabel!
    
    override class func awakeFromNib() {
        
    }
    
}

class SearchTVC2: UITableViewCell {
    
    
    @IBOutlet weak var lab: UILabel!
    
}
