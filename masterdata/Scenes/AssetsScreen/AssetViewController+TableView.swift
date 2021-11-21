//
//  AssetViewController+TableView.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import Foundation
import UIKit

extension AssetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: AssetTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: AssetTableViewCell.nameOfClass)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCommoditiesCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AssetTableViewCell.nameOfClass, for: indexPath) as! AssetTableViewCell
        viewModel.configureCell(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createHeaderFilterView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
    
    //MARK: Filter Assets Header
    private func createHeaderFilterView() -> UIView {
        let filterView: FilterHeaderView = FilterHeaderView.fromNib()
        filterView.filterCrypto.addTarget(self, action: #selector(showOnlyCrypto), for: .touchUpInside)
        filterView.filterCommodities.addTarget(self, action: #selector(showOnlyCommodity), for: .touchUpInside)
        filterView.filterFiat.addTarget(self, action: #selector(showOnlyFiat), for: .touchUpInside)
        return filterView
    }
}
