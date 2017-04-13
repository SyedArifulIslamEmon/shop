//
//  CartViewController.swift
//  Shop
//
//  Created by Roland Michelberger on 13.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource {

    private let products = Cart.sharedInstance.products
    private let currencyFormatter = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Configure the cell...
        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.name
        
        let productCount = Cart.sharedInstance.countForProduct(product: product)
        let priceAmount = product.unitPrice.amount.multiplying(by: NSDecimalNumber(string: "\(productCount)"))
        let price = Price(amount: priceAmount, currency: product.unitPrice.currency)
        cell.detailTextLabel?.text = "\(productCount) \(product.unit.rawValue)(s) = \(currencyFormatter.string(from: price) ?? "")"
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
