//
//  ColorScheme.swift
//  PTE
//
//  Created by CS-Mac-Mini on 10/08/17.
//  Copyright © 2017 CS-Mac-Mini. All rights reserved.
//

import UIKit

class ColorScheme: NSObject {
    
    static func colorFromConstant(textColorConstant: String) -> UIColor {
        
        var result = UIColor()
        
        switch textColorConstant {
        case "kTextColor":
            result = self.kTextColor()
            break
        case "kBorderColor":
            result = self.kBorderColor()
            break
        case "kRedColor":
            result = self.kRedColor()
            break
        case "kThemeColor":
            result = self.kThemeColor()
            break
        case "KBgColor":
            result = self.kBgColor()
            break
        case "kPlaceHolderColor":
            result = self.kPlaceHolderColor()
            break
        case "kFilterTextColor":
            result = self.kFilterTextColor()
            break
        case "kFilterBorderColor":
            result = self.kFilterBorderColor()
            break
        case "kDiamondDarkColor":
            result = self.kDiamondDarkColor()
            break
        case "kDiamondBlackColor":
            result = self.kDiamondBlackColor()
            break
        case "kSearchListTextColor":
            result = self.kSearchListTextColor()
            break
        case "kSepratorColor":
            result = self.kSepratorColor()
            break
        case "kLightTextColor":
            result = self.kLightTextColor()
            break
        case "kDiamondDetailTextColor":
            result = self.kDiamondDetailTextColor()
            break
        default:
            result = self.kTextColor()
        }
      
        return result
    }
    
    //MARK: Private Methods
    
    static func kThemeColor() -> UIColor{
        return ColorConstants.ThemeColor
    }

    static func kTextColor() -> UIColor{
        return ColorConstants.TextColor
    }
    
    static func kBorderColor() -> UIColor{
        return ColorConstants.BorderColor
    }
    
    static func kRedColor() -> UIColor{
        return ColorConstants.RedColor
    }
    
    static func kPlaceHolderColor() -> UIColor{
        return ColorConstants.PlaceHolderColor
    }
    
    static func kFilterTextColor() -> UIColor{
        return ColorConstants.FilterTextColor
    }
    
    static func kFilterBorderColor() -> UIColor{
        return ColorConstants.FilterBorderColor
    }
    
    static func kDiamondDarkColor() -> UIColor{
        return ColorConstants.DiamondDarkColor
    }
    
    static func kDiamondBlackColor() -> UIColor{
        return ColorConstants.DiamondBlackColor
    }
    
    static func kSearchListTextColor() -> UIColor{
        return ColorConstants.SearchListTextColor
    }
    
    static func kSepratorColor() -> UIColor{
        return ColorConstants.SepratorColor
    }
    
    static func kLightTextColor() -> UIColor{
        return ColorConstants.LightTextColor
    }
    
    static func kDiamondDetailTextColor() -> UIColor{
        return ColorConstants.DiamondDetailTextColor
    }
    
    static func kBgColor() -> UIColor{
        return ColorConstants.BgColor
    }
}
