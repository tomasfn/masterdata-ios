//
//  WalletViewModel.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation

protocol WalletsView: AnyObject {
    func reloadTableView()
    func showError(message: String)
}

protocol WalletsCellView {
    func displayWallet(wallet: Wallet, commodity: Commodity?)
}

class WalletViewModel {
    
    var reloadTableViewClosure: (()->())?
    
    private weak var view: WalletsView?
    
    var commodities: [Commodity] = [Commodity]()
    
    var wallets: [Wallet] = [Wallet]()
    var commodityWallets: [Wallet] = [Wallet]()
    var fiatWallets: [Wallet] = [Wallet]()
    
    var tableData: [[Wallet]] = [[Wallet]]()

    func setView(view: WalletsView) {
        self.view = view
    }
    
    func fetchLocalData() {
        guard let commodities = DataManager.dataForAssets() else { return }
        guard let wallets = DataManager.dataWallets() else { return }
        guard let commodityWallets = DataManager.dataCommodityWallets() else { return }
        guard let fiatWallets = DataManager.dataFiatWallets() else { return }

        self.commodities = commodities
        self.commodityWallets = applyWalletsOrder(wallets: commodityWallets)
        self.fiatWallets = applyWalletsOrder(wallets: fiatWallets)
        self.wallets = applyWalletsOrder(wallets: wallets)
        
        tableData = [self.wallets, self.commodityWallets, self.fiatWallets]
    }
        
    func getWalletsCount(section: Int) -> Int {
        switch section {
        case 0:
            return getWalletsCount()
        case 1:
            return getFiatWalletsCount()
        case 2:
            return getCommodityWalletsCount()
        default:
            return 0
        }
    }
    
    func getWalletsCount() -> Int{
        return wallets.count
    }
    
    func getFiatWalletsCount() -> Int {
        return fiatWallets.count
    }
    
    func getCommodityWalletsCount() -> Int {
        return commodityWallets.count
    }
    
    func applyWalletsOrder(wallets: [Wallet]) -> [Wallet] {
        let sortedWallets = sortDescendedWallets(wallets: wallets)
        return filterDeletedWallets(wallets: sortedWallets)
    }
    
    func filterDeletedWallets(wallets: [Wallet]) -> [Wallet] {
        return wallets.filter{ $0.attributes?.deleted == false ||  $0.attributes?.deleted == nil }
    }
    
    func sortDescendedWallets(wallets: [Wallet]) -> [Wallet] {
        return wallets.sorted {$0.attributes?.balance?.localizedStandardCompare($1.attributes?.balance ?? "") == .orderedDescending}
    }
    
    func getCurrentTitleHeader(section: Int) -> String {
        var title = ""
        switch section {
        case 0:
            title = "Wallets"
        case 1:
            title = "Commodity Wallets"
        case 2:
            title = "Fiat Wallets"
        default:
            title = "Title"
        }
        return title
    }
    
    func getCurrentNumbersOfRowsInSection(section: Int) -> Int {
        return getWalletsCount(section: section)
    }
    
    func configureCell(cell: WalletsCellView, for indexPath: IndexPath) {
        let wallet = tableData[indexPath.section][indexPath.row]
        let commodity = getCommodity(wallet: wallet)
        cell.displayWallet(wallet: wallet, commodity: commodity)
    }
    
    func getCommodity(wallet: Wallet) -> Commodity? {
        if wallet.type == .wallet {
            let commodity = commodities.first{$0.id == wallet.attributes?.cryptocoinID }
            return commodity
        } else if wallet.type == .fiatwallet {
            let commodity = commodities.first{$0.id == wallet.attributes?.fiatID && $0.type == .fiat }
            return commodity
        }
        return nil
    }
}
