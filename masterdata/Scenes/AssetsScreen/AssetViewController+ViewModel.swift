//
//  AssetViewController+ViewModel.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import Foundation
import UIKit

extension AssetsViewController: AssetsView {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func showOnlyCrypto() {
        showOnlyAssetType(assetType: .cryptocoin)
    }
    
    @objc func showOnlyCommodity() {
        showOnlyAssetType(assetType: .commodity)
    }
    
    @objc func showOnlyFiat() {
        showOnlyAssetType(assetType: .fiat)
    }
    
    func showOnlyAssetType(assetType: AssetTypeNameEnum) {
        viewModel.filterTableViewFor(asseType: assetType)
    }
    
    func showError(message: String) {
        showAlertDialog(title: "error", message: message)
    }
}
