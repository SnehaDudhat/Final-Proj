//
//  ExtensionClass.swift
//  PTE
//
//  Created by CS-Mac-Mini on 10/08/17.
//  Copyright © 2017 CS-Mac-Mini. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    
    /// Append string to NSMutableData
    ///
    /// Rather than littering my code with calls to `dataUsingEncoding` to convert strings to NSData, and then add that data to the NSMutableData, this wraps it in a nice convenient little extension to NSMutableData. This converts using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `NSMutableData`.
    
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

//MARK: UIView IBInspactable
extension UIView {

    @IBInspectable
    var BackgroundColorKey: NSString   {
        
        get {
            return  "nil"
        }
        
        set {
            backgroundColor = ColorScheme.colorFromConstant(textColorConstant: newValue as String)
        }
    }
    
    @IBInspectable
    var BorderColorKey: NSString   {

        get {
            return  "nil"
        }

        set {
            layer.borderColor = ColorScheme.colorFromConstant(textColorConstant: newValue as String).cgColor
        }
    }
    
    //MARK: giving corner from particular side
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat ,width : CGFloat) {
        let frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        let path = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UILabel{
    
    @IBInspectable
    var TextColorKey: NSString   {
        
        get {
            return  "nil"
        }
        
        set {
            textColor = ColorScheme.colorFromConstant(textColorConstant: newValue as String)
        }
    }
    
    //MARK: Attaributes textColor change
    func ChangeColorofParticularCharatcerInString(array : NSArray, color : Array<Any>){
        let attrStr = NSMutableAttributedString(string:  self.text!)
        let inputLength = attrStr.string.count
        let searchString : NSArray = array
        let color = color
        for i in 0...searchString.count-1
        {
            
            let string : String = searchString.object(at: i) as! String
            let searchLength = string.count
            var range = NSRange(location: 0, length: attrStr.length)
            
            while (range.location != NSNotFound) {
                range = (attrStr.string as NSString).range(of: string, options: [], range: range)
                if (range.location != NSNotFound) {
                    attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: color[i], range: NSRange(location: range.location, length: searchLength))
                    range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
                    self.attributedText = attrStr
                }
            }
        }
    }
}

extension UIButton{
    
    @IBInspectable
    var TextColorKey: NSString   {
        
        get {
            return  "nil"
        }
        
        set {

            setTitleColor(ColorScheme.colorFromConstant(textColorConstant: newValue as String), for: .normal)
        }
    }
}



extension UITextField{
    
    @IBInspectable
    var PlaceHolderColorKey: NSString   {
        
        get {
            return  "nil"
        }
        
        set {
            
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: ColorScheme.colorFromConstant(textColorConstant: newValue as String)])
        }
    }
}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    func dropShadow() {
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 2.0
        
    }
    
    // set Corner Radius
    func setCornerRadius(radius:CGFloat)
    {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    // set Corner Radius
    func setBorderWidth(width : CGFloat)
    {
        self.layer.borderWidth = width
        self.layer.masksToBounds = true
    }
    
    // set Corner Radius
    func setBorderColor(color:UIColor)
    {
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }
    
    // MARK: Show Confirmation Popup
    func showConfirmationPopup(title: String,message:String,cancelButtonTitle:String, confirmButtonTitle:String,height : CGFloat,onConfirmClick: @escaping () -> (), onCancelClick: @escaping () -> ()){
        
        self.window?.rootViewController?.view.endEditing(true)
        
        let vc = ConfirmPopupVC(nibName: "ConfirmPopupVC", bundle: nil)
        vc.headerTitle = title
        vc.message = message
        vc.cancelButtonTitle = cancelButtonTitle
        vc.confirmButtonTitle = confirmButtonTitle
        vc.confirmClicked = {
            onConfirmClick()
        }
        
        vc.cancelBtnClicked = {
            onCancelClick()
        }
        
        let formsheet : MZFormSheetController = MZFormSheetController(viewController: vc) as MZFormSheetController
        formsheet.presentedFormSheetSize = CGSize(width: AppConstants.ScreenSize.SCREEN_WIDTH - 50, height: height)
        formsheet.shadowRadius = 2.0
        formsheet.shadowOpacity = 0.3
        formsheet.shouldDismissOnBackgroundViewTap = false
        formsheet.shouldCenterVertically = true
        formsheet.cornerRadius = 5
        formsheet.shouldDismissOnBackgroundViewTap = true
        formsheet.transitionStyle = .bounce
        
        UIViewController.current().mz_present(formsheet, animated: true, completionHandler: nil)
    }
    
    func loadAPIFailedView(onRefreshClick: @escaping () -> ()) {
        
        self.window?.rootViewController?.view.endEditing(true)
        
        let APIFailedView = Bundle.main.loadNibNamed("LoadAPIFailedView", owner: self, options: nil)?[0] as! LoadAPIFailedView
        APIFailedView.message = "No Data Found"
        APIFailedView.center = self.center
        APIFailedView.btnRefreshClick = {()
            onRefreshClick()
        }
        
        
       self.addSubview(APIFailedView)
        
    }
    
    func removeLoadAPIFailedView() {
      
        for vw in self.subviews{
            if let myvw = vw as? LoadAPIFailedView {
                myvw.removeFromSuperview()
            }
        }
        
    }
 
    func loadNoDataFoundView(withMessage:String) {
        
        self.window?.rootViewController?.view.endEditing(true)
        
        let APIFailedView = Bundle.main.loadNibNamed("LoadAPIFailedView", owner: self, options: nil)?[0] as! LoadAPIFailedView
        APIFailedView.isShowRefreshButton = false
        APIFailedView.message = withMessage
        APIFailedView.center = self.center
        
        var isFound = false
        for vw in self.subviews{
            
            if vw is LoadAPIFailedView{
                
                isFound = true
            }
        }
        
        if !isFound{
            self.addSubview(APIFailedView)
        }
    }
    
    //ShowPopup
    func showBottomPopup(subView:UIView,height:CGFloat) {
        
        let window = UIApplication.shared.keyWindow!
        let actionSheetPopupVW = Bundle.main.loadNibNamed("BottomActionSheetPopup", owner: self, options: nil)?[0] as! BottomActionSheetPopup
        
        actionSheetPopupVW.frame = CGRect(x: window.frame.origin.x, y: window.frame.origin.y, width: window.frame.width, height: (AppConstants.ScreenSize.SCREEN_HEIGHT == 812 ? window.frame.height - 34 : window.frame.height))
        
        subView.frame = CGRect(x: 0, y: actionSheetPopupVW.frame.size.height, width: actionSheetPopupVW.frame.size.width, height: height)
        
        subView.roundCorners([.topLeft,.topRight], radius: 15)
        actionSheetPopupVW.addSubview(subView)
        UIView.animate(withDuration: 0.3) {
            
            subView.transform = CGAffineTransform(translationX: 0, y: -height)
        }
        window.addSubview(actionSheetPopupVW)
    }
    
    //ShowTextFiled PopUp
    func showTextFiledTitlePopup(title: String,placeHolder : String,text : String?,onConfirmClick: @escaping (_ text: String) -> ()){
        
        self.window?.rootViewController?.view.endEditing(true)
        let vc  = Bundle.main.loadNibNamed("TitleTextFieldPopUp", owner: self, options: nil)?[0] as! TitleTextFieldPopUp
        vc.placeHolder = placeHolder
        vc.titlePopUp = title
        vc.textFieldText = text
        vc.initialConfig()
        vc.frame = UIScreen.main.bounds
        vc.okClick = { text in
            onConfirmClick(text)
        }
        UIApplication.shared.keyWindow?.addSubview(vc)
    }
    
    func addshadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat = 2.0) {
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.6
        
        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = -5
        var viewWidth = self.frame.width
        var viewHeight = self.frame.height+2
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
}

extension UITableView {
   
    func addScrollToTopButton(){
        
        //let btn = UIButton(frame: CGRect(x: self.frame.size.width - 60, y: self.frame.size.height - 50, width: 70, height: 50))
        let btn = UIButton(frame: CGRect(x: AppConstants.ScreenSize.SCREEN_WIDTH - 60, y: AppConstants.ScreenSize.SCREEN_HEIGHT - 250, width: 70, height: 50))
        btn.tag = 1002
        btn.isHidden = true
        btn.addTarget(self, action: #selector(self.btnScroll(_:)), for: .touchUpInside)
        btn.setImage(#imageLiteral(resourceName: "UpScroll"), for: .normal)
        UIViewController.current().view.addSubview(btn)
    }
    
    @objc func btnScroll(_ sender: UIButton){
        
       self.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func handleScrollPosition(scrollView: UIScrollView){
        
        if scrollView.contentOffset.y > AppConstants.Scroll.position {
            
            let btn = (UIViewController.current() as AnyObject).view.viewWithTag(1002)
            btn?.isHidden = false
        }
        else{
            
            let btn = UIViewController.current().view.viewWithTag(1002)
            btn?.isHidden = true
        }
    }
}

