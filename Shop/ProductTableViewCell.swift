//
//  ProductTableViewCell.swift
//  Shop
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var unitPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        unitPriceLabel.textColor = Colors.SecondaryTextColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        contentView.backgroundColor = selected ? Colors.AccentColor : Colors.BackgroundColor
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        contentView.backgroundColor = highlighted ? Colors.AccentColor : Colors.BackgroundColor
    }
}
