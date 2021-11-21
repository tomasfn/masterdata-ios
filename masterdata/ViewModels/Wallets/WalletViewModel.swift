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
    private var commodities: [Commodity] = [Commodity]()
    var tableData: [[Wallet]] = [[Wallet]]()

    func setView(view: WalletsView) {
        self.view = view
    }
    
    func fetchLocalData() {
        guard let commodities = DataManager.dataForAssets() else { return }
        guard let wallets = DataManager.dataWallets() else { return }
        guard let commodityWallets = DataManager.dataCommodityWallets() else { return }
        guard let fiatWallets = DataManager.dataFiatWallets() else { return }
        
        tableData = [applyWalletsOrder(wallets: wallets), applyWalletsOrder(wallets: commodityWallets), applyWalletsOrder(wallets: fiatWallets)]
        self.commodities = commodities
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
