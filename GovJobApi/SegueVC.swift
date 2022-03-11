//
//  SegueVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/2/28.
//

import UIKit
import CoreData

class SegueVC: UIViewController, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var jobDataAPI = [String]()

    @IBOutlet weak var hideNav: UINavigationItem!
    @IBOutlet weak var myTV: UITableView!
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let myEntityName = "MyCoreData"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNav.hidesBackButton = true  //因為設定，要將此 navigation button 隱藏
        self.navigationController!.interactivePopGestureRecognizer!.delegate = self
        myTV.delegate = self
        myTV.dataSource = self
        readingObject()
    }
    
    @IBAction func leftBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // 左滑上一頁手勢 (記得delegate 和 指派(在viewDidLoad內))
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
           return true
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "segueTVC", for: indexPath) as! SegueTVC
        cell.lab.text = "\(jobDataAPI)"
        
        return cell
    }
    
    
    // 抓取CoreData資料
    func readingObject() {
        let request = NSFetchRequest<MyCoreData>(entityName: myEntityName)
        do {
            let results = try self.moc.fetch(request)
            if results.count > 0 {
                for result in results {
                    jobDataAPI.append(result.description)
                    
                }
                print("CoreData Not nil")
            }else{
                print("CoreData is nil")
            }
            
        } catch  {
            fatalError("\(error)")
        }

    }
    
    
    
    
}


class SegueTVC: UITableViewCell {
    
    @IBOutlet weak var lab: UILabel!
    
}
