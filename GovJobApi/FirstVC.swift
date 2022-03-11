//
//  FirstVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/2/28.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData


struct JobDataAPI {
    
    var source: String
    var title: String
    var type: String
    var date: String
    var link: String
    var relation: String
    var description: String
    var format: String
    var rights: String
    var identifier: String
    
}

class FirstVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var jobDataAPI = [JobDataAPI]()
    
    @IBOutlet weak var navRightBtn: UIButton!
    @IBOutlet weak var navLeftBtn: UIButton!
    @IBOutlet weak var myTV: UITableView!
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let myEntityName = "MyCoreData"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTV.delegate = self
        myTV.dataSource = self
        getJobDataAPI()
    }
    
    @IBAction func navLeftBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func navRightBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "searchSegueLine", sender: sender)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobDataAPI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTVC", for: indexPath) as! FirstTVC
        
        cell.lab2.textColor = UIColor.init(red: 0, green: 0, blue: 255, alpha: 5)
        cell.lab3.textColor = UIColor.systemBlue
        cell.lab4.textColor = UIColor.blue
        cell.lab5.textColor = UIColor.red
        
        cell.lab1.text = jobDataAPI[indexPath.row].source
        cell.lab2.text = jobDataAPI[indexPath.row].title
        cell.lab3.text = jobDataAPI[indexPath.row].type
        cell.lab4.text = jobDataAPI[indexPath.row].relation
        cell.lab5.text = jobDataAPI[indexPath.row].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.frame.height * 0.175
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "全部人員 - 全部地區"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    
    func getJobDataAPI(){
        if let url = URL(string: "https://data.ntpc.gov.tw/api/datasets/A64DDBB2-155B-4DEC-8A5B-E6C547E03987/json?page=0&size=100") {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, errpr) in
                let json = JSON(data!)
                for index in 0..<(json.count) {
                    
                    self.jobDataAPI.append(contentsOf: [JobDataAPI.init(
                        source: json[][index]["source"].stringValue,
                        title: json[][index]["title"].stringValue,
                        type: json[][index]["type"].stringValue,
                        date: json[][index]["date"].stringValue,
                        link: json[][index]["link"].stringValue,
                        relation: json[][index]["relation"].stringValue,
                        description:(json[][index]["description"].stringValue).replacingOccurrences(of: "<br>", with: "\n"),
                        format: json[][index]["format"].stringValue,
                        rights: json[][index]["rights"].stringValue,
                        identifier: json[][index]["identifier"].stringValue
                    )])
                    self.insertObject()
                }
                
                DispatchQueue.main.async {
                    
                    self.myTV.reloadData()
                    
                }
            }).resume()
            
        }
    }
    
    // 新增CoreData資料
    func insertObject() {
        let myData = NSEntityDescription.insertNewObject(forEntityName: myEntityName, into: moc) as! MyCoreData
        
        myData.myCoreData = jobDataAPI.description
        
        do {
            try self.moc.save()
//            print(myData.myCoreData!)
        } catch  {
            print(error)
        }

    }
    
}


class FirstTVC: UITableViewCell {
    
    
    
    
    @IBOutlet weak var lab00: UILabel!
    @IBOutlet weak var lab01: UILabel!
    @IBOutlet weak var lab02: UILabel!
    @IBOutlet weak var lab03: UILabel!
    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var lab2: UILabel!
    @IBOutlet weak var lab3: UILabel!
    @IBOutlet weak var lab4: UILabel!
    @IBOutlet weak var lab5: UILabel!
    

    
}
