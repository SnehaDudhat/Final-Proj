//
//  UIImageViewExtension.swift
//  KiranJewellery
//
//  Created by Rushi Sangani on 27/08/17.
//  Copyright © 2017 Rushi Sangani. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func setImageForURL(url: URL, placeHolder: UIImage?) {
        
        self.sd_setShowActivityIndicatorView(true)
        self.sd_setIndicatorStyle(.gray)
        self.sd_setImage(with: url, placeholderImage: placeHolder)
    }
}
