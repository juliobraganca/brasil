//
//  EmbassyTableViewCell.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class EmbassyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    static let identifier: String = String(describing: EmbassyTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    public func setupCell(data: EmbassyAbroadDetail) {
        addressLabel.text = "Address: \(data.address)"
        phoneLabel.text = "Phone: \(data.phone)"
    }
    
}
