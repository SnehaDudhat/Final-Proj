//
//  CFTextViewCell.swift
//  AnkitGems
//
//  Created by Sierra on 26/04/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class CFTextViewCell: UITableViewCell {

    //MARK: Variables
    var cellData:CellModel?
    
    //MARK: Outlets
    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet var textView: UITextView!
    
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
        
        if let text = model.userText, text.count > 0 {
            textView.text = model.userText
        }
        else {
            textView.text = cellData?.placeholder
        }
        textView.textColor = ColorConstants.TextColor
        textView.font = FontScheme.kRegularFont(size: 14)
        textView.alignTextVerticallyInContainer()
       
    }
}
//MARK: UITextView's Delegate Methods
extension CFTextViewCell: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == cellData?.placeholder {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = cellData?.placeholder
            textView.textColor = ColorConstants.TextColor
        }
    }
}


