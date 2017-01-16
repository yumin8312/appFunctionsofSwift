//
//  ViewController.swift
//  MosaicLayout
//
//  Created by yumin on 22/10/2016.
//  Copyright © 2016 yumin. All rights reserved.
//

import UIKit
import FMMosaicLayout

class ViewController: UICollectionViewController, FMMosaicLayoutDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mosaicLayout : FMMosaicLayout = FMMosaicLayout.init()
        self.collectionView?.collectionViewLayout = mosaicLayout
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //display random color
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBull = CGFloat(drand48())
        
        cell.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBull, alpha: 1.0 )
        
        //achieve mosaic effect
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: ({ () -> Void in
            cell.alpha = 1.0
        }))
        
//        // DISPATCH_TIME_NOW -> BUG unsolved
//        var millisecondsDelay =  UInt64((arc4random() % 600) / 1000)
//        dispatch_after(dispatch_time_t(DISPATCH_TIME_NOW, radix: Int64(millisecondsDelay *  NSEC_PER_SEC)), dispatch_get_main_queue(), ({ () -> Void in
//        
//            UIView.animate(withDuration: 0.3, animations: ({ () -> Void in
//                    cell.alpha = 1.0
//            }))
//            
//        }))

        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    //MARK: - FMMosaicLayoyt
    
    //FMMosaicLayoytDelegate
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, numberOfColumnsInSection section: Int) -> Int {
        return 2
    }
    
    // cell's EdgeInsets
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }
    
    // Spacing of cell
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    //achieve cell different size 
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAt indexPath: IndexPath!) -> FMMosaicCellSize {
        return indexPath.item % 7 == 0 ? FMMosaicCellSize.big : FMMosaicCellSize.small
    }
}

