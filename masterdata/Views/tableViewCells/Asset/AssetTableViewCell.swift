//
//  AssetTableViewCell.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import UIKit
import Kingfisher

class AssetTableViewCell: UITableViewCell, AssetsCellView {
    
    @IBOutlet weak private var assetIconImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var symbolLabel: UILabel!
    @IBOutlet weak private var averagePriceLabel: UILabel!
    
    //PRICE:::
    
//    - Each price must have the number of decimals described by precision for fiat price (see cryptocoin/commodity properties in the Masterdata). OK
//    - Each price must also show the fiat symbol, as the prices are in euro fiat. OK
//    - Each price must take the regional location of the device into account for formatting. For example 1298.99 euros in Austria would be formatted to 1.298,99 € but in the USA, it would be formatted to $1,298.99. OK

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
