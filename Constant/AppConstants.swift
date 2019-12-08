//
//  AppConstants.swift
//  kiranDiamond
//
//  Created by Coruscate on 28/02/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
  
    static let databaseName                         = "BaseDemo"
    static let serverURL                            = "http://103.54.98.205:8089" //Live
//    static let serverURL                            = "http://192.168.0.101:8056" //Local
//     static let serverURL                            = "http://192.168.0.150:8056" //Local
    static let appName                              = "Base Demo"
    static let startingDate                         = "1970-01-01T00:00:00.000Z"
    
    //MARK:  API
    struct URL {
        
        static let Login                            = "/appuser/logincheck"
        static let ForgotPassword                   = "/appuser/forgotpassword"
        static let MasterSync                       = "/appmaster/getmasterdata"
        static let SaveSearch                       = "/appstock/insertfilters"
        static let SearchList                       = "/appstock/selectallfilter"
        static let SavedSearchList                  = "/appstock/selectfilterlist"
        static let DiamondList                      = "/appstock/stockdetail"
        static let NewArrival                      = "/appstock/newarrival"
        static let GetBPFList                       = "/appstock/bpfstockdetail"
        static let GetHappyHoursList                = "/appstock/happyhoursstockdetail"
        static let GetBidingList                    = "/appstock/biddingstockdetail"
        static let GetCartANDWatchListData          = "/appcartwatchlistdetail/selectall"
        static let AddToCartANDWatchList            = "/appcartwatchlistdetail/insert"
        static let RemoveFromCartANDWatchList       = "/appcartwatchlistdetail/delete"
        static let DemandList                       = "/appdemand/selectall"
        static let DemandDelete                     = "/appdemand/delete"
        static let AddOffer                         = "/appoffer/insert"
        static let DeleteOffer                      = "/appoffer/delete"
        static let GetOfferData                     = "/appoffer/selectall"
        static let MyPurchase                       = "/appmemo/selectallmemo"
        static let MyPurchaseDetail                 = "/appmemo/selectallpacketdetails"
        static let MyPurchaseDelete                 = "/appmemo/cancelmemoitem"
        static let AddBPFHHBid                      = "/appmarketingselection/insert"
        static let UserProfile                      = "/appaccount/userprofile"
        static let UpdateProfile                    = "/appaccount/update"
        static let ChangePassword                   = "/appuser/changepassword"
        static let GetMyBPFBIDHappy                 = "/appmarketingselection/selectall"
        static let DeleteMyBPFBIDHappy              = "/appmarketingselection/delete"
        static let GetQuickSearchData               = ""
        
    }
    
    struct Notification {
    
        static let MasterSyncSuccessNotification    = "MasterSyncSuccessNotification"
    }
    
    struct Scroll{
        static let position                         = AppConstants.ScreenSize.SCREEN_HEIGHT - 300
    }
    
    //MARK:  User Default
    struct UserDefaultKey {
        
        static let isUserLoggedIn                    = "isUserLoggedIn"
        static let userInfo                          = "userInfo"
        static let tokenKey                          = "token"
    }
    
    //MARK: Master Request Key
    struct MasterSyncKeys {

        static let SHAPE                   = "SHAPE"
        static let COLOR                   = "COLOR"
        static let FANCYCOLOR              = "FANCYCOLOR"
        static let CLARITY                 = "CLARITY"
        static let LAB                     = "LAB"
        static let CUT                     = "CUT"
        static let POLISH                  = "POLISH"
        static let SYMMETRY                = "SYMMETRY"
        static let FLUORESCENCE            = "FLUORESCENCE"
        static let COUNTRY                 = "COUNTRY"
        static let OVERTONE                = "OVERTONE"
        static let INTENSITY               = "INTENSITY"
        static let CULET                   = "CULET"
        static let GIRDLE                  = "GIRDLE"
        static let SIEVES                  = "SIEVES"
        static let HANDA                   = "H&A"
        static let MILKY                   = "MILKY"
        static let NATTS                   = "NATTS"
        static let SHADE                   = "SHADE"
        static let EFFM                    = "EFFM"
        static let EFCM                    = "EFCM"
    }

    //MARK: Sync Date
    struct SyncDate {
        
        static let MasterSyncDate                   = "MasterSyncDate"
    }
    
    //MARK:  Font Constant
    struct FontConstant {
        
        static let kBold                            = "AVERTA-BOLD"
        static let KLight                           = "AVERTA-LIGHT"
        static let kRegular                         = "AVERTA-REGULAR"
        static let KSemiBold                        = "AVERTA-SEMIBOLD"
    }
    
    struct PageLimit{
        static let page                             = 1
        static let limit                            = 50
        static let Cartlimit                        = 5000
    }
    
    struct MyPurchaseStatus{
        static let Pending                             = 1
        static let Approved                            = 2
        static let Cancel                              = 3
    }
    
    
    
    //MARK: Device Constant
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize 
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad
    }
}

