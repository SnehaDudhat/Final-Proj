//
//  ProfileModel.swift
//  AnkitGems
//
//  Created by CS-MacSierra on 17/05/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit
import ObjectMapper

class ProfileModel: NSObject, Mappable {

    var id : String?
    var categories : String?
    var name : String?
    var short_code : String?
    var business_type_id : String?
    var business_type : String?
    var registration_date : String?
    var email1 : String?
    var email2 : String?
    var mobile_no1 : String?
    var mobile_no2 : String?
    var contact_no1 : String?
    var contact_no2 : String?
    var fax_no : String?
    var website : String?
    var address : String?
    var city_id : String?
    var city : String?
    var state_id : String?
    var state : String?
    var country_id : String?
    var country : String?
    var zip : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        id                            <- map["id"]
        categories                    <- map["categories"]
        name                          <- map["name"]
        short_code                    <- map["short_code"]
        business_type_id              <- map["business_type_id"]
        business_type                 <- map["business_type"]
        registration_date             <- map["registration_date"]
        email1                        <- map["email1"]
        email2                        <- map["email2"]
        mobile_no1                    <- map["mobile_no1"]
        mobile_no2                    <- map["mobile_no2"]
        contact_no1                   <- map["name"]
        contact_no2                   <- map["contact_no2"]
        fax_no                        <- map["fax_no"]
        website                       <- map["website"]
        address                       <- map["address"]
        city_id                       <- map["city_id"]
        city                          <- map["city"]
        state_id                      <- map["state_id"]
        state                         <- map["state"]
        country_id                    <- map["country_id"]
        country                       <- map["country"]
        zip                           <- map["zip"]
    }
}
