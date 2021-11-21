//
//  WalletViewController+ViewModel.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import Foundation
import UIKit

extension WalletViewController: WalletsView {
        
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(message: String) {
        showAlertDialog(title: "error", message: message)
    }    
}
