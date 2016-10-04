//
//  customSearchBar.swift
//  searchController
//
//  Created by yumin on 2016/10/4.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class customSearchBar: UISearchBar {

    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    
    //custom initializer 
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        
        //let searchbar become translucent(半透明) ＆ search field no transparent(透明)
        searchBarStyle = UISearchBarStyle.prominent
        isTranslucent = false //let search field become translucent
        
       // print(subviews[0].subviews)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//    }
    
    // return searchBar's textfield index
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
                break
            }
        }
        return index
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Find the index of the search field in the search bar subviews.
        if let index = indexOfSearchFieldInSubviews() {
            // Access the search field
            let searchField: UITextField = subviews[0].subviews[index] as! UITextField
            
            // Set its frame.
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width - 10.0, height: frame.size.height - 10.0)

            // Set the font and text color of the search field.
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            
            // Set the background color of the search field.
            searchField.backgroundColor = barTintColor
        }
        
        //BezierPath
        let startPoint = CGPoint(x: 0.0, y: frame.size.height)
        let endPoint = CGPoint(x: frame.size.width, y: frame.size.height)
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        //use CAShapeLayer() let BezierPath change color and width
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = preferredTextColor.cgColor
        shapeLayer.lineWidth = 2.5
        
        layer.addSublayer(shapeLayer)
        
        
        
        super.draw(rect)
    }
    

}
