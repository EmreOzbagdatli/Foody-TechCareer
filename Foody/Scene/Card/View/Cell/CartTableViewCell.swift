//
//  CartTableViewCell.swift
//  Foody
//
//  Created by Emre Özbağdatlı on 22.10.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    var onTapAction: (() -> Void)?

    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartFoodName: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var cartTotalPrice: UILabel!
    @IBOutlet weak var cartTotal: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func deleteButton(_ sender: Any) {
        onTapAction?()
    }
    
}
