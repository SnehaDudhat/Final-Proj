//
//  DateUtilities.swift
//  PTE
//
//  Created by CS-Mac-Mini on 26/09/17.
//  Copyright © 2017 CS-Mac-Mini. All rights reserved.
//

import UIKit

class DateUtilities: NSObject {
    
    //MARK: Constant
    
    static var formatter: DateFormatter { return DateFormatter() }
    
    struct DateFormates {
        static let kLongDate = "dd-MMM-yyyy h:mm a"
        static let kOnlyTime = "hh:mm"
        static let kRegularDate = "dd-MM-yyyy"
    }
    
    
    static func convertDateFromString(dateStr: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"//this your string date format
        let date = dateFormatter.date(from: dateStr)
        return date ?? Date()
    }
    
    static func convertDateFromStringWithFromate(dateStr: String, format : String = DateFormates.kRegularDate) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //this your string date format
        let date = dateFormatter.date(from: dateStr)
        return date!
    }
    
    static func convertStringfromDate(date: Date, formate:String = DateUtilities.DateFormates.kRegularDate) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.string(from: date)
    }
    
    static func convertStringDateintoStringWithFormat(dateStr : String, format : String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let myDate = dateFormatter.date(from: dateStr)
        
        dateFormatter.dateFormat = format
//        dateFormatter.timeZone = TimeZone.current
        let somedateString = dateFormatter.string(from: myDate!)
        return somedateString
    }
    
    static func secondsFromDate(date: Date) -> Int {
        
        let current = Date()
        let seconds = date.timeIntervalSince(current)
        return Int(seconds)
    }
}

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date? {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)
    }
    
}
