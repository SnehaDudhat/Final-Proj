////
////  SyncManager.swift
////  Base Demo
////
////  Created by Coruscate on 11/12/17.
////  Copyright © 2017 Coruscate. All rights reserved.
////
//
//import UIKit
//import AlamofireObjectMapper
//import Realm
//import RealmSwift
//import Foundation
//
//class SyncManager: NSObject {
//    
//    // A Singleton instance
//    static let sharedInstance = SyncManager()
//    let realm = try! Realm()
//    
//    // Initialize
//    private override init() {
//        print("REALM PATH : \(Realm.Configuration.defaultConfiguration.fileURL!)")
//    }
//    
//    func syncDatabase(){
//        
//        self.syncMaster()
//    }
//    
//    //MARK:- Sync Master
//    func syncMaster(){
//        
//        var reqDict = Parameters()
//        reqDict["particularType"] = "\(AppConstants.MasterSyncKeys.SHAPE),\(AppConstants.MasterSyncKeys.COLOR),\(AppConstants.MasterSyncKeys.CLARITY),\(AppConstants.MasterSyncKeys.LAB),\(AppConstants.MasterSyncKeys.CUT),\(AppConstants.MasterSyncKeys.POLISH),\(AppConstants.MasterSyncKeys.SYMMETRY),\(AppConstants.MasterSyncKeys.FLUORESCENCE),\(AppConstants.MasterSyncKeys.COUNTRY),\(AppConstants.MasterSyncKeys.OVERTONE),\(AppConstants.MasterSyncKeys.INTENSITY),\(AppConstants.MasterSyncKeys.CULET),\(AppConstants.MasterSyncKeys.GIRDLE),\(AppConstants.MasterSyncKeys.FANCYCOLOR),\(AppConstants.MasterSyncKeys.SIEVES),\(AppConstants.MasterSyncKeys.EFFM),\(AppConstants.MasterSyncKeys.SHADE),\(AppConstants.MasterSyncKeys.MILKY),\(AppConstants.MasterSyncKeys.EFCM),\(AppConstants.MasterSyncKeys.NATTS)"
//        
//        if let syncDate = Defaults[.MasterSyncDate] {
//            reqDict["lastSyncDate"] = syncDate
//        }
//        else {
//            reqDict["lastSyncDate"] = AppConstants.startingDate
//        }
//    
//        NetworkClient.sharedInstance.request(AppConstants.serverURL, command: AppConstants.URL.MasterSync, method: .post, parameters: reqDict, headers: ApplicationData.sharedInstance.authorizationHeaders, success: { (response, message) in
//            
//            //save Data
//            if let respnseDict = response as? [String:Any] {
//                
//                Defaults[.MasterSyncDate] = respnseDict["lastSyncDate"] as? String
//                
//                if let deleteds = respnseDict["deletedIds"] as? [[String : Any]] {
//                   self.deleteMasterWithId(deleteIds: deleteds)
//                }
//                
//                if let list = respnseDict["List"] as? [[String:Any]] {
//                    self.insertMaster(list: list)
//                }
//            }
//            
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppConstants.Notification.MasterSyncSuccessNotification), object: nil)
//            
//        }) { (failureMessage, failureCode) in
//            Utilities.showAlertView(title: AppConstants.appName, message: failureMessage)
//        }
//    }
//}
//
//// MARK:- Database Insert/Update/Delete Entities
//
//extension SyncManager {
//    
//    ///Insert Master
//    func insertMaster(list : [[String : Any]]) {
//        
//        let arrData = Mapper<MasterModel>().mapArray(JSONArray: list)
//        for obj in arrData
//        {
//            if self.realm.isInWriteTransaction {
//                self.realm.add(obj, update: true)
//            }
//            else {
//                try! self.realm.write {
//                    self.realm.add(obj, update: true)
//                }
//            }
//        }
//    }
//    
//    ///Delete Master
//    func deleteMasterWithId(deleteIds : [[String : Any]]) {
//        
//        for dic in deleteIds{
//
//            if let id = dic["deletedId"] as? String {
//
//                // query all objects where the id in included
//                let objectsToDelete = realm.objects(MasterModel.self).filter("id = %@", id)
//
//                // and then just remove the set with
//                try! realm.write {
//                    realm.delete(objectsToDelete)
//                }
//            }
//        }
//    }
//}
//
//// MARK:- Database Fetch Entities
//
//extension SyncManager {
//    
//    ///Fetch Master With Code
//    func fetchMaterWithCode(code : String) -> [MasterModel] {
//        
//        let predicate = NSPredicate(format: "code = %@", code)
//        let masters = realm.objects(MasterModel.self).filter(predicate).sorted(byKeyPath: "sequence", ascending: true)
//        return Array(masters)
//    }
//    
//    ///Fetch Master With ID
//    func fetchMasterWithId(id : String) -> [MasterModel] {
//        
//        let predicate = NSPredicate(format: "id = %@", id)
//        let masters = realm.objects(MasterModel.self).filter(predicate).filter(predicate).sorted(byKeyPath: "sequence", ascending: true)
//        return Array(masters)
//    }
//    
//    ///Fetch Master With ID IN
//    func fetchMasterWithIdIN(id : [String]) -> [MasterModel] {
//        
//        let predicate = NSPredicate(format: "id IN %@", id)
//        let masters = realm.objects(MasterModel.self).filter(predicate).filter(predicate).sorted(byKeyPath: "sequence", ascending: true)
//        return Array(masters)
//    }
//    
//    ///Fetch SubMaster With Master ID
//    func fetchSubMasterWithMasterId(id : String) -> [MasterModel] {
//        
//        let predicate = NSPredicate(format: "parentId = %@ AND is_display = %@ AND group_id == nil ", id, NSNumber.init(value: true))
//        let masters = realm.objects(MasterModel.self).filter(predicate).filter(predicate).sorted(byKeyPath: "sequence", ascending: true)
//        return Array(masters)
//    }
//    
//    ///Fetch Carats with from & to value
//    func fetchCaratsWithFromTo(from : Double,to : Double) -> [MasterModel] {
//        
//        let predicate = NSPredicate(format: "fromPointer = \(from) AND toPointer = \(to)")
//        let masters = realm.objects(MasterModel.self).filter(predicate).filter(predicate).sorted(byKeyPath: "sequence", ascending: true)
//        return Array(masters)
//    }
//}
//
//extension SyncManager{
//    
//    func addToCartWatchList(type:String,arrFinishNo:[Int],success:@escaping (()->Void)) {
//        
//        var request = Parameters()
//        request["type"] = type
//        let arrFinish = arrFinishNo.map
//        {
//            String($0)
//        }
//        request["finish_nos"] = arrFinish.joined(separator: ",")
//        
//        NetworkClient.sharedInstance.showIndicator("", stopAfter: 0)
//        NetworkClient.sharedInstance.request(AppConstants.serverURL, command: AppConstants.URL.AddToCartANDWatchList, method: .post, parameters: request, headers: ApplicationData.sharedInstance.authorizationHeaders, success: { (response, message) in
//            
//            if type == StringConstants.CartAPIType.Cart{
//                
//                //basket
//                UIViewController.current().view.showConfirmationPopup(title: AppConstants.appName, message: message, cancelButtonTitle: "Stay on Page", confirmButtonTitle: "Go to Basket", height: 160, onConfirmClick: {
//                    
//                    let vc = MyCartVC(nibName: "MyCartVC", bundle: nil)
//                    vc.isMenuVisible = false
//                    SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
//                    
//                }) {
//                    
//                    success()
//                }
//                
//            }else{
//                
//                //watchlist
//                UIViewController.current().view.showConfirmationPopup(title: AppConstants.appName, message: message, cancelButtonTitle: "Stay on Page", confirmButtonTitle: "Go to Watchlist", height: 160, onConfirmClick: {
//                    
//                    let vc = MyWatchListVC(nibName: "MyWatchListVC", bundle: nil)
//                    vc.isMenuVisible = false
//                    SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
//                    
//                }) {
//                    
//                    success()
//                }
//            }
//            
//            
//        }) { (failureMessage, failureCode) in
//            Utilities.showAlertView(title: AppConstants.appName, message: failureMessage)
//        }
//    }
//    
//    
//    func deleteFromCartWatchList(type:String,arrIds:[String],success:@escaping (()->Void)) {
//        
//        var request = Parameters()
//        request["type"] = type
//        request["deletedids"] = arrIds.joined(separator: ",")
//        
//        NetworkClient.sharedInstance.showIndicator("", stopAfter: 0)
//        NetworkClient.sharedInstance.request(AppConstants.serverURL, command: AppConstants.URL.RemoveFromCartANDWatchList, method: .post, parameters: request, headers: ApplicationData.sharedInstance.authorizationHeaders, success: { (response, message) in
//            
//            success()
//            
//        }) { (failureMessage, failureCode) in
//            Utilities.showAlertView(title: AppConstants.appName, message: failureMessage)
//        }
//    }
//   
//}
