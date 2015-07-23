//
//  CollectionViewController.swift
//  SK8 Training
//
//  Created by Shaowei Zhang on 15/7/23.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit

//var productSelected: Product = nil
class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var productID : Int = 0
    
    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! colvwCell
        cell.labelCell.text = products[indexPath.row].title
        cell.imageCell.image = UIImage(named: products[indexPath.row].image)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Cell \(indexPath.row) selected")
        productID = indexPath.row
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CellSelected" {
            var secondScene = segue.destinationViewController as! DetailViewController
            let cell = sender as! UICollectionViewCell
            let indexPath = CollectionView.indexPathForCell(cell)
            secondScene.product = products[indexPath!.row]
        }
    }
    
}