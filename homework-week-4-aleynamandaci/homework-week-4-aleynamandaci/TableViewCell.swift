//
//  TableViewCell.swift
//  homework-week-4-aleynamandaci
//
//  Created by Aleyna Mandacı on 11.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet private(set) weak var cryptoLogo: UIImageView!
    
    @IBOutlet private(set) weak var cryptoName: UILabel!
    
    @IBOutlet private(set) weak var cryptoSymbol: UILabel!
    
    @IBOutlet private(set) weak var cryptoPrice: UILabel!
    
    @IBOutlet private(set) weak var cryptoChangePercentage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
