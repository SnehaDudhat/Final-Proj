//
//  DashboardVC.swift
//  AnkitGems
//
//  Created by CS-Mac-Mini on 04/05/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController, SlideNavigationControllerDelegate {
    
    //MARK: Varibales
    var arrCellTypes = [CellModel]()
    var countForShowDiamond = 4
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Utilities.setNavigationBar(controller: self, isHidden: false, title: StringConstants.ScreenTitle.kDashboard)
    }
    
    //MARK: SlideNavigationController Methods
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
        return true
    }
    
    //MARK: Private methods
    func initialConfig(){
        
        tableView.register(UINib(nibName: "DiamondTypeCollectionCell", bundle: nil), forCellReuseIdentifier: "DiamondTypeCollectionCell")
        tableView.register(UINib(nibName: "SalesPersonCell", bundle: nil), forCellReuseIdentifier: "SalesPersonCell")
        tableView.register(UINib(nibName: "DashboardFooterCell", bundle: nil), forCellReuseIdentifier: "DashboardFooterCell")
        
        self.prepareDataSource()
    }
    
    func prepareDataSource(){
        
        self.arrCellTypes.removeAll()
        
        //Types
        arrCellTypes.append(Utilities.getModel(text: "", imageName: "", keyboardType: .default, type: CellType.dashboardDiamondTypesCell))
       
        arrCellTypes.append(Utilities.getModel(text: "", imageName: "", keyboardType: .default, type: CellType.dashboardSalesPerson))
        
        arrCellTypes.append(Utilities.getModel(text: "", imageName: "", keyboardType: .default, type: CellType.dashboardFooterCell))
        
        self.tableView.reloadData()
    }
}

//MARK: Tableview delegate methods
extension DashboardVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = arrCellTypes[indexPath.row]
        
        switch model.cellType! {
        case .dashboardDiamondTypesCell:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiamondTypeCollectionCell", for: indexPath) as! DiamondTypeCollectionCell
            cell.reloadTable = { count in
                
                self.countForShowDiamond = count
                self.tableView.beginUpdates()
                self.tableView.reloadData()
                self.tableView.endUpdates()
            }
            return cell
        case .dashboardSalesPerson:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SalesPersonCell", for: indexPath) as! SalesPersonCell
            //cell.setCellData(model: self.dashboadModel)
            return cell
        case .dashboardFooterCell:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardFooterCell", for: indexPath) as! DashboardFooterCell
            //cell.setCellData(model: self.dashboadModel)
            return cell
            
        default:
            
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = arrCellTypes[indexPath.row]
        switch model.cellType! {
        case .dashboardDiamondTypesCell:
            
            return CGFloat(95 * countForShowDiamond/2)
            
        default:
            
            return UITableViewAutomaticDimension
        }
        
    }
}
