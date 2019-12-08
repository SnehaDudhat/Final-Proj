//
//  UserInfoModel.swift
//  KiranJewellery
//
//  Created by Sagar Gondaliya on 26/07/17.
//  Copyright © 2017 Rushi Sangani. All rights reserved.
//

import AlamofireObjectMapper
import ObjectMapper

class UserInfoModel: NSObject, Mappable, NSCoding {
    
    public var accessToken : String?
    public var userId : String?
    public var companyId : String?
    public var userLevel : String?
    public var roleId : String?
    public var yearId : String?
    public var location : String?
    public var department : String?
    public var departmentId : String?
    public var code : String?
    public var validUpto : String?
    public var codeTime : String?
    public var locationId : String?
    public var dates : String?
    public var email : String?
    public var name : String?
    public var company : String?
    public var roleName : String?
    public var mobileNo : String?

    override init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        userId                 <- map["id"]
        companyId              <- map["company_id"]
        userLevel              <- map["user_level"]
        roleId                 <- map["role_id"]
        yearId                 <- map["year_id"]
        location               <- map["location"]
        department             <- map["department"]
        departmentId           <- map["department_id"]
        code                   <- map["code"]
        validUpto              <- map["valid_upto"]
        codeTime               <- map["code_time"]
        locationId             <- map["location_id"]
        dates                  <- map["dates"]
        email                  <- map["email"]
        name                   <- map["name"]
        company                <- map["company"]
        roleName               <- map["role_name"]
        mobileNo               <- map["mobile_no"]
    }
    
    // Encode decode
    required init?(coder aDecoder: NSCoder) {
        
        userId               = aDecoder.decodeObject(forKey: "userId") as? String
        companyId            = aDecoder.decodeObject(forKey: "companyId") as? String
        userLevel            = aDecoder.decodeObject(forKey: "userLevel") as? String
        roleId               = aDecoder.decodeObject(forKey: "roleId") as? String
        location             = aDecoder.decodeObject(forKey: "location") as? String
        department           = aDecoder.decodeObject(forKey: "department") as? String
        departmentId         = aDecoder.decodeObject(forKey: "departmentId") as? String
        code                 = aDecoder.decodeObject(forKey: "code") as? String
        codeTime             = aDecoder.decodeObject(forKey: "codeTime") as? String
        locationId           = aDecoder.decodeObject(forKey: "locationId") as? String
        dates                = aDecoder.decodeObject(forKey: "dates") as? String
        email                = aDecoder.decodeObject(forKey: "email") as? String
        name                 = aDecoder.decodeObject(forKey: "name") as? String
        company              = aDecoder.decodeObject(forKey: "company") as? String
        roleName             = aDecoder.decodeObject(forKey: "roleName") as? String
        mobileNo             = aDecoder.decodeObject(forKey: "mobileNo") as? String
        accessToken          = aDecoder.decodeObject(forKey: "accessToken") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(userId, forKey: "userId")
        aCoder.encode(companyId, forKey: "companyId")
        aCoder.encode(userLevel, forKey: "userLevel")
        aCoder.encode(roleId, forKey: "roleId")
        aCoder.encode(location, forKey: "location")
        aCoder.encode(department, forKey: "department")
        aCoder.encode(departmentId, forKey: "departmentId")
        aCoder.encode(code, forKey: "code")
        aCoder.encode(codeTime, forKey: "codeTime")
        aCoder.encode(locationId, forKey: "locationId")
        aCoder.encode(dates, forKey: "dates")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(company, forKey: "company")
        aCoder.encode(roleName, forKey: "roleName")
        aCoder.encode(mobileNo, forKey: "mobileNo")
        aCoder.encode(accessToken, forKey: "accessToken")
    }
}
