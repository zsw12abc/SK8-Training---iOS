//
//  CartViewController.swift
//  SK8 Training
//
//  Created by Shaowei Zhang on 15/7/22.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("CartCell") as UITableViewCell!
        let product = products[indexPath.row] as Product
        
        let image = cell.viewWithTag(101) as! UIImageView
        let name = cell.viewWithTag(102) as! UILabel
        let price = cell.viewWithTag(103) as! UILabel
        let num = cell.viewWithTag(104) as! UILabel
        let totalPrice = cell.viewWithTag(105) as! UILabel
        
        image.image = UIImage(named: product.image)
        name.text = product.title
        price.text = "$\(product.price)"
        num.text = "个数: \(product.num)"
        totalPrice.text = "总价格: $\(product.num * product.price)"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductEdit" {
            let vc = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath {
                vc.product = cart[index.row]
            }
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        tableView.reloadData()
    }
}