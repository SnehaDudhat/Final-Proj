//
//  EnumConstant.swift
//  kiranDiamond
//
//  Created by Coruscate on 28/02/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

//MARK: UserType
enum UserType
{

}

//Filter Type
enum FilterType{
    
    case Search
    case FancySearch
    case StoneSearch
    case BPF
    case HappyHours
    case Bidding
    case QuickSearch
    case NewArrivals
}

//CommonDiamond
enum DiamondListType{
    
    case MyBPF
    case MyHappyHour
    case MyBidding
    case MyOffer
    case MyRequest
}

//MARK: SearchType (Selected Tab)
enum SearchType
{
    case Basic
    case Advance
    case Stone
}

//MARK: All Cell Enum
enum CellType {
    
    //Search Basic
    case searchShape
    case searchCarat
    case searchColorCell
    case searchFancyColorCell
    case searchOverToneCell
    case searchIntensityCell
    case searchClarityCell
    case searchExtraCell
    case searchlaboratoryCell
    case searchEffmCell
    case searchEfcmCell
    case searchCutCell
    case searchPolishCell
    case searchSymmetryCell
    case searchFluorescenceCell
    case searchShadeCell
    case searchMilkyCell
    case searchBlackInclusionCell
    case searchDateCell
    case searchSuratT2aCell
    case searchLocationCell

    //Search Adnvance
    case searchRapPercCell
    case searchPriceCell
    case searchTableCell
    case searchTotalDepthCell
    case searchRatioCell
    case searchLengthCell
    case searchWidthCell
    case searchCuletCell
    case searchGridlePerCell
    case searchGridleCell
    case searchCrownAngleCell
    case searchCrownHeightCell
    case searchPavilionAngleCell
    case searchPavilionHeightCell
    case searchStarLengthCell
    case searchLowerHalfCell
    
    //Profile
    case ProfileName
    case ProfileCompany
    case ProfileBusiness
    case ProfileEmail
    case ProfileAddress
    case ProfileCountry
    case ProfileState
    case ProfileCity
    case ProfilePinCode
    case ProfileMobile
    case ProfilePhone
    case ProfileFax
    case ProfileWeb
    
    //Compare
    case CompareTitleCell
    case CompareHeaderCell
    case CompareEmptyCell
    case CompareDeleteCell
    
    //LeftMenu
    case Dashboard
    case SearchDiamond
    case NewDiamond
    case ExpDiamond
    case ExpPairs
    case BPF
    case HappyHour
    case MyHappyHour
    case Biding
    case MyBiding
    case MyBPF
    case MyBasket
    case MyWatchlist
    case MyOffer
    case MyPurchase
    case MyRequest
    case MyPendingOrder
    case MyDemand
    case Notification
    case AboutUs
    case ContactUs
    case PaymentInstruction
    case Feedback
    case SavedSearch
    case Logout
    
    //AboutUs
    case AboutUsHeaderCell
    case AboutUsDetailCell
    
    //Contact Us Form
    case CFName
    case CFAddress
    
    //Diamond Detail
    case diamonDetailHeaderCell
    case diamonDetailTableCell
    case diamondDetailKeyValue
    case diamondDetailKeyValueWithLink
    case diamondDetailVideo
    case diamondDetailImage
    case diamondDetailCertificate
    case diamondDetailHeart
    case diamondDetailArrow
    case diamondDetailDimension
    
    //Dashboard
    
    case dashboardDiamondTypesCell
    case dashboardSearch
    case dashboardQuickSearch
    case dashboardStoneSearch
    case dashboardFancySearch
    case dashboardWhiteSearch
    case dashboardBPF
    case dashboardExceptionalDiamonds
    case dashboardPairs
    case dashboardDiamonds
    case dashboardHappyHours
    case dashboardBidding
    case dashboardSalesPerson
    case dashboardFooterCell
    
    //Diamond Detail Popup
    case DDPopupValueWithColor
    case DDPopupValueWithBold
    case DDPopupBlankRow
    case DDPopupNormalRow
    
    // Diamond Sorting
    case DSDefault
    case DSNewDiamond
    case DSPriceLowToHigh
    case DSPriceHighToLow
    case DSSortWithColor
    case DSSortWithClarity
    case DSCaratLowToHigh
    case DSCaratHighToLow
    case DSDiscountLowToHigh
    case DSDiscountHighToLow
    
    
}



