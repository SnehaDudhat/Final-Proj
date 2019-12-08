//
//  SalesPersonCell.swift
//  kiranDiamond
//
//  Created by CS-Mac-Mini on 12/04/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class SalesPersonCell: UITableViewCell {

    @IBOutlet weak var lblName: MMLabel!
    @IBOutlet weak var lblEmail: MMLabel!
    @IBOutlet weak var lblPhone: MMLabel!
    @IBOutlet weak var vwMain: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        vwMain.dropShadow()
        vwMain.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnEmail_Click(_ sender: UIButton) {
        
         Utilities.openEmail(email: lblEmail.text!)
    }
    
    @IBAction func btnContact_Click(_ sender: UIButton) {
        
        Utilities.call(phoneNumber: lblPhone.text!)
    }
    
//    func setCellData(model:DashboardModel){
//
//        lblName.text = model.arrSalesPerson?.first?.AccountManagerName ?? ""
//        lblEmail.text = model.arrSalesPerson?.first?.EmailId ?? ""
//        lblPhone.text = model.arrSalesPerson?.first?.MobileNo ?? ""
//    }
}
