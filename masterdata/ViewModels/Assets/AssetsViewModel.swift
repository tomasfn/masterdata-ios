//
//  AssetsViewModel.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

protocol AssetsView: AnyObject {
    func showOnlyAssetType(assetType: AssetTypeNameEnum)
    func showOnlyCrypto()
    func showOnlyCommodity()
    func showOnlyFiat()
    func reloadTableView()
    func showError(message: String)
}

protocol AssetsCellView {
    func displayCommodity(commodity: Commodity)
}

class AssetsViewModel {
    
    var reloadTableViewClosure: (()->())?
    
    private weak var view: AssetsView?
    private var filteredCommodities: [Commodity] = []
    private var commodities: [Commodity] = [Commodity]() {
         didSet {
             self.reloadTableViewClosure?()
         }
     }
    
    func setView(view: AssetsView) {
        self.view = view
    }
    
    func fetchLocalData() {
        guard let commodities = DataManager.dataForAssets() else { return }
        self.commodities = commodities
        self.filteredCommodities = self.commodities
        self.view?.reloadTableView()
    }
        
    func getCommoditiesCount() -> Int {
        return commodities.count
    }
    
    func configureCell(cell: AssetsCellView, for index: Int) {
        let commodity = commodities[index]
        cell.displayCommodity(commodity: commodity)
    }
    
    func filterTableViewFor(asseType: AssetTypeNameEnum) {
        if asseType == .fiat {
            self.commodities = filteredCommodities.filter{ $0.type == asseType && $0.attributes?.hasWallets == true }
        } else {
            self.commodities = filteredCommodities.filter{ $0.attributes?.assetTypeName == asseType }
        }
        self.view?.reloadTableView()
    }
}

