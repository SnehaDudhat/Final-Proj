//
//  DiamondTypeCollectionCell.swift
//  AnkitGems
//
//  Created by CS-Mac-Mini on 04/05/18.
//  Copyright © 2018 Coruscate. All rights reserved.
//

import UIKit

class DiamondTypeCollectionCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Varibales
    var arrCellTypes = [CellModel]()
    var reloadTable : ((_ count:Int)->())?
    private enum CurrentType {
        case Main
        case Search
        case Exceptional
    }
    private var currentType = CurrentType.Main
    
    //MARK: View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DiamondTypeCell", bundle: nil), forCellWithReuseIdentifier: "DiamondTypeCell")
        self.prepareMainDataSource()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: Private Methods
    
    func prepareMainDataSource(){
        
        self.arrCellTypes.removeAll()
        self.currentType = .Main
        arrCellTypes.append(Utilities.getModel(text: "Search", imageName: "diamond-search", keyboardType: .default, type: CellType.dashboardSearch))
        arrCellTypes.append(Utilities.getModel(text: "BPF", imageName: "bpfIcon", keyboardType: .default, type: CellType.dashboardBPF))
        
        arrCellTypes.append(Utilities.getModel(text: "Happy Hours", imageName: "happyhourIcon", keyboardType: .default, type: CellType.dashboardHappyHours))
       // arrCellTypes.append(Utilities.getModel(text: "Bidding", imageName: "diamond", keyboardType: .default, type: CellType.dashboardBidding))
        arrCellTypes.append(Utilities.getModel(text: "Exceptional Diamonds", imageName: "exceptional_diamond", keyboardType: .default, type: CellType.dashboardExceptionalDiamonds))
        
        self.collectionView.reloadData()
        
    }
    
    func prepareSearchDataSource(){
        
        self.arrCellTypes.removeAll()
        self.currentType = .Search
        arrCellTypes.append(Utilities.getModel(text: "Search", imageName: "diamond-search", keyboardType: .default, type: CellType.dashboardSearch))
        arrCellTypes.append(Utilities.getModel(text: "BPF", imageName: "bpfIcon", keyboardType: .default, type: CellType.dashboardBPF))
        arrCellTypes.append(Utilities.getModel(text: "White Search", imageName: "white_search", keyboardType: .default, type: CellType.dashboardWhiteSearch))
        arrCellTypes.append(Utilities.getModel(text: "Fancy Search", imageName: "fancy_search", keyboardType: .default, type: CellType.dashboardFancySearch))
        arrCellTypes.append(Utilities.getModel(text: "Stone Search", imageName: "stone_search", keyboardType: .default, type: CellType.dashboardStoneSearch))
        arrCellTypes.append(Utilities.getModel(text: "Quick Search", imageName: "quick_search", keyboardType: .default, type: CellType.dashboardQuickSearch))
        
        arrCellTypes.append(Utilities.getModel(text: "Happy Hours", imageName: "happyhourIcon", keyboardType: .default, type: CellType.dashboardHappyHours))
        arrCellTypes.append(Utilities.getModel(text: "Exceptional Diamonds", imageName: "exceptional_diamond", keyboardType: .default, type: CellType.dashboardExceptionalDiamonds))
        
        self.collectionView.reloadData()
        
    }
    
    func prepareExcDataSource(){
        
        self.arrCellTypes.removeAll()
        self.currentType = .Exceptional
        arrCellTypes.append(Utilities.getModel(text: "Search", imageName: "diamond-search", keyboardType: .default, type: CellType.dashboardSearch))
        arrCellTypes.append(Utilities.getModel(text: "BPF", imageName: "bpfIcon", keyboardType: .default, type: CellType.dashboardBPF))
        arrCellTypes.append(Utilities.getModel(text: "Happy Hours", imageName: "happyhourIcon", keyboardType: .default, type: CellType.dashboardHappyHours))
        arrCellTypes.append(Utilities.getModel(text: "Exceptional Diamonds", imageName: "exceptional_diamond", keyboardType: .default, type: CellType.dashboardExceptionalDiamonds))
        
        arrCellTypes.append(Utilities.getModel(text: "Diamonds", imageName: "exceptional_diamond", keyboardType: .default, type: CellType.dashboardDiamonds))
        arrCellTypes.append(Utilities.getModel(text: "Pair", imageName: "pair", keyboardType: .default, type: CellType.dashboardPairs))
        
        self.collectionView.reloadData()
        
    }
}

//MARK: Collectionview methods
extension DiamondTypeCollectionCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrCellTypes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiamondTypeCell",
                                                      for: indexPath) as? DiamondTypeCell
        cell?.setCellData(model: self.arrCellTypes[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/2, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model = self.arrCellTypes[indexPath.row]
        switch model.cellType! {
        case .dashboardSearch:
            
            //Search
            if currentType == .Search{
                
                self.prepareMainDataSource()
                self.reloadTable?(self.arrCellTypes.count)
                
            }else{
                
                self.prepareSearchDataSource()
                self.reloadTable?(self.arrCellTypes.count)
                
            }
           
            break
        case .dashboardBPF:
            
            //BPF
            let vc = SearchStockVC(nibName: "SearchStockVC", bundle: nil)
            vc.filterType = .BPF
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            break
            
        case .dashboardWhiteSearch:
            
            //WhiteSearch
            let vc = SearchStockVC(nibName: "SearchStockVC", bundle: nil)
            vc.filterType = .Search
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            break
        case .dashboardFancySearch:
            
            //WhiteSearch
            let vc = SearchStockVC(nibName: "SearchStockVC", bundle: nil)
            vc.filterType = .FancySearch
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            break
        case .dashboardStoneSearch:
            
            //WhiteSearch
            let vc = SearchStockVC(nibName: "SearchStockVC", bundle: nil)
            vc.filterType = .StoneSearch
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            break
        case .dashboardQuickSearch:
            
            //QuickSearch
            let vc = quickSearchVc(nibName: "quickSearchVc", bundle: nil)
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            break
        case .dashboardHappyHours:
            
            //HappyHours
            let vc = SearchStockVC(nibName: "SearchStockVC", bundle: nil)
            vc.filterType = .HappyHours
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            break
        case .dashboardBidding:
            
            //Bidding
            let vc = SearchStockVC(nibName: "SearchStockVC", bundle: nil)
            vc.filterType = .Bidding
            SlideNavigationController.sharedInstance().pushViewController(vc, animated: true)
            break
        case .dashboardExceptionalDiamonds:
            
            //ExceptionalDiamonds
            if currentType == .Exceptional{
                
                self.prepareMainDataSource()
                self.reloadTable?(self.arrCellTypes.count)
                
            }else{
                
                self.prepareExcDataSource()
                self.reloadTable?(self.arrCellTypes.count)
                
            }
            break
        case .dashboardPairs:
            
            //Pairs
            
            break
        case .dashboardDiamonds:
            
            //Pairs
            
            break
        default:
            print("")
        }
    }
}
