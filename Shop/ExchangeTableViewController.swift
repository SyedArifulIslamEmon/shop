//
//  ExchangeTableViewController.swift
//  Shop
//
//  Created by Roland Michelberger on 16.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import UIKit

class ExchangeTableViewController: UITableViewController {
    
    var sourcePrice : Price?
    private var prices = [Price]()
    private let currencyFormatter = NumberFormatter()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale.current
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(ExchangeTableViewController.refresh), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl!) // not required when using UITableViewController
        
        // animate refresh control
        refreshControl?.beginRefreshing()
        refresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh() {
        loadExhangeRates()
    }
    
    func loadExhangeRates() {
        if let currency = sourcePrice?.currency {
            ExchangeRatesService.exchangeRates(fromSource: currency) { (exchangeRates, error) in
                if let error = error {
                    print(error)
                } else if let exchangeRates = exchangeRates {
                    self.prices.removeAll()
                    
                    for exchangeRate in exchangeRates.quotes {
                        if let amount = self.sourcePrice?.amount.multiplying(by: NSDecimalNumber(string: "\(exchangeRate.rate)")) {
                            self.prices.append(Price(amount: amount, currency: exchangeRate.to))
                        }
                    }
                    
                    // order alphabetical by currency
                    self.prices = self.prices.sorted(by: { $0.currency.rawValue < $1.currency.rawValue })
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                    if let timeInterval = exchangeRates?.timestamp {
                        let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
                        let dateString = self.dateFormatter.string(from: date)
                        self.refreshControl?.attributedTitle = NSAttributedString(string: dateString)
                    }
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return prices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        let price = prices[indexPath.row]
        cell.textLabel?.text = currencyFormatter.string(from: price)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
