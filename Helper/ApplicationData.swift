//
//  ApplicationData.swift
//  MeditabSwiftArchitecture
//
//  Created by Rushi on 23/05/17.
//  Copyright © 2017 Meditab. All rights reserved.
//

import UIKit

/** This singleton class is used to store application level data. */
class ApplicationData: NSObject {

    // A Singleton instance
    static let sharedInstance = ApplicationData()
    
    // Checks if user is logged in
    static var isUserLoggedIn: Bool {
        get {
            return Defaults.bool(forKey: AppConstants.UserDefaultKey.isUserLoggedIn)
        }
    }
    
    // returns logged in user's information
    static var user: UserInfoModel {
        get {
            return Defaults[.userInfo] ?? UserInfoModel()
        }
    }
    
    // returns Current Time Zone
    static var timeZone: String {
        get {
            let timeZone = NSTimeZone.local
            return timeZone.localizedName(for: .standard, locale: .current) ?? ""
        }
    }
    
    //retun device Name
    static var deviceName: String {
        get {
            return UIDevice.current.localizedModel
        }
    }
    
    //retun device version
    static var deviceVersion: String {
        get {
            return UIDevice.current.systemVersion
        }
    }
    
    static var ipAddress : String {
        
        get {
            
            var address : String?
            
            // Get list of all interfaces on the local machine:
            var ifaddr : UnsafeMutablePointer<ifaddrs>?
            guard getifaddrs(&ifaddr) == 0 else { return "" }
            guard let firstAddr = ifaddr else { return "" }
            
            // For each interface ...
            for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
                let interface = ifptr.pointee
                
                // Check for IPv4 or IPv6 interface:
                let addrFamily = interface.ifa_addr.pointee.sa_family
                
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    // Check interface name:
                    let name = String(cString: interface.ifa_name)
                    
                    if  name == "en0" || name == "pdp_ip0"  {
                        
                        // Convert interface address to a human readable string:
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                    &hostname, socklen_t(hostname.count),
                                    nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
            return address ?? ""
        }
    }
    
    
    /// Default headers to be passed in CenterAPI requests
    var authorizationHeaders: HTTPHeaders {
        
        get{
            var headers: HTTPHeaders = [:]
            if ApplicationData.isUserLoggedIn{
                headers = [NetworkClient.Constants.HeaderKey.Authorization:"Bearer \(ApplicationData.user.accessToken!)"]
            }
            return headers
        }
    }
    
    // Logout User
     func logoutUser()
    {
        // user default clear
        UserDefaults.removeAllData()

        // redirect to Login Screen
        let vc  = LoginVC(nibName: "LoginVC", bundle: nil) as LoginVC
        SlideNavigationController.sharedInstance().popAllAndSwitch(to: vc, withCompletion: nil)
    }
}
