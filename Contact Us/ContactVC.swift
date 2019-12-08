//
//  ContactVC.swift
//  kiranDiamond
//
//  Created by Sierra on 07/03/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class ContactVC: UIViewController,SlideNavigationControllerDelegate {

    //MARK: Variables
    private var btnContactForm : UIButton?
    var isMenuVisible = false
    var arrContacts = [ContactModel]()
    
    //MARK: Outlets
    @IBOutlet var tblContact: UITableView!
    
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
    }
    
    //MARK: SlideNavigationController Methods
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
        return isMenuVisible
    }
    
    //MARK: Nav Bar Methods
    private func setBarButton(){
        
        //Contact Form
        btnContactForm = UIButton(type: .custom)
        btnContactForm?.setImage(#imageLiteral(resourceName: "note"), for: .normal)
        btnContactForm?.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        btnContactForm?.addTarget(self, action: #selector(self.btnContactForm_Clicked(_:)), for: .touchUpInside)
        let ContactFormItem = UIBarButtonItem(customView: btnContactForm!)
        self.navigationItem.setRightBarButton(ContactFormItem, animated: true)
    }
    
    //MARK: Private Methodd
    
    func initialConfig()
    {
       // self.setBarButton()
        
        // Register Cell
        tblContact.register(UINib(nibName: "ConatctUsCell", bundle: nil), forCellReuseIdentifier: "ConatctUsCell")
        
        self.prepareDataSource()
    }
    
    func prepareDataSource()
    {
        // Get Data From Contact Json File
        if let path = Bundle.main.path(forResource: "contacts", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String:Any], let person = jsonResult["contacts"] as? [[String:Any]] {
                    
                    for obj in person {
                        let model = ContactModel.getContactModelFromDict(dict: obj)
                        arrContacts.append(model)
                    }
                    tblContact.reloadData()
                }
            } catch {
                // handle error
            }
        }
    }
     //MARK: IBActions
    @objc func btnContactForm_Clicked(_ sender: UIButton) {
        let vc = ContactUsFormVC(nibName: "ContactUsFormVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: UITableView's DataSource & Delegate Methods
extension ContactVC: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tblContact.dequeueReusableCell(withIdentifier: "ConatctUsCell") as! ConatctUsCell
        cell.setData(model: arrContacts[indexPath.row])
        return cell
    }
}

