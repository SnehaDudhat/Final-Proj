//
//  FontScheme.swift
//  kiranDiamond
//
//  Created by Coruscate on 28/02/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

//MARK:  Font Constant

struct FontConstant {
    
    static let kRegularFont                     = "AVERTA-REGULAR"
    static let kLightFont                       = "AVERTA-LIGHT"
    static let kBoldFont                        = "AVERTA-BOLD"
    static let kSemiBoldFont                    = "AVERTA-SEMIBOLD"
   
    
}

class FontScheme: NSObject {

    static func fontFromConstant(fontName: String,size : CGFloat) -> UIFont {
        
        var result = UIFont()
        
        switch fontName {
        case "kRegularFont":
            result = self.kRegularFont(size: size)
            break
        case "kLightFont":
            result = self.kLightFont(size: size)
            break
        case "kBoldFont":
            result = self.kBoldFont(size: size)
            break
        case "kSemiBoldFont":
            result = self.kSemiBoldFont(size: size)
            break
        default:
            result = self.kRegularFont(size: size)
        }
        
        return result
    }
    
    //Regular
    static func kRegularFont(size : CGFloat) -> UIFont  {
        
        return UIFont(name: FontConstant.kRegularFont, size: size)!
    }
    
    //Light
    static func kLightFont(size : CGFloat) -> UIFont  {
        
        return UIFont(name: FontConstant.kLightFont, size: size)!
    }
    
    //Bold
    static func kBoldFont(size : CGFloat) -> UIFont  {
        
        return UIFont(name: FontConstant.kBoldFont, size: size)!
    }
    
    //SemiBold
    static func kSemiBoldFont(size : CGFloat) -> UIFont  {
        
        return UIFont(name: FontConstant.kSemiBoldFont, size: size)!
    }
    
}
