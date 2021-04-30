//
//  CustomSimpleScanViewController.swift
//  CardScanUICustomizationExample
//
//  Created by Jaime Park on 4/30/21.
//

import CardScan
import Foundation
import UIKit

class CustomSimpleScanViewController: SimpleScanViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: -- Background UI --
    override public func setupBlurViewUi() {
        super.setupBlurViewUi()
        blurView.backgroundColor = #colorLiteral(red: 0.4303786599, green: 1, blue: 0.8281913605, alpha: 0.4982385928)
    }
    
    // MARK: -- ROI UI --
    override public func setupRoiViewUi() {
        super.setupRoiViewUi()
        regionOfInterestCornerRadius = 0.0
    }
    
    // MARK: -- Description UI --
    override public func setupDescriptionTextUi() {
        super.setupDescriptionTextUi()
        descriptionText.text = "Description Text"
        descriptionText.font = UIFont.italicSystemFont(ofSize: 20.0)
        descriptionText.textColor = UIColor.blue
    }
    
    // MARK: -- Close UI --
    override public func setupCloseButtonUi() {
        super.setupCloseButtonUi()
        closeButton.setTitle("", for: .normal)
        closeButton.setImage(UIImage(named: "back_arrow"), for: .normal)
    }
    
    // MARK: -- Torch UI --
    override public func setupTorchButtonUi() {
        super.setupTorchButtonUi()
        torchButton.setTitle("", for: .normal)
        torchButton.setImage(UIImage(named: "flash_on"), for: .normal)
    }
    
    override func torchButtonPress() {
        super.torchButtonPress()
        
        if isTorchOn() {
            torchButton.setImage(UIImage(named: "flash_off"), for: .normal)
        } else {
            torchButton.setImage(UIImage(named: "flash_on"), for: .normal)
        }
    }
    
    // MARK: -- Permissions UI --
    override public func setupDenyUi() {
        super.setupDenyUi()
        let text = "Enable Camera Access Button"
        let font = UIFont.systemFont(ofSize: 20.0)
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.purple, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: text.count))

        enableCameraPermissionsButton.setAttributedTitle(attributedString, for: .normal)
        
        enableCameraPermissionsText.text = "Enable Camera Permission Text"
        enableCameraPermissionsText.textColor = UIColor.purple
        enableCameraPermissionsText.textAlignment = .center
    }
    
    //MARK: -- Card Detail UI --
    override public func setupCardDetailsUi() {
        super.setupCardDetailsUi()
        numberText.textColor = UIColor.green
        expiryText.textColor = UIColor.green
        nameText.textColor = UIColor.green
    }
}
