//
//  StringConstants.swift
//  kiranDiamond
//
//  Created by Coruscate on 28/02/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

///// DO NOT CHANGE ANY CONSTANT WITHOUT DISCUSSION OF TEAM ///////////

import Foundation

struct StringConstants {
    
    ///// DO NOT CHANGE ANY CONSTANT WITHOUT DISCUSSION OF TEAM ///////////
    
    static let KOk                                      = "OK"
    static let KCancel                                  = "Cancel"
    static let KDelete                                  = "Delete"
    static let KNoDataFound                             = "No Data Found"
   
    struct EmptyMessage {
        
        //Login
        static let kUsernameMessage         = "Please enter username."
        static let kPasswordMessage         = "Please enter password."
        
        //Forgot Password
        static let kEmailMessage            = "Please enter email."
        
        //Filter
        static let kWrongFromValue          = "From value should be lessthan To value."
        static let kWrongToValue            = "To value should be greaterthan From value."
        static let kBPFEmpty                = "Please select for the search"
        
        //Title PopUp
        static let kTitleMessage            = "Please enter title."
        
        //Feedback Screen
        static let kFeedbackMessage         = "Please enter feedback."
        
        static let logoutMessage            = "Are you sure you want to logout?"
        
        //Change Password
        static let kOldPasswordMessage         = "Please enter old password."
        static let kNewPasswordMessage         = "Please enter new password."
        static let kConfirmPasswordMessage     = "Please enter confirm password."
        static let kNewConfirmPasswordMessage  = "New password and confirm password must be same."
        static let kOldNewPasswordMessage      = "Old password and new password must be different"
        
        //Diamond
        static let kMoveAllStoneBasket         = "Are you sure you want move all stone to basket?"
        static let kMoveAllStoneWatchlist      = "Are you sure you want move all stones to watchlist?"
        static let kSendRequest                = "Are you sure you want send request for all stone?"
        
        //Compare
        static let selectToCompare             = "Please select atleast 2 Stones to compare."
        static let deleteToCompare             = "You can not compare single stone."
        
        //Demand
        static let deleteToDemand              = "Are you sure you want to remove this item from demand"
        
        //MyPurchase
        static let deleteToPurchase              = "Are you sure you want to cancel this item from purchase"
    }
    
    //Screen Title
    struct ScreenTitle {
        
        static let kDashboard             = "Dashboard"
        static let kSearchDiamond         = "Search Diamond"
        static let kQuickSearch           = "Quick Search"
        static let kWhiteSearch           = "White Search"
        static let kFancySearch           = "Fancy Search"
        static let kBPFSearch             = "BPF Search"
        static let kHHSearch              = "Happy Hours Search"
        static let KDiamondList           = "Diamonds"
        static let kNewArrival            = "New Arrival"
        static let kExpDiamond            = "Exceptional Diamonds"
        static let kExpPairs              = "Exceptional Pairs"
        static let kBPF                   = "BPF"
        static let kBPFTitle              = "Best Price First"
        static let kMyBPF                 = "My BPF"
        static let kHappyHours            = "Happy Hours"
        static let kMyHappyHours          = "My Happy Hours"
        static let kBiding                = "Biding"
        static let kMyBiding              = "My Biding"
        static let kMyBasket              = "My Basket"
        static let kMyWatchList           = "My WatchList"
        static let kMyOffer               = "My Offer"
        static let KMyPurchase            = "My Purchase"
        static let kMyRequest             = "My Request"
        static let KMyPendingOrder        = "My Pending Order"
        static let KMyDemand              = "My Demand"
        static let KNotification          = "Notifications"
        static let KAboutUs               = "About Base Demo"
        static let KContactUs             = "Contact Us"
        static let KPaymentInstruction    = "Payment Instructions"
        static let KFeedback              = "Feedback"
        static let KChangePassword        = "Change Password"
        static let KProfile               = "Profile"
        static let KLogout                = "Logout"
        static let kSearchResults         = "Search Results"
        static let kCompare               = "Compare"
        static let kForgotPassword        = "Forgot Password"
        static let kChangePassword        = "Change Password"
        static let kShowSelected          = "Show Selected"
        static let kViewOrder             = "View Order"
        static let kViewSentRequest       = "View Sent Request"
        static let kSavedSearch           = "Saved Search"
    }
    
    struct PlaceHolderTitle {
        
        static let kEnterFeedback = "Enter your feedback"
    }
    
    struct ExtraTypeSelected {
        
        static let EX         = "3EX+"
        static let VG         = "3VG+"
        static let NOBGM      = "NO BGM"
        static let NOBLACK    = "NO BLACK"
        static let CPS        = "CPS"
        static let SM         = "SM"
        static let BLACK      = "BLACK"
    }
    
    struct CartAPIType {
        
        static let Cart         = "1"
        static let WatchList    = "2"
        static let RequestStone = "3"
    }
    
    struct MarketingType {
        
        static let BPF          = "BPF"
        static let HappyHours   = "HappyHours"
        static let Bidding      = "Bidding"
    }

    struct DiamondStatus {
        
        static let BPF_AVAILABLE                = 13
        static let BPF_ISSUE                    = 14
        static let MARKETING_AVAILABLE          = 15
        static let MARKETING_ISSUE              = 16
        static let SALE                         = 17
        static let OFFER                        = 18
        static let DELIVERY                     = 19
        static let HAPPY_HOURS_ISSUE            = 20
        static let BIDDING_ISSUE                = 21
    }
    
}
