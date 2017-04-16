//
//  ProductDetailViewController.swift
//  Shop
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import UIKit

protocol ProductDetailDelegate: class {
    
    func count(for product: Product) -> Int
    
    func productDetailViewController(productDetailViewController: ProductDetailViewController, didAdd product: Product)
    
    func productDetailViewController(productDetailViewController: ProductDetailViewController, didRemove product: Product)
}

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var unitPriceLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    private let currencyFormatter = NumberFormatter()
    
    var product : Product?
    weak var delegate : ProductDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let product = product {
            title = product.name
            textView.text = product.description
            unitPriceLabel.text = currencyFormatter.productUnitPriceString(product: product)
            let count = delegate?.count(for: product) ?? 0
            counterLabel.text = "\(count)"
            stepper.value = Double(count)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if let product = product {
            let value = Int(sender.value)
            let count = delegate?.count(for: product) ?? 0
            if value > count {
                delegate?.productDetailViewController(productDetailViewController: self, didAdd: product)
            } else if value < count {
                delegate?.productDetailViewController(productDetailViewController: self, didRemove: product)
            }
            
            counterLabel.text = "\(delegate?.count(for: product) ?? 0)"
        }
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
