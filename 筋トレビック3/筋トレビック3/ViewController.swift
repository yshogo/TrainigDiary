//
//  ViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit
import CoreData


// MARK: - 色タプル
extension UIColor {
    class func lightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    
    class func lightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

/// カレンダー画面
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = NSDate()
    var today: NSDate!
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    /// 前月ボタン
    @IBOutlet weak var prevButton: UIButton!
    /// 次月ボタン
    @IBOutlet weak var nextButton: UIButton!
    /// 日付ラベル
    @IBOutlet weak var dateLabel: UILabel!
    /// カレンダーヘッダービュー
    @IBOutlet weak var colendarHeaderView: UIView!
    /// カレンダーコレクションビュー
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //delegate登録
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// セクションの数(セクション1：曜日 セクション2：日にちの数)
    ///
    /// - Parameter collectionView: <#collectionView description#>
    /// - Returns: <#return value description#>
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    /// セルの数
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Section毎にCellの総数を変える.
        if section == 0 {
            //セクション1の場合は曜日だけなので「7」を返す
            return daysPerWeek
        } else {
            //セクション2は月によって異なる
            return 30//現時点では30とする
        }
    }
    
    
    /// 1セルのデータを返すメソッド
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //コレクションビューから識別子「CalendarCell」のセルを取得する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCellViewController", for: indexPath) as! CalendarCellViewController
        
        return cell
    }
    
    
    /// 前月ボタンクリックイベント
    /// - Parameter sender: <#sender description#>
    @IBAction func prevButtonEvent(_ sender: Any) {
    }
    
    /// 次月ボタンクリックイベント
    /// - Parameter sender: <#sender description#>
    @IBAction func nextButtonEvent(_ sender: Any) {
    }
    
    /// segmentationTABをクリックしたときのクリックイベント
    /// 画面推移する
    /// - Parameter sender:
    @IBAction func chengeView(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
            
        case 0:
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "ViewController") as! ViewController
            self.present(calendarViewControler,animated: false,completion: nil)
        
        default :
        
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "PostViewController") as! PostViewController
            self.present(calendarViewControler,animated: false,completion: nil)
        }
    }
}

