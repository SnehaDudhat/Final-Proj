//
//  FontInspectable.swift
//  kiranDiamond
//
//  Created by Coruscate on 28/02/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

@IBDesignable
open class MMLabel: UILabel {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    var FontName: String = "kRegularFont"  {
        didSet {
            self.updateFont()
        }
    }
    
    @IBInspectable
    var FontSize: CGFloat = 12  {
        didSet {
            self.updateFont()
        }
    }
    
    func updateFont() {
        
        self.font = FontScheme.fontFromConstant(fontName: self.FontName, size: self.FontSize)
    }
}

open class DiamondLabel: UILabel {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    var FontName: String = "kRegularFont"  {
        didSet {
            self.updateFont()
        }
    }
    
    @IBInspectable
    var FontSize: CGFloat = 12  {
        didSet {
            self.updateFont()
        }
    }
    
    func updateFont() {
        
        if AppConstants.DeviceType.IS_IPHONE_5{
            self.font = FontScheme.fontFromConstant(fontName: self.FontName, size: self.FontSize - 2)
        }else{
            self.font = FontScheme.fontFromConstant(fontName: self.FontName, size: self.FontSize)
        }
    }
}

@IBDesignable
open class MMButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    var FontName: String = "kRegularFont"  {
        didSet {
            self.updateFont()
        }
    }
    
    @IBInspectable
    var FontSize: CGFloat = 12  {
        didSet {
            self.updateFont()
        }
    }
    
    func updateFont() {
        
        self.titleLabel?.font = FontScheme.fontFromConstant(fontName: self.FontName, size: self.FontSize)
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}


@IBDesignable
open class MMTextField: UITextField {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    var FontName: String = "kRegularFont"  {
        didSet {
            self.updateFont()
        }
    }
    
    @IBInspectable
    var FontSize: CGFloat = 12  {
        didSet {
            self.updateFont()
        }
    }
    
    func updateFont() {
        
        self.font = FontScheme.fontFromConstant(fontName: self.FontName, size: self.FontSize)
    }
}
