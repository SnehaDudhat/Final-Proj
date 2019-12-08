//
//  ContactUsFormVC.swift
//  AnkitGems
//
//  Created by Sierra on 26/04/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class ContactUsFormVC: UIViewController {

    //MARK: Variables
    var arrData = [CellModel]()
    
    //MARK: Outlets
    @IBOutlet var tblView: UITableView!
    
    //MARK: ViewController'sm Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        Utilities.setNavigationBar(controller: self, isHidden: false, title: StringConstants.ScreenTitle.KContactUs)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private Methodd
    
    func initialConfig()
    {
        // Register Cell
        tblView.register(UINib(nibName: "CFTextFieldCell", bundle: nil), forCellReuseIdentifier: "CFTextFieldCell")
        
        tblView.register(UINib(nibName: "CFTextViewCell", bundle: nil), forCellReuseIdentifier: "CFTextViewCell")
        
        self.prepareDataSource()
    }
    
    func prepareDataSource() {
        
        arrData.append(Utilities.getModelForProfile(text : "Name",imageName:"user",keyboardType: .default,type : CellType.CFName,userText:""))
        arrData.append(Utilities.getModelForProfile(text : "Address",imageName:"map",keyboardType: .default,type : CellType.CFAddress,userText:""))        
        
        tblView.reloadData()
    }
    
    //MARK: IBActions
    @IBAction func btnSubmit_Clicked(_ sender: UIButton) {
        // Code Here for submit Button
    }
    
}

//MARK: UITableView's DataSource & Delegate Methods
extension ContactUsFormVC: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let model = arrData[indexPath.row]
        if model.cellType == CellType.CFName {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CFTextFieldCell") as! CFTextFieldCell
            cell.setData(model: model)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CFTextViewCell") as! CFTextViewCell
            cell.setData(model: model)
            return cell
        }
    }

}
