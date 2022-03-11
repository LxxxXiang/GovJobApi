//
//  TestAPI.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/3/2.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol MyData: AnyObject {
    
    func findData(data1: String?)
    

    
}

class TestAPI: UIViewController, UITableViewDataSource, UITableViewDelegate,MyData {
   
    

    
    
    
    
    var myArray = [[Any]]()
    @IBOutlet weak var tV: UITableView!
    var mySelect = [Int]()
    var ThisString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tV.dataSource = self
        tV.delegate = self
        myArray.append(["人員區分", "職稱", "職系","工作地點"])
        myArray.append(["歡迎身心障礙者參加甄選之職務", "歡迎原住民族參加甄選之職務", "原住民族地區之職務","通過「專員級人士人員進階職能培訓專班」人員專區","官等類別"])
        myArray.append(["還原預設"])
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
    
    var tmpMember = "全部人員"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath {
        case [0,indexPath.row]:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tVC", for: indexPath) as! TVC

            cell.textLabel?.text = (myArray[0][indexPath.row] as! String)
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.text = ""
            if indexPath == [0,0] {
                cell.detailTextLabel?.text = tmpMember
                return cell
            }else if indexPath == [0,3] {
                cell.detailTextLabel?.text = "全部地區"
                return cell
            }
            return cell
        case [1,indexPath.row]:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tVC2", for: indexPath) as! TVC2

            if indexPath == [1,4] {
                cell.textLabel?.text = (myArray[1][indexPath.row] as! String)
                cell.accessoryType = .disclosureIndicator
                cell.detailTextLabel?.text = "不拘"
            }else{
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
                switchView.tag = indexPath.row // for detect which row switch Changed
//                cell.isUserInteractionEnabled = false     //讓cell controller無法點選，但上面的物件會一樣無法點選
                //        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
                cell.selectionStyle = .none     //點選時不改變底色，讓使用者看起來是無法點選的
                cell.accessoryView = switchView     //cell 加入switch
                cell.textLabel?.text = (myArray[1][indexPath.row] as! String)
                cell.detailTextLabel?.text = ""
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tVC", for: indexPath) as! TVC

            cell.textLabel?.text = (myArray[2][indexPath.row] as! String)
            cell.detailTextLabel?.text = ""
            return cell
        }
        
        
        
        

        
       
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)       //點選cell後，讓當時選擇的底色消失（預設是提示色灰色）
       
        
        
        switch indexPath {
        case [0,0]:
            mySelect = [0,0]
            self.performSegue(withIdentifier: "1", sender: self)
        case  [0,3]:
            mySelect = [0,3]
            self.performSegue(withIdentifier: "1", sender: self)
        case  [1,4] :
            break
        case [0,1]:
            break
        case [0,2]:
            break
        case [2,0]:
            let ctrl = UIAlertController(title: "成功", message: "已還原預設值", preferredStyle: .alert)
            let ctrlAction = UIAlertAction(title: "確認", style: .default) {  _ in
                
                 }
                 
                 ctrl.addAction(ctrlAction)
                 self.present(ctrl, animated: true, completion: nil)
                print("Ok")
        default:
                print("Other")
        }
    
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! TestT
        controller.myDelegate = self
        
        switch mySelect {
        case [0,0]:
            controller.whichPage = 0
        case [0,3]:
            controller.whichPage = 1
        case [1,4]:
            controller.whichPage = 2
        default:
            return
        }
    
    }
    
    
    func findData(data1: String?) {
        ThisString = data1
        tmpMember = data1 ?? " "
        tV.reloadData()
    }
    
    
}


class TVC: UITableViewCell {
    @IBOutlet weak var lLab: UILabel!
    @IBOutlet weak var rLab: UILabel!
}

class TVC2: UITableViewCell {
    
    
}

// MARK: -------------------------------------------------------------------------------------------------

class TestT: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    var myState = [[String]]()
    var whichPage: Int?
    @IBOutlet weak var tV: UITableView!
    weak var myDelegate: MyData?
    var myString: String?
    var myCell: UITableViewCell?
    var selectNum: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "%%%% Babk", style: .plain, target: self,action: #selector(backViewBtnFnc))
        tV.delegate = self
        tV.dataSource = self
        myState.append(["全部人員","司法人員","外交人員","警察人員","關務人員","交通事業人員","審計人員","主計人員","人事人員","政風人員","教育人員","一般人員","聘用人員","約僱人員","駐外人員","主辦會計人員","主辦統計人員","會計人員（非主辦）","統計人員（非主辦）","兼任教師","代課教師","實習老師","技工","駕駛","駐警衛","工友","清潔隊員","測量助理","其他人員"])
        myState.append(["全部地區","台北市","新北市","桃園市","台中市","台南市","高雄市","基隆市","新竹市","嘉義市","新竹縣","苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","台東縣","澎湖縣","金門縣","福建省連江縣"])
        myState.append(["不拘","委任","薦任","簡任"])
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if whichPage == 0 {
            return myState[0].count
        }else if whichPage == 1 {
            return myState[1].count
        }else if whichPage == 2 {
            return myState[2].count
        }else {
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testTVC", for: indexPath) as! TestTVC
        
        switch whichPage {
        case 0:
            cell.lab.text = "\(myState[0][indexPath.row])"
        case 1:
            cell.lab.text = "\(myState[1][indexPath.row])"
        case 2:
            cell.lab.text = "\(myState[2][indexPath.row])"
        default:
            cell.lab.text = ""
        }
        return cell
        
        
    }
    
    var tmpIndexPath:IndexPath?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tmpIndexPath = indexPath
    
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    
        
        switch whichPage {
        case 0:
            myString = myState[0][indexPath.row]
        case 1:
            myString = myState[1][indexPath.row]
        case 2:
            myString = myState[2][indexPath.row]
        default:
            break
        }
        print(myString ?? "")
        
    }
 
    @objc func backViewBtnFnc(){
        print(tmpIndexPath)
        // textField輸入的資料,儲存到 delegate裡面
        myDelegate?.findData(data1: myString ?? "")
        self.navigationController?.popViewController(animated: true)

    }
    
}


class TestTVC: UITableViewCell {
    
    @IBOutlet weak var lab: UILabel!
    
}


