//
//  CellModel.swift
//  Base Demo
//
//  Created by CS-Mac-Mini on 06/12/17.
//  Copyright © 2017 Coruscate. All rights reserved.
//

import UIKit

class CellModel: NSObject {
    
    var placeholder : String?
    var userText : String?
    var cellType : CellType?
    var cellObj : Any?
    var imageName: String?
    var keyboardType: UIKeyboardType?
    var isSelected : Bool = false
    var isAllSelected : Bool = false //Use In search Stock
    var dataArr = [Any]()
    
    var from : String?
    var to : String?
    
    override init() {
    }
    
    //Convert From & To value in Dic With Doubel
    func getFromToDic() -> [String : Any] {
        
        var dict = [String : Any]()
        dict["from"] = from?.toDouble() ?? 0
        dict["to"] = to?.toDouble() ?? 0
        return dict
    }
    
    func getFromToStringDic() -> [String : Any] {
        
        var dict = [String : Any]()
        dict["from"] = from
        dict["to"] = to
        return dict
    }
    
    func getFromToIdDic() -> [String : Any] {
        
        var idFromTo = [String : Any]()
        
        for model in self.dataArr as! [MasterModel] {
            
            if self.from == model.name {
                idFromTo["from"] = model.id
            }
            else if self.to == model.name {
                idFromTo["to"] = model.id
            }
        }
        return idFromTo
    }
    
    //From to InbetweenArray
    func getFromToInBetweenId() -> [String]{
        
        var selectedIds = [String]()
        var fromSequence : Int?
        var toSequence : Int?
        
        //Get Sequence
        for model in self.dataArr as! [MasterModel] {
            
            if self.from == model.name {
                fromSequence = model.sequence
            }
            else if self.to == model.name {
                toSequence = model.sequence
            }
        }
        
        //Get Inbetween Data
        for model in self.dataArr as! [MasterModel] {
            
            if let fromSTemp = fromSequence,let toSTemp = toSequence {
                
                if model.sequence >= fromSTemp && model.sequence <= toSTemp {
                    if !selectedIds.contains(model.id!) {
                        selectedIds.append(model.id!)
                    }
                }
            }
        }
        
        return selectedIds
    }
}
