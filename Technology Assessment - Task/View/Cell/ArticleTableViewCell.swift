//
//  ArticleTableViewCell.swift
//  Technology Assessment - Task
//
//  Created by Mustafa on 27/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        articleImageView.circularImageView(width: articleImageView.frame.width)
    }
    

}
