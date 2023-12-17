//
//  ActivitiesTableViewCell.swift
//  brasil
//
//  Created by Julio Braganca on 17/12/23.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var activityLabel: UILabel!
    
    static let identifier: String = String(describing: ActivitiesTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    public func setupCell(data: Activity) {
        titleLabel.text = data.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        activityLabel.text = data.activity
    }
}
