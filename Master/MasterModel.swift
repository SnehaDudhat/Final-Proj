//
//  MasterModel.swift
//  AnkitGems
//
//  Created by Coruscate on 24/03/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import Realm
import ObjectMapper_Realm

class MasterModel: Object, Mappable  {

    @objc dynamic var id : String?
    @objc dynamic var isActive = false
    @objc dynamic var isDefault = false
    @objc dynamic var code : String?
    @objc dynamic var parentCode : String?
    @objc dynamic var sequence = 0
    @objc dynamic var parentName : String?
    @objc dynamic var name : String?
    @objc dynamic var parentId : String?
    @objc dynamic var image : String?
    @objc dynamic var fromPointer : Double = 0
    @objc dynamic var toPointer : Double = 0
    @objc dynamic var group_id : String?
    @objc dynamic var is_display = false
    
    var isSelected = false
 
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        
        id                             <- map["id"]
        name                           <- map["name"]
        isDefault                      <- map["is_default"]
        isActive                       <- map["is_active"]
        code                           <- map["code"]
        parentCode                     <- map["parent_code"]
        sequence                       <- map["sequence"]
        parentName                     <- map["parent_name"]
        name                           <- map["name"]
        parentId                       <- map["parent_id"]
        image                          <- map["image"]
        fromPointer                    <- map["from_pointer"]
        toPointer                      <- map["to_pointer"]
        group_id                       <- map["group_id"]
        is_display                     <- map["is_display"]
    }
    
    //MARK: Fetch SubMaster With Parent ID
    class func prepareSubMaster(id : String) -> [MasterModel] {
        
        return Array(SyncManager.sharedInstance.fetchSubMasterWithMasterId(id: id))
    }
    
    //MARK: Fetch Selected Master Id
    class func getSelectedId(masters : [MasterModel]) -> [String] {
        
        var ids = [String]()
        for item in masters {
            if item.isSelected { ids.append(item.id!) }
        }
        
        return ids
    }
    
    //MARK: Fetch Selected Carats From To Dic
    class func getSelectedCaratFromToDic(masters : [MasterModel]) -> [[String : Any]] {
        
        var carats = [[String : Any]]()
        for item in masters {
            
            if item.isSelected {
                let tempDic = ["from" : item.fromPointer,"to" : item.toPointer]
                carats.append(tempDic)
            }
        }
        
        return carats
    }
}
