//
//  Utilities.swift
//  PTE
//
//  Created by CS-Mac-Mini on 09/08/17.
//  Copyright © 2017 CS-Mac-Mini. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVKit

struct PickerMediaType {
    
    static let image = kUTTypeImage as String
    static let video = kUTTypeMovie as String
}

class Utilities: NSObject {
  
    //MARK: Decorate view with border and corner radius
    class func decorateView(_ layer: CALayer, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor){
        
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    //MARK: NavigationBar
  
    static func setNavigationBar(controller : UIViewController,isHidden : Bool,title : String) {
        
        controller.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let attrs = [
            NSAttributedStringKey.foregroundColor: ColorConstants.ThemeColor,
            NSAttributedStringKey.font: UIFont(name: AppConstants.FontConstant.kRegular, size: 18)!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = attrs
        controller.navigationController?.isNavigationBarHidden = isHidden
        SlideNavigationController.sharedInstance().navigationBar.isHidden = isHidden
        SlideNavigationController.sharedInstance().navigationBar.barTintColor = ColorConstants.NavigationBarColor
        SlideNavigationController.sharedInstance().navigationBar.tintColor = ColorConstants.ThemeColor
        controller.title = title
        
    }
    
    //Get Celll Data
    
    //Get Model
    
    class func getModelForSearch(text : String?,type : CellType,dataArr : [Any]) -> CellModel {
        
        let model = CellModel()
        model.placeholder = text
        model.cellType = type
        model.dataArr = dataArr
        return model
    }
    
    class func getModelForFromTo(text : String?,type : CellType,from : String?,to : String?) -> CellModel {
        
        let model = CellModel()
        model.placeholder = text
        model.cellType = type
        model.from = from
        model.to = to
        return model
    }
    
    class func getModel(text : String?,imageName:String?,keyboardType:UIKeyboardType? = .default,isSelected:Bool = false,type : CellType) -> CellModel {
        
        let model = CellModel()
        model.placeholder = text
        model.imageName = imageName
        model.cellType = type
        model.keyboardType = keyboardType
        model.isSelected = isSelected
        return model
    }
    
    class func getModel(text : String? = nil, imageName:String? = nil, keyboardType:UIKeyboardType? = .default, type : CellType, cellObj : Any) -> CellModel {
        
        let model = CellModel()
        model.placeholder = text
        model.imageName = imageName
        model.cellType = type
        model.keyboardType = keyboardType
        model.cellObj = cellObj
        return model
    }
    
    class func getModel(placeholder : String? = nil, text : String? = nil,type : CellType,imageName:String? = nil,dataArr : [Any] = [Any]()) -> CellModel {
        
        let model = CellModel()
        model.placeholder = placeholder
        model.userText = text
        model.cellType = type
        model.imageName = imageName
        if dataArr.count > 0
        {
            model.dataArr = dataArr
        }
        
        return model
    }
 
    class func getModelForProfile(text : String?,imageName:String?,keyboardType:UIKeyboardType?,type : CellType,userText:String?) -> CellModel {
        
        let model = CellModel()
        model.placeholder = text
        model.imageName = imageName
        model.cellType = type
        model.userText = userText
        model.keyboardType = keyboardType
        return model
    }
    
    //MARK: Shadow Effect View
    
    class func applyLoginShadowEffect(view: UIView){
        
        view.layer.shadowColor   = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset  = CGSize(width: 0, height: 60)
        view.layer.shadowRadius  = 35.0
        view.layer.shadowOffset  = CGSize.zero
    }
  
    class func applyTopShadow(view: UIView){
        
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        //view.layer.shadowRadius = 2.0
    }
    
    class func applyBottomShadow(view: UIView){
        
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        //view.layer.shadowRadius = 2.0
    }
    
    class func applyShadow(view: UIView){
//
//        view.layer.shadowColor = UIColor.lightGray.cgColor
//        view.layer.shadowOpacity = 0.6
//        view.layer.shadowOffset = CGSize(width: -1, height: 1)
//        view.layer.shadowRadius = 2.0
//
        view.layer.shadowColor = ColorConstants.ShadowColor.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 2.0
    }
    
    class func convertToDollar(number : Double) -> String {

        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.currencyCode = "USD"
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        return currencyFormatter.string(from: NSNumber(value: number))!
    }
  
    class func showValueWithPer(dis : Double) -> String{
        
        let disValue = String(format: "%0.2f",dis)
        if disValue != "0.0" && disValue != "0.00"{
            
            return "\(disValue) %"
        }
        
        return "-"
    }
    //MARK: Text Height
    
    class func getLabelHeight(constraintedWidth width: CGFloat, font: UIFont,text:String) -> CGFloat {
        
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = text
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
    
    class func getLabelWidth(constraintedheight: CGFloat, font: UIFont,text:String) -> CGFloat {
        
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: .greatestFiniteMagnitude, height: constraintedheight))
        label.numberOfLines = 1
        label.text = text
        label.font = font
        label.sizeToFit()
        
        return label.frame.width
    }
    
    class func getDocumentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func loadImage(_ imageName: String) -> UIImage {
        
        return UIImage(contentsOfFile: imageName) ?? #imageLiteral(resourceName: "image_Chat")
    }
        
    //MARK: Get UIColor from hex color
  
    static func colorWithHexString (hex:String) -> UIColor {
      var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      
      if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
      }
      
      if ((cString.count) != 6) {
        return UIColor.gray
      }
      
      var rgbValue:UInt32 = 0
      Scanner(string: cString).scanHexInt32(&rgbValue)
      
      return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
      )
    }
  
    //MARK:- Show Alert View
    
    class func showAlertView(title: String?, message: String?) {
      
        let alert = UIAlertController(title: AppConstants.appName, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: StringConstants.KOk, style: .default, handler: nil))
        UIViewController.current().present(alert, animated: true, completion: nil)
    }
    
    class func showAlertWithButtonAction(title: String,message:String,buttonTitle:String,onOKClick: @escaping () -> ()){
      
        let alert = UIAlertController(title: AppConstants.appName, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { action in
            onOKClick()
        }))
      
        UIViewController.current().present(alert, animated: true, completion: nil)
    }
   
    class func showAlertWithTwoButtonAction(title: String,message:String,attributedMessage: NSAttributedString?,buttonTitle1:String,buttonTitle2:String,onButton1Click: @escaping () -> (),onButton2Click: @escaping () -> ()){
        
        let alert = UIAlertController(title: AppConstants.appName, message: message, preferredStyle: UIAlertControllerStyle.alert)
        if attributedMessage != nil {
            alert.setValue(attributedMessage, forKey: "attributedTitle")
        }
        alert.addAction(UIAlertAction(title: buttonTitle1, style: .default, handler: { action in
            onButton1Click()
        }))
        
        alert.addAction(UIAlertAction(title: buttonTitle2, style: .default, handler: { action in
            onButton2Click()
        }))
        
        UIViewController.current().present(alert, animated: true, completion: nil)
    }
    
    //MARK: Call
    class func call(phoneNumber: String)
    {
        let trimPhone = phoneNumber.replacingOccurrences(of: " ", with: "")
        if  let url = URL(string: "tel://\(trimPhone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    //MARK: Open mail
    class func openEmail(email: String)
    {
        if let url = URL(string: "mailto:\(email)")  {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    //MARK: Open URL in Safari
    
    class func openUrl(strUrl:String)
    {
        let url = URL(string: strUrl)
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options:[:], completionHandler: nil)
        }
    }
    
    //MARK: Device Unique ID
    
    class func getDeviceUniqueID() -> String{
        
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    //MARK: Open Date Picker
    class func openDatePicker(datePicker:GMDatePicker, delegate:GMDatePickerDelegate,selectedDate : Date)
    {
        datePicker.delegate = delegate
        datePicker.config.startDate = selectedDate
        datePicker.config.animationDuration = 0.5
        datePicker.config.cancelButtonTitle = "Cancel"
        datePicker.config.confirmButtonTitle = "Done"
        datePicker.config.contentBackgroundColor = UIColor(red: 253/255.0, green: 253/255.0, blue: 253/255.0, alpha: 1)
        datePicker.config.headerBackgroundColor = ColorConstants.ThemeColor
        datePicker.config.confirmButtonColor = .white
        datePicker.config.cancelButtonColor = .white
        datePicker.config.confirmButtonFont = FontScheme.kBoldFont(size: 18)
        datePicker.config.cancelButtonFont = FontScheme.kBoldFont(size: 18)
        datePicker.show(inVC: UIViewController.current())
    }
    
    //MARK: Imagepicker controller
    class func open_galley_or_camera(delegate : UIImagePickerControllerDelegate,mediaType:[String]){
        
        let actionSheetController: UIAlertController = UIAlertController(title: "Choose option", message: nil, preferredStyle: .actionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Camera", style: .default) { action -> Void in
            if(  UIImagePickerController.isSourceTypeAvailable(.camera))
                
            {
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = (delegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
                myPickerController.sourceType = .camera
                myPickerController.mediaTypes = mediaType
                SlideNavigationController.sharedInstance().present(myPickerController, animated: true, completion: nil)
            }
            else
            {
                let actionController: UIAlertController = UIAlertController(title: "Camera is not available",message: "", preferredStyle: .alert)
                let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void     in
                    //Just dismiss the action sheet
                }
                
                actionController.addAction(cancelAction)
                SlideNavigationController.sharedInstance().present(actionController, animated: true, completion: nil)
                
            }
        }
        actionSheetController.addAction(takePictureAction)
        
        //Create and add a second option action
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Gallery", style: .default) { action -> Void in
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = (delegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate);
            myPickerController.sourceType = .photoLibrary
            myPickerController.mediaTypes = mediaType
            
            SlideNavigationController.sharedInstance().present(myPickerController, animated: true, completion: nil)
        }
        actionSheetController.addAction(choosePictureAction)
        
        //Present the AlertController
        SlideNavigationController.sharedInstance().present(actionSheetController, animated: true, completion: nil)
        
    }
  
    //MARK: Videopicker controller
    class func openVideoPicker(delegate : UIImagePickerControllerDelegate){
        
        let actionSheetController: UIAlertController = UIAlertController(title: "Choose option", message: nil, preferredStyle: .actionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Camera", style: .default) { action -> Void in
            if(  UIImagePickerController.isSourceTypeAvailable(.camera))
                
            {
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = (delegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
                myPickerController.sourceType = .camera
                myPickerController.mediaTypes = [kUTTypeMovie as String]
                SlideNavigationController.sharedInstance().present(myPickerController, animated: true, completion: nil)
            }
            else
            {
                let actionController: UIAlertController = UIAlertController(title: "Camera is not available",message: "", preferredStyle: .alert)
                let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void     in
                    //Just dismiss the action sheet
                }
                
                actionController.addAction(cancelAction)
                SlideNavigationController.sharedInstance().present(actionController, animated: true, completion: nil)
                
            }
        }
        actionSheetController.addAction(takePictureAction)
        
        //Create and add a second option action
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Gallery", style: .default) { action -> Void in
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = (delegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate);
            myPickerController.sourceType = .photoLibrary
            myPickerController.mediaTypes = [kUTTypeMovie as String]
            
            SlideNavigationController.sharedInstance().present(myPickerController, animated: true, completion: nil)
        }
        actionSheetController.addAction(choosePictureAction)
        
        //Present the AlertController
        SlideNavigationController.sharedInstance().present(actionSheetController, animated: true, completion: nil)
        
    }
    
    //MARK: Change Color
    class func changeStringColor(string : String, array : [String], colorArray : [UIColor],arrFont:[UIFont]) ->  NSAttributedString {
        
        let attrStr = NSMutableAttributedString(string: string)
        let inputLength = attrStr.string.count
        let searchString = array

        for i in 0...searchString.count-1
        {
            
            let string  = searchString[i]
            let searchLength = string.count
            var range = NSRange(location: 0, length: attrStr.length)
            
            while (range.location != NSNotFound) {
                range = (attrStr.string as NSString).range(of: string, options: [], range: range)
                if (range.location != NSNotFound) {
                    
                    if colorArray.count > 0{
                        attrStr.addAttribute(NSAttributedStringKey.foregroundColor, value: colorArray[0], range: NSRange(location: range.location, length: searchLength))
                    }
                    
                    if arrFont.count > 0{
                        attrStr.addAttribute(NSAttributedStringKey.font, value: arrFont[0], range: NSRange(location: range.location, length: searchLength))
                    }
                    
                    range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
                    return attrStr
                }
            }
        }
        
        return NSAttributedString()
    }
    
//    //MARK: Sorting Command
    class func getSortingCommand(model:CellModel) -> String{
        switch model.cellType  {
        case .DSDefault?:
            return ""
        
        case .DSNewDiamond?:
            return "1"
       
        case .DSPriceLowToHigh?:
            return "2"
        
        case .DSPriceHighToLow?:
            return "3"
        
        case .DSSortWithColor?:
            return "8"
       
        case .DSSortWithClarity?:
            return "9"
        
        case .DSCaratLowToHigh?:
            return "4"
       
        case .DSCaratHighToLow?:
            return "5"
        
        case .DSDiscountLowToHigh?:
            return "6"
        
        case .DSDiscountHighToLow?:
            return "7"
        
        default:
            
            return ""
        }
    }
    
}

