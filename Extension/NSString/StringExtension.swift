//
//  StringExtension.swift
//  MeditabSwiftArchitecture
//
//  Created by Rushi on 24/05/17.
//  Copyright © 2017 Meditab. All rights reserved.
//

import Foundation

extension String {
    
    func toDouble() -> Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.number(from: self) as? Double
    }

    func formatValue() -> String {
       
        let value = Double(self) ?? 0.0
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        let formattedAmount = formatter.string(from: value as NSNumber)
        if formattedAmount == "0.00"{
            return "-"
        }
        return formattedAmount ?? "-"
    }
    
    func isNumeric() -> Bool {
        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
        return  !hasLetters && hasNumbers
    }
    
    /// Check for Password validation
    func isValidPassword() -> Bool {
        
        let regExpression = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%!&*]).{8,20})"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return predicate.evaluate(with:self)
    }
    
    /// Check for email validation
    func isValidEmail() -> Bool {
        
        let regExpression = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return predicate.evaluate(with:self)
    }
 
    /// Check for mobile validation
    func isValidMobileNumber() -> Bool{
        
        let phoneRegex: String = "^[0-9]{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phoneTest.evaluate(with: self) {
            if CInt(self) != 0 {
                return true
            }
        }
        return false
    }
    
    /// Check for pan validation
    func isValidPANNumber() -> Bool{
        
        let regExpression = "^[A-Z]{5}+[0-9]{4}+[A-Z]{1}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return predicate.evaluate(with:self)
    }
    
    /// Check for aadhar card validation
    func isValidAadharNumber() -> Bool{
        
        let phoneRegex: String = "^[0-9]{12}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phoneTest.evaluate(with: self) {
            if CInt(self) != 0 {
                return true
            }
        }
        return false
    }
    
    /// Remove white spaces (front and rear) from string
    func removeWhiteSpaces () -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Remove UnderScore
    func removeUnderScore () -> String {
        var str = self
        if str.lowercased().range(of:"_") != nil {
            str = str.replacingOccurrences(of: "_", with: " ")
        }
        return str.localizedCapitalized
    }
    
    /// Check if value is 0/1 or Yes/No or Y/N
    func boolValue() -> Bool {
        
        switch self {
        case "True", "true", "yes", "Yes", "1":
            return true
        case "False", "false", "no", "No", "0":
            return false
        default:
            return false
        }
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[Range(start ..< end)])
    }
    
    /// Get document directory path url for given string
    static func documentDirectoryPath(forFileName name:String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentPath = paths.first! as NSString
        return documentPath.appendingPathComponent(name) as String
    }
    
    func isVideo() -> Bool {
        
        if self.fileExtension().lowercased() == "webm" || self.fileExtension().lowercased() == "mkv" || self.fileExtension().lowercased() == "3gp" || self.fileExtension().lowercased() == "m4v" || self.fileExtension().lowercased() == "mp4" || self.fileExtension().lowercased() == "mov" {
            
            return true
        }
        
        return false
    }
    
    func fileExtension() -> String {
        
        if let fileExtension = NSURL(fileURLWithPath: self).pathExtension {
            return fileExtension
        } else {
            return ""
        }
    }
    
    func fileName() -> String {
        
        if let fileNameWithoutExtension = NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent {
            return fileNameWithoutExtension
        } else {
            return ""
        }
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}

// Set Color for Specific string inside string
extension NSMutableAttributedString{

    func setColorForText(_ textToFind: String, with color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
        }
    }
    
    func setFontForText(_ textToFind: String, with font: UIFont) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSAttributedStringKey.font, value: font, range: range)
        }
    }
}
