//
//  ViewController.swift
//  CarouselEffect
//
//  Created by yumin on 23/10/2016.
//  Copyright © 2016 yumin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    private var carouseldatas = carouselData.createData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private struct Storyboard {
        static var Cellidentifer = "carousel Cell"
    }
    
    
    //MARK: -collection view delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouseldatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  Storyboard.Cellidentifer, for: indexPath) as! carouselCollectionViewCell
        
        cell.carousels = self.carouseldatas[indexPath.item]
        
        
        return cell
    }
    
    
}

