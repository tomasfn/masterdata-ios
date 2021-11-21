//
//  ImageProcessorHelper.swift
//  masterdata
//
//  Created by Tomas Fernandez Velazco on 20/11/21.
//

import UIKit
import Kingfisher
import SVGKit

public struct SVGImgProcessorHelper:ImageProcessor {
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
