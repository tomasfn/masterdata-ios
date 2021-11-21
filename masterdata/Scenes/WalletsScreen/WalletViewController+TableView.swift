//
//  WalletViewController+TableView.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import Foundation
import UIKit

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTable() {
        tableView.sectionIndexColor = .blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: GeneralWalletTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: GeneralWalletTableViewCell.nameOfClass)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableData[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GeneralWalletTableViewCell.nameOfClass, for: indexPath) as! GeneralWalletTableViewCell
        viewModel.configureCell(cell: cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getCurrentTitleHeader(section: section)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableData[section].count
    }
}
