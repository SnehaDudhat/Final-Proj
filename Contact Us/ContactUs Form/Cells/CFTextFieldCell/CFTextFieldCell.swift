//
//  CFTextFieldCell.swift
//  AnkitGems
//
//  Created by Sierra on 26/04/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class CFTextFieldCell: UITableViewCell {

    //MARK: Variables
    var cellData:CellModel?
    
    //MARK: Outlets
    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet var textField: UITextField!
    
    //MARK: View's LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: SetData
    func setData(model:CellModel) {
        cellData = model
        imgIcon.image = UIImage(named: model.imageName!)
        textField.placeholder = model.placeholder
        textField.text = model.userText
        
        textField.attributedPlaceholder = NSAttributedString(string: model.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: ColorConstants.TextColor, NSAttributedStringKey.font: FontScheme.kRegularFont(size: 14)])
    }
    
}
