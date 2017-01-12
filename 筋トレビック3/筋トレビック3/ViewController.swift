//
//  ViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit
import CoreData


/// カレンダー画面
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 5.0
    var selectedDate = NSDate()
    var today: NSDate!
    
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
        
        //カレンダーラベルを設定
        dateLabel.text = dateManager.CalendarHeader()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルをクリックしたら呼ばれる
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let date = dateManager.conversionDateFormat(index: indexPath.row)
        //タイトルを選択された日付に返す
        dateLabel.text = dateManager.CalendarHeader(date: date,row:indexPath.row)
        
        let big3Dao = Big3Dao()
        //コレクションビューから識別子「CalendarCell」のセルを取得する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCellViewController", for: indexPath) as! CalendarCellViewController

        //クリックされた日付にデータが存在するならそのデータを取得
        var model:Big3DataModel = Big3DataModel()
        if cell.compLabel.text != "" {
            model = big3Dao.getBig3DataModdel(date: dateManager.CalendarHeader(date: date,row:indexPath.row))
        }
        
        //データが空でないときだけデータを表示する
        if model.big3 != "" {
            
            // TODO ここにポップアップウインドウ(自作のアラート)を
            //表示させます
            print(model.big3)
        }
    }
    
    /// セルの数
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dateManager.daysAcquisition()
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

        //セルにテキストがすでに表示されている場合は一度リセットする
        if cell.compLabel.text != ""{
            cell.compLabel.text = ""
        }

        //日付表示
        cell.textLabel.text = dateManager.conversionDateFormat(index: indexPath.row)
        
        //表示されている日付を取得
        let trainingType = TrainingType()
        
        let date = dateManager.conversionDateFormat(index: indexPath.row)
        let dateLabel = dateManager.CalendarHeader(date: date,row:indexPath.row)
        
        //保存されている筋トレの種類によってセルのテキストを変える
        let trainingTypeEnum = trainingType.isTraingType(date: dateLabel)
        if trainingTypeEnum == TrainingTypeEnum.BENCH_PRESS{
            cell.compLabel.text = "ベンチ"
        }else if trainingTypeEnum == TrainingTypeEnum.SCWATTO{
            cell.compLabel.text = "スクワット"
        }else if trainingTypeEnum == TrainingTypeEnum.DEAD_LIFT{
            cell.compLabel.text = "デットリスト"
        }
        
        return cell
    }
    
    
    /// セルサイズの指定（UICollectionViewDelegateFlowLayoutで必須）　横幅いっぱいにセルが広がるようにしたい
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin:CGFloat = 8.0
        let widths:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin)/CGFloat(daysPerWeek)
        let heights:CGFloat = widths * 2
        
        return CGSize(width:widths,height:heights)
    }
    
    
    /// セルのアイテムのマージンを設定
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0 , 0.0 , 0.0 , 0.0 )  //マージン(top , left , bottom , right)
    }
    
    /// セルの水平方向のマージンを設定
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    /// セルの垂直方向のマージンを設定
    ///
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - collectionViewLayout: <#collectionViewLayout description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
    
    /// 前月ボタンクリックイベント
    /// - Parameter sender: <#sender description#>
    @IBAction func prevButtonEvent(_ sender: Any) {
        dateManager.preMonthCalendar()
        calendarCollectionView.reloadData()
        dateLabel.text = dateManager.CalendarHeader()
    }
    
    /// 次月ボタンクリックイベント
    /// - Parameter sender: <#sender description#>
    @IBAction func nextButtonEvent(_ sender: Any) {
        dateManager.nextMonthCalendar()
        calendarCollectionView.reloadData()
        dateLabel.text = dateManager.CalendarHeader()
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

