//
//  WalletsViewController.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//


import UIKit

class WalletViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Public Properties
    lazy var viewModel: WalletViewModel = {
        return WalletViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wallets"
        initViewModel()
        setUpTable()
    }
    
    private func initViewModel() {
        viewModel.setView(view: self)
        viewModel.fetchLocalData()
        viewModel.reloadTableViewClosure = { [weak self] () in
            self?.reloadTableView()
        }
    }
}
