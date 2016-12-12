//
//  DairyViewControler.swift
//  DailyApplication
//
//  Created by 山田尚吾 on 2016/11/27.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit

class DairyViewControler : UIViewController, UIToolbarDelegate{
    
    //日付を指定するテキストフィールド
    @IBOutlet weak var dateTextField: UITextField!
    
    //日付を扱うために使用する変数(今回はグローバルとして使用する)
    var myDatePicker : UIDatePicker!
    var toolBar:UIToolbar!
    
    //最初に呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テキストをDate型に変換してViewに追加する記述
        dateTextField.placeholder = dateToString(date: NSDate())
        dateTextField.text = dateToString(date: NSDate())
        
        self.view.addSubview(dateTextField)
        //カスタムDatePikckerを生成
        createDatePicker()
        //ツールバーを生成
        createToober()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //この書き方はあまり良くない。。。。クラスに切り分けたい、、、
    //-----------------------ここからDatePicker--------------------//
    //DatePickerを生成
    func createDatePicker(){
        
        myDatePicker = UIDatePicker()
        //DatePickerにクリックイベントを付与する
        myDatePicker.addTarget(self, action: #selector(DairyViewControler.changedDateEvent), for: UIControlEvents.valueChanged)
        //datePickerの種類をセット(時間なども設定可能)
        myDatePicker.datePickerMode = UIDatePickerMode.date
        //テキストフィールドに追加
        dateTextField.inputView = myDatePicker
    }
    
    //Toolbarを生成
    func createToober(){
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        
        //ツールバーにボタンを追加
        let compToolBarBtn = UIBarButtonItem(title: "完了", style: .bordered, target: self, action: #selector(DairyViewControler.tappedToolBarBtn))
        compToolBarBtn.tag = 1
        toolBar.items = [compToolBarBtn]
        
        dateTextField.inputAccessoryView = toolBar
    }
    
    //「完了」ボタンのクリックイベント(閉じるだけ。。。)
    func tappedToolBarBtn(sender: AnyObject?) {
        dateTextField.resignFirstResponder()
    }

    
    //DatePickerスライドイベント
    func changedDateEvent(sender: AnyObject?){
        self.changeLabelDate(date: myDatePicker.date as NSDate)
    }
    
    //テキストのラベルを変更する
    func changeLabelDate(date:NSDate) {
        dateTextField.text = self.dateToString(date: date)
    }
    
    
    //date型をString型に変換
    func dateToString(date: NSDate) -> String {
        
        let date_formatter: DateFormatter = DateFormatter()
        
        date_formatter.locale     = NSLocale(localeIdentifier: "ja") as Locale!
        date_formatter.dateFormat = "yyyy年MM月dd日 "
        
        return date_formatter.string(from: date as Date)
    }
    
    //-----------------------ここまでDatePicker--------------------//
    
    @IBAction func segmentedControl(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0://「Entry」が押されたとき
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "EntriesViewControler") as! ViewController
            self.present(calendarViewControler,animated: false,completion: nil)
            
        case 1://「Calendar」が押されたとき
            
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "CalenderViewControler") as! CalenderViewControler
            self.present(calendarViewControler,animated: false,completion: nil)
            
        case 2://「」が押されたとき
            
            let calendarViewControler = self.storyboard!.instantiateViewController( withIdentifier: "DairyViewControler") as! DairyViewControler
            self.present(calendarViewControler,animated: false,completion: nil)
            
        default:
            print("該当なし")
        }
    }

}
