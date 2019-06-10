//
//  NewViewCell.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import UIKit
import Kingfisher

class NewViewCell: UITableViewCell {
    
    static let identifier = "Cell"

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var subreditLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.isHidden = true
    }
    
    func prepare(with model: News) {
        self.titleLabel.text = model.title
        self.subreditLabel.text = model.subredit

        if let url = model.thumbnail {
            thumbnailView.isHidden = false
            self.thumbnailView.kf.setImage(with: url)
        }
    }

}
