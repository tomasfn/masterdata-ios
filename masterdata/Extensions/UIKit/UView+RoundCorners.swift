//
//  UView+RoundCorners.swift
//  masterdata (iOS)
//
//  Created by Tomas Fernandez Velazco on 19/11/21.
//

import Foundation
import UIKit

extension UIView {
    
    public func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = radius > 0
    }
    
    public func roundView(updateLayout layoutIfNeeded: Bool = true) {
        if layoutIfNeeded { self.layoutIfNeeded() }
        roundCorners(radius: min(width, height)/2)
    }
    
    public var x: CGFloat {
        get { return origin.x }
        set { origin = CGPoint(x: newValue, y: y) }
    }
    
    public var y: CGFloat {
        get { return origin.y }
        set { origin = CGPoint(x: x, y: newValue) }
    }
    
    public var width: CGFloat {
        get { return size.width }
        set { size = CGSize(width: newValue, height: height) }
    }
    
    public var height: CGFloat {
        get { return size.height }
        set { size = CGSize(width: width, height: newValue) }
    }
    
    public var size: CGSize {
        get { return bounds.size }
        set { frame = CGRect(origin: origin, size: newValue) }
    }
    
    public var origin: CGPoint {
        get { return frame.origin }
        set { frame = CGRect(origin: newValue, size: size) }
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

