//
//  UserDefaultExtension.swift
//  QuickCap
//
//  Created by Rahul Srivastava on 29/05/17.
//  Copyright © 2017 Rahul Srivastava. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

extension UserDefaults {
    
    /* UserModel Default Keys */
    subscript(key: DefaultsKey<UserInfoModel?>) -> UserInfoModel? {
        get { return unarchive(key) }
        set { archive(key, newValue) }
    }
    
    static func removeAllData() {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
}

// MARK: - Default keys
extension DefaultsKeys {
    
    static let isUserLoggedIn      = DefaultsKey<Bool>(AppConstants.UserDefaultKey.isUserLoggedIn)
    
    // User models
    static let userInfo            = DefaultsKey<UserInfoModel?>(AppConstants.UserDefaultKey.userInfo)
    
    // Stock SyncDate
    static let MasterSyncDate           = DefaultsKey<String?>(AppConstants.SyncDate.MasterSyncDate)
}

