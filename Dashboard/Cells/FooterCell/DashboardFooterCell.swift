//
//  DashboardFooterCell.swift
//  AnkitGems
//
//  Created by CS-Mac-Mini on 24/05/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class DashboardFooterCell: UITableViewCell {

    @IBOutlet weak var vwMain: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        vwMain.dropShadow()
        vwMain.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func button_Click(_ sender: UIButton) {
        
        switch sender.tag {
        case 11:
            
            let vc = PaymentInstructionVC(nibName: "PaymentInstructionVC", bundle: nil)
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            
            break
        case 12:
            
            let vc = AboutUsVc(nibName: "AboutUsVc", bundle: nil)
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            
            break
        case 13:
            
            let vc = ContactVC(nibName: "ContactVC", bundle: nil)
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            
            break
        case 14:
            
            let vc = FeedbackVC(nibName: "FeedbackVC", bundle: nil)
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            
            break
        default:
            print("")
        }
    }
}
