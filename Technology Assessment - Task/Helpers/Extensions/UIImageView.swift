//
//  UIImageView.swift
//  Technology Assessment - Task
//
//  Created by Mustafa on 27/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func circularImageView(width: CGFloat) {
        print(width)
        self.layer.cornerRadius = width / 2
        self.clipsToBounds = true
    }
    
    func imageWithURL(url: String) {
        self.sd_setImage(with: URL(string: url), placeholderImage: nil)
    }
}
