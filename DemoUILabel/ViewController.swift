//
//  ViewController.swift
//  DemoUILabel
//
//  Created by MTQ on 10/22/18.
//  Copyright © 2018 MTQ. All rights reserved.
//

import UIKit

/**
 * Text Color
 * NSAttributedString.Key.foregroundColor: UIColor.blue
 */

/**
 * Background Color
 * NSAttributedString.Key.backgroundColor: UIColor.yellow
 */

/**
 * Font
 * NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)
 */

/**
 * UnderlineStyle
 * NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
 */

/**
 * UnderlineColor
 * NSAttributedString.Key.underlineColor: UIColor.red
 */

/**
 * Shadow
 * let myShadow = NSShadow()
 * myShadow.shadowBlurRadius = 3.0
 * myShadow.shadowOffset = CGSize(width: 3, height: 3)
 * myShadow.shadowColor = UIColor.gray
 * NSAttributedString.Key.shadow: myShadow
 */


class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var label2: UILabel!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var label3: UILabel!
    @IBOutlet private weak var label4: UILabel!
    @IBOutlet private weak var label5: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Label
        let myString = "Swift Attributed String"
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3.0
        myShadow.shadowOffset = CGSize(width: 3, height: 3)
        myShadow.shadowColor = UIColor.gray
        let myAttribute: [NSAttributedString.Key : Any] = [NSAttributedString.Key.backgroundColor: UIColor.yellow,
                           NSAttributedString.Key.foregroundColor: UIColor.blue,
                           NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
                           NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                           NSAttributedString.Key.underlineColor: UIColor.red,
                           NSAttributedString.Key.shadow: myShadow
        ]

        let myAttrString = NSMutableAttributedString(string: myString, attributes: myAttribute)
        label.attributedText = myAttrString
        
        
        // MARK: - Label2
        let attributedString = NSMutableAttributedString(string:"I love stackoverflow! stackoverflow")
        let linkWasSet = attributedString.setAsLink(textToFind: "stackoverflow", linkURL: "https://www.google.com")
        attributedString.setUnderline(textToFind: "stackoverflow")
        attributedString.setUnderline(textToFind: "stackoverflow")
        
        label2.attributedText = attributedString
        textView.attributedText = attributedString
        textView.delegate = self
        
        
        // MARK: - Label3
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.red,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeWidth: 10.0,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)
        ]
        label3.attributedText = NSAttributedString(string: "Your outline text", attributes: strokeTextAttributes)

        // MARK: - Label4
        let attributedString1 = NSMutableAttributedString(string: "The attributedText property allows you to control the appearance of individual characters and groups of characters, using the NSAttributedString API.")
        attributedString1.setTextColor(textToFind: "attributedText", textColor: .red)
        attributedString1.setStyleText(textToFind: "you", font: UIFont.boldSystemFont(ofSize: 20))
        attributedString1.setBackgroundColor(textToFind: "appearance of individual characters and groups of characters, using the NSAttributedString API.", backgroundColor: .orange)
        
        label4.attributedText = attributedString1
        label4.textAlignment = .center
        label4.adjustsFontSizeToFitWidth = true
        label4.allowsDefaultTighteningForTruncation = true
        label4.minimumScaleFactor = 0.7
        label4.numberOfLines = 0
        
        // MARK: - Label5
        label5.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label5.isEnabled = false
        label5.textColor = .red
        label5.isHighlighted = true
        label5.highlightedTextColor = .blue
        label5.adjustsFontSizeToFitWidth = true
        label5.text = "TESTEST TS"
        label5.textAlignment = .left
        label5.shadowOffset = CGSize(width: 1, height: 1)
        label5.shadowColor = UIColor.gray
    
        label5.isUserInteractionEnabled = true
        label5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
    }
    
    @objc func onTap() {
        print("Hello")
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
}
