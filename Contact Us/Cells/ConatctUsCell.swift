//
//  ConatctUsCell.swift
//  AnkitGems
//
//  Created by Sierra on 25/04/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class ConatctUsCell: UITableViewCell {
    
    //MARK: Variables
    var cellData:ContactModel?
    let detailHeight = CGFloat(22)

    //MARK: Outlets
    @IBOutlet var vwLine: UIView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblCountry: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var btnTollfree: UIButton!
    @IBOutlet var btnPhone: UIButton!
    @IBOutlet var btnEmail: UIButton!
    @IBOutlet var btnFax: UIButton!
    @IBOutlet var btnWebsite: UIButton!
    
    @IBOutlet var imgFlag: UIImageView!
    @IBOutlet var vwAddress: UIView!
    @IBOutlet var vwTollfree: UIView!
    @IBOutlet var vwPhone: UIView!
    @IBOutlet var vwEmail: UIView!    
    @IBOutlet var vwFax: UIView!
    @IBOutlet var vwWebsite: UIView!
    
    //@IBOutlet var vwAddressHeight: NSLayoutConstraint!
    @IBOutlet var vwPhoneHeight: NSLayoutConstraint!
    @IBOutlet var vwTollfreeHeight: NSLayoutConstraint!
    @IBOutlet var vwEmailHeight: NSLayoutConstraint!
    @IBOutlet var vwFaxHeight: NSLayoutConstraint!
    @IBOutlet var vwWebsiteHeight: NSLayoutConstraint!
    
    
    //MARK: View's LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.drawDottedLine()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: SetData
    func setData(model:ContactModel) {
        
        cellData = model
        imgView.image = UIImage(named: model.image ?? "noImage")
        imgFlag.image = UIImage(named: model.country ?? "noImage")
        lblName.text = model.name
        lblCountry.text = model.country
        
        if model.address == "" {
            vwAddress.isHidden = true
            //vwAddressHeight.constant = 0
        } else {
            vwAddress.isHidden = false
            lblAddress.text = model.address
        }
        
        if model.tollfree == "" {
            vwTollfree.isHidden = true
            vwTollfreeHeight.constant = 0
        } else {
            vwTollfree.isHidden = false
            vwTollfreeHeight.constant = detailHeight
            btnTollfree.setTitle(model.tollfree, for: .normal)
        }
        
        if model.phoneNumber == "" {
            vwPhone.isHidden = true
            vwPhoneHeight.constant = 0
        } else {
            
            if model.till != "" {
                // model.phoneNumber  (till)  model.till
                btnPhone.setAttributedTitle(Utilities.changeStringColor(string: "\(model.phoneNumber ?? "") (till) \(model.till ?? "")", array: ["(till)"], colorArray: [ColorConstants.LightTextColor], arrFont: []), for: .normal)
            }
            else {
                if model.phoneNumber2 != "" {
                    // model.phoneNumber  /  model.phoneNumber2
                    
                    btnPhone.setAttributedTitle(Utilities.changeStringColor(string: "\(model.phoneNumber ?? "") / \(model.phoneNumber2 ?? "")", array: ["/"], colorArray: [ColorConstants.LightTextColor], arrFont: []), for: .normal)
                    
                }
                else {
                    btnPhone.setTitle(model.phoneNumber, for: .normal)
                }
            }
            vwPhone.isHidden = false
            vwPhoneHeight.constant = detailHeight
        }
        
        if model.email == "" {
            vwEmail.isHidden = true
            vwEmailHeight.constant = 0
        } else {
            vwEmail.isHidden = false
            vwEmailHeight.constant = detailHeight
             btnEmail.setTitle(model.email, for: .normal)
        }
        
        
        if model.fax == "" {
            vwFax.isHidden = true
            vwFaxHeight.constant = 0
        } else {
            vwFax.isHidden = false
            vwFaxHeight.constant = detailHeight
            btnFax.setTitle(model.fax, for: .normal)
        }
        
        if model.website == "" {
            vwWebsite.isHidden = true
            vwWebsiteHeight.constant = 0
        } else {
            vwWebsite.isHidden = false
            vwWebsiteHeight.constant = detailHeight
            btnWebsite.setTitle(model.website, for: .normal)
        }
    }
    
     //MARK: IBActions
    @IBAction func btnPhone_Clicked(_ sender: UIButton) {
        
        Utilities.call(phoneNumber: cellData?.phoneNumber ?? "")
    }
    
    @IBAction func btnTollfree_Clicked(_ sender: UIButton) {
        Utilities.call(phoneNumber: cellData?.tollfree ?? "")
    }
    
    @IBAction func btnEmail_Clicked(_ sender: UIButton) {
        Utilities.openEmail(email: cellData?.email ?? "")
    }
    
    @IBAction func btnFax_Clicked(_ sender: UIButton) {
        Utilities.call(phoneNumber: cellData?.fax ?? "")
    }
    
    @IBAction func btnWebsite_Clicked(_ sender: UIButton) {
        Utilities.openUrl(strUrl: "http://\(cellData?.website ?? "")")
    }
    
    // add dotted Line In vwLine View
    func drawDottedLine() {
        
        vwLine.layoutIfNeeded()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [1, 2] // 1 is the length of dash, 2 is length of the gap.
        
        let path = CGMutablePath()
        
        path.addLines(between: [CGPoint(x: vwLine.bounds.minX, y: vwLine.bounds.minY), CGPoint(x: AppConstants.ScreenSize.SCREEN_WIDTH - 32, y: vwLine.bounds.minY)])
        shapeLayer.path = path
        vwLine.layer.addSublayer(shapeLayer)
    }
}
