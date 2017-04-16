//
//  CartViewController.swift
//  Shop
//
//  Created by Roland Michelberger on 13.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource {
    
    var cart : Cart?
    private let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let totalPrice = cart?.totalPrice ?? Price(amount: NSDecimalNumber.zero, currency: .USD)
        title = "Total: \(currencyFormatter.string(from: totalPrice) ?? "0")"
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
        return cart?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Configure the cell...
        
        if let product = cart?.products[indexPath.row] {
            
            cell.textLabel?.text = product.name
            
            let productCount = cart?.count(for: product) ?? 0
            let priceAmount = product.unitPrice.amount.multiplying(by: NSDecimalNumber(string: "\(productCount)"))
            let price = Price(amount: priceAmount, currency: product.unitPrice.currency)
            cell.detailTextLabel?.text = "\(productCount) \(product.unit.rawValue)(s) = \(currencyFormatter.string(from: price) ?? "")"
        }
        return cell
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if let exchangeTableViewController = segue.destination as? ExchangeTableViewController {
            exchangeTableViewController.sourcePrice = cart?.totalPrice
        }
     }
    
}
