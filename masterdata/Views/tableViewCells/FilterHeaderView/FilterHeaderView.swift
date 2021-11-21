//
//  FilterHeaderView.swift
//  masterdata
//
//  Created by Tomas Fernandez Velazco on 20/11/21.
//

import Foundation
import UIKit

class FilterHeaderView: UIView {
    
    //MARK: IBOutlets
    @IBOutlet weak var filterCommodities: UIButton!
    @IBOutlet weak var filterCrypto: UIButton!
    @IBOutlet weak var filterFiat: UIButton!
    
    @IBOutlet weak private var containerStackView: UIStackView!

    override func awakeFromNib() {
        setView()
    }
    
    private func setView() {
        filterCrypto.setTitle("Crypto", for: .normal)
        filterCommodities.setTitle("Commodities", for: .normal)
        filterFiat.setTitle("Fiat", for: .normal)
    }
}
