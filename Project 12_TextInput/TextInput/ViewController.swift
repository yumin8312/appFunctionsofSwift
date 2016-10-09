//
//  ViewController.swift
//  TextInput
//
//  Created by yumin on 2016/10/7.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet var textfield:UITextField!
    @IBOutlet var textview:UITextView!
    
    @IBOutlet var Enlargebutton:UIButton!
    @IBOutlet var Boldbutton:UIButton!
    @IBOutlet var Italicbutton:UIButton!
    
    
    var fontcount = 0
    var blodsize = true
    var Italicasize = true
    
    // textField 結束編輯 把鍵盤隱藏起來
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // textField 限制字數
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location >= 10  {
            return false
        }
        return true
    }
    
    // textview 隱藏鍵盤＆限制字數
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text.contains("\n") {//當按下換行鍵,就隱藏鍵盤
            self.view.endEditing(true)
        }else if range.location >= 20 {         //字數限制不超過n個字元,若字元等於n就隱藏鍵盤
            textview.resignFirstResponder()
            return false
        }
        return true
    }
   
    //用手勢方式(滑鼠點擊)關閉小鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    @IBAction func Enlarge() {
        switch fontcount {
        case 0:
            textview.font = UIFont.systemFont(ofSize: 20)
            fontcount+=1
        case 1:
            textview.font = UIFont.systemFont(ofSize: 25)
            fontcount+=1
        case 2:
            textview.font = UIFont.systemFont(ofSize: 30)
            fontcount+=1
        default:
            textview.font = UIFont.systemFont(ofSize: 17) //default value
            fontcount = 0
            
            //bug  未解決 , 看是否可以縮放時 粗斜體都還在
//            if  blodsize == false {
//                textview.font = UIFont.boldSystemFont(ofSize: 17)
//            } else if Italicasize == false {
//                textview.font = UIFont.italicSystemFont(ofSize: 17)
//            }

        }
    }
    
    @IBAction func Bold() {
        switch (fontcount - 1) {
        case 0:
            if blodsize {
                textview.font = UIFont.boldSystemFont(ofSize: 20)
                blodsize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 20)
                blodsize = true
            }
        case 1:
            if blodsize {
                textview.font = UIFont.boldSystemFont(ofSize: 25)
                blodsize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 25)
                blodsize = true
            }
        case 2:
            if blodsize {
                textview.font = UIFont.boldSystemFont(ofSize: 30)
                blodsize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 30)
                blodsize = true
            }
            
        default:
            if blodsize {
                textview.font = UIFont.boldSystemFont(ofSize: 17)
                blodsize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 17)
                blodsize = true
            }
            
        }
    }
    
    @IBAction func Italic() {
        switch (fontcount - 1) {
        case 0:
            if Italicasize {
                textview.font = UIFont.italicSystemFont(ofSize: 20)
                Italicasize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 20)
                Italicasize = true
            }
        case 1:
            if Italicasize {
                textview.font = UIFont.italicSystemFont(ofSize: 25)
                Italicasize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 25)
                Italicasize = true
            }
        case 2:
            if Italicasize {
                textview.font = UIFont.italicSystemFont(ofSize: 30)
                Italicasize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 30)
                Italicasize = true
            }
            
        default:
            if Italicasize {
                textview.font = UIFont.italicSystemFont(ofSize: 17)
                Italicasize = false
            } else {
                textview.font = UIFont.systemFont(ofSize: 17)
                Italicasize = true
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       textfield.returnKeyType = .done
       textview.returnKeyType = .done
        
       //change label conerer radius
        Enlargebutton.layer.cornerRadius = 30.0
        Enlargebutton.clipsToBounds = true
        
        Boldbutton.layer.cornerRadius = 30.0
        Boldbutton.clipsToBounds = true
        
        Italicbutton.layer.cornerRadius = 30.0
        Italicbutton.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    
}

