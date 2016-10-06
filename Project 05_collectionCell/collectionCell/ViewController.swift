//
//  ViewController.swift
//  collectionCell
//
//  Created by yumin on 2016/9/21.
//  Copyright © 2016年 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imags = ["sunrise","Sunset","Sketch","ButterflyBridge","Valentine Bridge","FortZeelandia","nightView-2","nightView","treehouse-2","treehouse"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
           
    
//    //MARK: - Collection Cell View Size
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
//            //iphone 直向
//            return CGSize(width: 40, height: 40)
//        }else{
//            //iphone 橫向
//            return CGSize(width: 120, height: 120)
//        }
//    }
//    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        //更新collection view
//        collectionView.reloadData()
//    }
    
    //MARK: - CollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3   //section = header + cell + footer
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage(named: imags[indexPath.row])
        
        
        return cell
    }
    
    //MARK: - Supplementary view
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 建立 UICollectionReusableView
        var reusableView = UICollectionReusableView()
        
        // header
        if kind == UICollectionElementKindSectionHeader {
            // 依據前面註冊設置的識別名稱 "Header" 取得目前使用的 header
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath as IndexPath) 
            // 設置 header 的內容
            reusableView.backgroundColor = UIColor.red
            
        } else if kind == UICollectionElementKindSectionFooter {
            // 依據前面註冊設置的識別名稱 "Footer" 取得目前使用的 footer
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath)
            // 設置 footer 的內容
            reusableView.backgroundColor = UIColor.green
        
        }
        return reusableView
    }
    

}

