//
//  PostViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    
    @IBOutlet weak var datePickerField: UITextField!
    
    @IBOutlet weak var big3Label: UILabel!
    
    
    /// 筋トレ種目ボタン
    @IBOutlet weak var benchPressButton: UIButton!
    @IBOutlet weak var scwattoButton: UIButton!
    @IBOutlet weak var deadLiftButton: UIButton!
    /// 最大重量ボタン
    @IBOutlet weak var maxWeightField: UITextField!
    /// レップ数フィールド
    @IBOutlet weak var lepNumField: UITextField!
    
    
    /// 日付を扱うために使用する変数
    var myDatePicker : UIDatePicker!
    var toolBar:UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テキストをDate型に変換してViewに追加する記述
        datePickerField.placeholder = DateToStringUtil.dateToString(date: NSDate())
        datePickerField.text = DateToStringUtil.dateToString(date: NSDate())
        self.view.addSubview(datePickerField)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 「投稿」ボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func submid(_ sender: Any) {
        
        var date = datePickerField.text
        var big3 = big3Label.text
        var maxweight = maxWeightField.text
        var lepNum = lepNumField.text
        
        
        
    }
    
    /// segmentationタブクリックイベント
    ///
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
    
    
    /// ビック3のラベルのテキストを変える
    ///
    /// - Parameter text: ラベルを変更する文字列
    private func chengeBig3Label(text:String){
        big3Label.text = text
    }

    
    /// ベンチプレスボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func benchPressButton(_ sender: Any) {
        //ラベルの変更
        chengeBig3Label(text: self.benchPressButton.currentTitle!)
    }
    
    /// スクワットボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func sucwattoButton(_ sender: Any) {
        //ラベルの変更
        chengeBig3Label(text: self.scwattoButton.currentTitle!)
    }

    /// デットリフトボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func deadLiftButton(_ sender: Any) {
        //ラベルの変更
        chengeBig3Label(text: self.deadLiftButton.currentTitle!)
    }
}
