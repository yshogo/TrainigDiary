//
//  PostViewController.swift
//  筋トレビック3
//
//  Created by ShogoYamada on 2016/12/24.
//  Copyright © 2016年 山田尚吾. All rights reserved.
//

import UIKit
import CoreData


/// データ投稿画面
class PostViewController: UIViewController ,UITextFieldDelegate{
    
    //日付のテキストフィールド
    @IBOutlet weak var datePickerField: UITextField!
    /// 筋トレ種目ラベル
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
        
        //Returnキーを押したときにキーボードを閉じる設定
        datePickerField.delegate = self
        maxWeightField.delegate = self
        lepNumField.delegate = self
        
        //テキストをDate型に変換してViewに追加する記述
        datePickerField.placeholder = DateToStringUtil.dateToString(date: NSDate())
        datePickerField.text = DateToStringUtil.dateToString(date: NSDate())
        self.view.addSubview(datePickerField)
        
        //datepikerの生成
        createDatePicker()
        //toolbarの生成
        createToober()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// DatePickerを生成
    func createDatePicker(){
        
        myDatePicker = UIDatePicker()
        //DatePickerにクリックイベントを付与する
        myDatePicker.addTarget(self, action: #selector(PostViewController.changedDateEvent), for: UIControlEvents.valueChanged)
        //datePickerの種類をセット(時間なども設定可能)
        myDatePicker.datePickerMode = UIDatePickerMode.date
        //テキストフィールドに追加
        datePickerField.inputView = myDatePicker
    }
    
    ///DatePickerスライドイベント
    ///
    /// - Parameter sender: <#sender description#>
    func changedDateEvent(sender: AnyObject?){
        datePickerField.text = DateToStringUtil.dateToString(date: myDatePicker.date as NSDate)
    }
    
    /// Toolbarを生成
    func createToober(){
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        
        //ツールバーにボタンを追加
        let compToolBarBtn = UIBarButtonItem(title: "完了", style: .bordered, target: self, action: #selector(PostViewController.tappedToolBarBtn))
        compToolBarBtn.tag = 1
        toolBar.items = [compToolBarBtn]
        
        datePickerField.inputAccessoryView = toolBar
    }
    
    /// 「完了」ボタンのクリックイベント(閉じるだけ。。。)
    ///
    /// - Parameter sender: <#sender description#>
    func tappedToolBarBtn(sender: AnyObject?) {
        datePickerField.resignFirstResponder()
    }
    
    /// テキストフィールドでRetrunキーを押したときのキーボードを閉じるメソッド
    ///
    /// - Parameter textField: テキストフィールド
    /// - Returns: true or false
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    
    /// 「投稿」ボタンクリックイベント
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func submid(_ sender: Any) {
        
        ///テキストフィールドのテキストを一旦変数に格納
        let date = datePickerField.text
        let big3 = big3Label.text
        let maxweight = maxWeightField.text
        let lepNum = lepNumField.text
        
        let model = Big3DataModel()
        model.date = date!
        model.big3 = big3!
        model.lepNum = lepNum!
        model.maxweight = maxweight!

        let dao = Big3Dao()
        dao.saveData(big3DataModel: model)
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
