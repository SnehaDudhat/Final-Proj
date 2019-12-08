//
//  DiamondTypeCell.swift
//  AnkitGems
//
//  Created by CS-Mac-Mini on 04/05/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class DiamondTypeCell: UICollectionViewCell {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgDiamond: UIImageView!
    @IBOutlet weak var lblTitle: MMLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewMain.dropShadow()
        viewMain.layer.cornerRadius = 4.0
    }
    
    func setCellData(model:CellModel){
        
        lblTitle.text = model.placeholder
        imgDiamond.image = UIImage.init(named: model.imageName ?? "diamondMenu")
        viewMain.backgroundColor = ColorConstants.DashboardDiamondColor.withAlphaComponent(0.5)
    }

}

