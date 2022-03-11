//
//  SearchDetailVC.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/3/4.
//

import UIKit



class SearchDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var myTV: UITableView!
    var myArray = [[Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTV.delegate = self
        myTV.dataSource = self
        myArray.append(["全部人員","司法人員","外交人員","警察人員","關務人員","交通事業人員","審計人員","主計人員","人事人員","政風人員","教育人員","一般人員","聘用人員","人員約僱","駐外人員","主辦會計人員","主辦統計人員","會計人員（非主辦）","統計人員（非主辦）","兼任教師","代課教師","實習教師","技工","駕駛","駐警衛","工友","清潔隊員","測量助理","其他人員"])
        myArray.append(["全部地區","台北市","新北市","桃園市","台中市","台南市","高雄市","基隆市","新竹市","嘉義市","新竹縣","苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","台東縣","澎湖縣","金門縣","福建省連江縣"])
        myArray.append(["不拘","委任","推薦","簡任"])
    }
    

    @IBAction func leftBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchDetailTVC", for: indexPath) as! SearchDetailTVC
        return cell
    }
    
    
}


class SearchDetailTVC: UITableViewCell {
    
    
    
}
