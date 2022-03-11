//
//  ViewController.swift
//  GovJobApi
//
//  Created by 廖翔 on 2022/2/27.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    
    -Alert 要求藍牙權限，確認地點在附近
    -Alert 首次使用進行資料更新（可按左上角按鈕或者下拉式更新，沒更新就都沒資料）
        
     1.使用 Tabbar 分成 3頁
        1.上排navigation
            -中間logo（每一頁都是）
            -左邊刷新資料（資料最新跳Alert）
            -右邊搜尋（跳分頁，分頁內容"篩選"條件）
                1.按下搜尋鍵跳分頁內容有： 1.Section -> 3個
                                        -一般選項 -> cell 4個
                                        -進階選項 -> cell 5個
                                        -預設 -> cell 1個
        2.Page 1 用TableView把 API 分別秀Cell上，Cell內容有
            -置頂文字有把有"篩選"的條件秀在上面
            -職務
            -職稱
            -職系
            -職等
            -效期
                1.點進Cell跳頁，把 API 分別秀在Cell上
                    1.navigation
                        -右上返回
                        -左邊收藏鍵（按下會跳Alert告知）和分享
                    2.cell內容有：
                        -徵才機關
                        -人員區分
                        -官職等
                        -職稱
                        -職系
                        -名額
                        -性別
                        -工作地點
                        -有效期間
                        -條件資格
                        -工作項目
                        -工作地點 （有按鈕，按下按鈕跳頁）
                            1.textfield 輸入工作地點的地址
                            2.Map顯示工作的位置
                        -聯絡E-Mail（有按鈕，按下按鈕跳頁）
                            1.navigation 左上返回鍵
                            2.跳至新增郵件頁面
                        -聯絡方式
        3.Page 2
            1.navigation 右上一鍵刪除全部收藏
            2.沒收藏資料時，文字表示
            3.有資料時跳Alert（評分），cell內容可以向右滑動刪除
     
        4.Page 3 TableView，Section -> 11個
            1.官方官網 Section -> 2個 （兩個Cell都是點擊跳視窗，使用預設瀏覽器開啟網址）
            2.（文字介紹）
            3.void
            4.自動更新 Section -> 3個
            5.（文字介紹）
            6.void
            7.void
            8.其他功能 Section -> 3個
            9.（文字介紹）
            10.void
            11.關於 Section -> 1個 （版本數字）
     
     2.定義API
        -徵才機關
        -人員區分
        -官職等
        -職稱
        -職系
        -名額
        -性別
        -工作地點
        -有效期間
        -條件資格
        -工作項目
        -工作地點
        -聯絡E-Mail
        -聯絡方式
     
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
    
    
}

