//
//  AssetTableViewCell.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import UIKit
import Kingfisher

class AssetTableViewCell: UITableViewCell, AssetsCellView {
    
    //MARK: IBOutlets
    @IBOutlet weak private var assetIconImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var symbolLabel: UILabel!
    @IBOutlet weak private var averagePriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayCommodity(commodity: Commodity) {

        if let name = commodity.attributes?.name {
            nameLabel.text = name
        }
        
        if let symbol = commodity.attributes?.symbol {
            symbolLabel.text = symbol
        }
                
        if let price = commodity.attributes?.avgPrice, let precision = commodity.attributes?.precisionForFiatPrice {
            if let intDouble = Double(price) {
                let conformedPrice = String(format: "%.\(precision)f", locale: Locale.current, intDouble)
                averagePriceLabel.text = "\(conformedPrice) €"
            }
        } else {
            averagePriceLabel.text = ""
        }
    
        if let logoLight = commodity.attributes?.logo, let logoDark = commodity.attributes?.logoDark {
            let url = URL(string: self.traitCollection.userInterfaceStyle == .dark ? logoDark : logoLight)
            assetIconImageView.kf.setImage(with: url, options: [.processor(SVGImgProcessorHelper())])
        }
    }
}
