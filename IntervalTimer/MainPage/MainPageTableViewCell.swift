//
//  MainPageTableViewCell.swift
//  IntervalTimer
//
//  Created by Денис Дубовиков on 10.10.2020.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = self.frame
        return label
    }()
    
    override func layoutSubviews() {
        addSubview(titleLabel)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
