//
//  ViewController.swift
//  SK8 Training
//
//  Created by Shaowei Zhang on 15/7/21.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit

var products:[Product] = []
var cart:[Product] = []
var filteredProduct: [Product] = []


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        products = [Product(id: "1", image: "iphone6.png", title: "iPhone6", price: 6400, info: "苹果公司出品的第六代 iPhone 手机", num: 0),Product(id: "2", image: "lumia920.png", title: "Lumia920", price: 2400, info: "诺基亚公司出品的第一款 wp8手机", num: 0),Product(id: "3", image: "lumia930.png", title: "Lumia930", price: 4500, info: "诺基亚公司出品的最后一款 wp8手机", num: 0),Product(id: "4", image: "samsungs6.png", title: "Samsungs6", price: 4800, info: "三星公司出品的第一款曲屏手机", num: 0),Product(id: "5", image: "xiaomi.png", title: "Xiaomi", price: 2000, info: "小米是中国的苹果", num: 0)]
        navigationItem.leftBarButtonItem = editButtonItem()
        
        var contentOffset = tableView.contentOffset
        contentOffset.y += searchDisplayController!.searchBar.frame.size.height
        tableView.contentOffset = contentOffset
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchDisplayController?.searchResultsTableView {
            return filteredProduct.count
        } else {
            return products.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("productCell") as UITableViewCell!
        var product : Product
        
        if tableView == searchDisplayController?.searchResultsTableView{
            product = filteredProduct[indexPath.row] as Product
        } else {
            product = products[indexPath.row] as Product
        }
        
        let image = cell.viewWithTag(101) as! UIImageView
        let name = cell.viewWithTag(102) as! UILabel
        let price = cell.viewWithTag(103) as! UILabel
        
        image.image = UIImage(named: product.image)
        name.text = product.title
        price.text = "$\(product.price)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            products.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ViewProduct" {
            let vc = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath {
                vc.product = products[index.row]
            }
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        //        print("closed")
        tableView.reloadData()
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool{
        filteredProduct = products.filter(){
            $0.title.rangeOfString(searchString!) != nil
        }
        return true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
}

