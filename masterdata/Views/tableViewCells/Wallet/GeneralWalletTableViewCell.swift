//
//  WalletTableViewCell.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import UIKit
import Kingfisher

class GeneralWalletTableViewCell: UITableViewCell, WalletsCellView {

    //MARK: IBOutlets
    @IBOutlet weak private var walletName: UILabel!
    @IBOutlet weak private var assetSymbolLabel: UILabel!
    @IBOutlet weak private var assetIconImageView: UIImageView!
    @IBOutlet weak private var balanceLabel: UILabel!
    @IBOutlet weak private var isDefaultImageIndicatorView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayWallet(wallet: Wallet, commodity: Commodity?) {

        if let balance = wallet.attributes?.balance {
            balanceLabel.text = balance
        }
        
        if let name = wallet.attributes?.name {
            walletName.text = name
        }
        
        if let assetIconLight = commodity?.attributes?.logo, let assetIconDark = commodity?.attributes?.logoDark {
            let url = URL(string: self.traitCollection.userInterfaceStyle == .dark ? assetIconDark : assetIconLight)
            assetIconImageView.kf.setImage(with: url, options: [.processor(SVGImgProcessorHelper())])
        }
        
        if let isDefaultWallet = wallet.attributes?.isDefault {
            isDefaultImageIndicatorView.image = isDefaultWallet ? UIImage.init(named: "tick") : UIImage()
        }
                        
        if commodity?.type == .fiat {
            assetSymbolLabel.text = commodity?.attributes?.symbolCharacter
            backgroundColor = UIColor(red: 0.75, green: 0.85, blue: 0.86, alpha: 1.00)
        } else {
            assetSymbolLabel.text = wallet.attributes?.cryptocoinSymbol
            backgroundColor = UIColor.init(named: "backgroundColor")
        }
    }
}

