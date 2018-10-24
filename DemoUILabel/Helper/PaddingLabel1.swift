//
//  PaddingLabel1.swift
//  PaddingLabel1
//
//  Created by MTQ on 10/23/18.
//  Copyright © 2018 MTQ. All rights reserved.
//

import UIKit

class PaddingLabel1: UILabel {
    @IBInspectable var topInset: CGFloat = 4.0
    @IBInspectable var bottomInset: CGFloat = 4.0
    @IBInspectable var leftInset: CGFloat = 4.0
    @IBInspectable var rightInset: CGFloat = 4.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
}
