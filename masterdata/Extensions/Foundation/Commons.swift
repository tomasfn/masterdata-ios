//
//  Commons.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 17/11/21.
//

import Foundation
import UIKit

extension NSObject {
    public class var nameOfClass: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}



