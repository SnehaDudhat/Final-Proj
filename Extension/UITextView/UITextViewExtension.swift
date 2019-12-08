//
//  UITextViewExtension.swift
//  BaseDemo
//
//  Created by Sierra on 27/04/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    /// Modifies the top content inset to center the text vertically.
    
    func alignTextVerticallyInContainer() {
        var topCorrect = (self.bounds.size.height - self.contentSize.height * self.zoomScale) / 2
        topCorrect = topCorrect < 0.0 ? 0.0 : topCorrect;
        self.contentInset.top = topCorrect
    }
}
