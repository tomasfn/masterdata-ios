//
//  AssetsViewController.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import UIKit

class AssetsViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: Public Properties
    lazy var viewModel: AssetsViewModel = {
        return AssetsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Assets"
        initViewModel()
        setUpTable()
    }
    
    private func initViewModel() {
        viewModel.setView(view: self)
        viewModel.fetchLocalData()
        viewModel.reloadTableViewClosure = { [weak self] () in
           DispatchQueue.main.async {
              self?.tableView.reloadData()
           }
        }
    }
}
