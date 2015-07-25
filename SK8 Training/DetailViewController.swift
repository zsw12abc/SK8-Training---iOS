//
//  DetailViewController.swift
//  SK8 Training
//
//  Created by Shaowei Zhang on 15/7/22.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDetail: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numToBuy: UILabel!
    
    
    var product: Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        numTextField.delegate = self
        if product != nil {
            productImage.image = UIImage(named: product!.image)
            productName.text = product?.title
            productDetail.text = product?.info
            productPrice.text = "\(product!.price)"
            totalPrice.text = "总价格: $\((product?.num)! * (product?.price)!)"
            slider.value = Float(product!.num)
            numToBuy.text = "购买数量: \(product!.num)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buyButtonPressed(sender: AnyObject) {
        //        let numOfProduct = 1
        //        product!.num = product!.num + numOfProduct
        if(product!.num > 0){
            if cart.contains(product!) {
                
            }else{
                cart.append(product!)
            }
        }else if product!.num == 0 {
            cart.removeAtIndex(products.indexOf(product!)!)
        }
    }
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        let controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        controller.setInitialText("\(product!.title)\n\(product!.info)")
        controller.addImage(UIImage(named: product!.image))
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func NumChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        slider.value = Float(i)
        product!.num = i
        numToBuy.text = "购买数量: \(i)"
        totalPrice.text =  "总价格: $\(i * product!.price)"
        
    }
}