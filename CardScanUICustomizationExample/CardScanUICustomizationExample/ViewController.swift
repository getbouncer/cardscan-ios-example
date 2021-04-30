//
//  ViewController.swift
//  CardScanUICustomizationExample
//
//  Created by Jaime Park on 4/30/21.
//

import CardScan
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func customSimpleScanButtonPress(_ sender: Any) {
        let simpleScanVC = CustomSimpleScanViewController()
        simpleScanVC.delegate = self
        present(simpleScanVC, animated: true, completion: nil)
    }
    
    @IBAction func customScanViewButtonPress(_ sender: Any) {
        guard let scanVC = ScanViewController.createViewController(withDelegate: self) else {
            return
        }
        
        scanVC.stringDataSource = self
        
        scanVC.backButtonColor = UIColor.red
        scanVC.hideBackButtonImage = true
        scanVC.backButtonImageToTextDelta = 8.0
        
        scanVC.backButtonFont = UIFont(name: "Verdana", size: CGFloat(17.0))
        scanVC.scanCardFont = UIFont(name: "Chalkduster", size: CGFloat(24.0))
        scanVC.positionCardFont = UIFont(name: "Chalkduster", size: CGFloat(17.0))
        scanVC.skipButtonFont = UIFont(name: "Chalkduster", size: CGFloat(17.0))
        scanVC.cornerColor = UIColor.blue
        
        scanVC.torchButtonImage = ScanViewController.cameraImage()
        scanVC.torchButtonSize = CGSize(width: 44, height: 44)
        present(scanVC, animated: true, completion: nil)
    }
}

// MARK: SimpleScanViewController Delegate
extension ViewController: SimpleScanDelegate {
    func userDidCancelSimple(_ scanViewController: SimpleScanViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func userDidScanCardSimple(_ scanViewController: SimpleScanViewController, creditCard: CreditCard) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: ScanViewController Delegates
extension ViewController: ScanDelegate, FullScanStringsDataSource {
    // MARK: - Scan Delegate Logic
    func userDidCancel(_ scanViewController: ScanViewController) {
        dismiss(animated: true, completion: nil )
    }
    
    func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
        dismiss(animated: true, completion: nil)
    }
    
    func userDidSkip(_ scanViewController: ScanViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - ScanViewController: Full Scan String Data Source Logic
    func scanCard() -> String { return "New Scan Card" }
    func positionCard() -> String { return "New Position Card" }
    func backButton() -> String { return "New Back" }
    func skipButton() -> String { return "New Skip" }
    func denyPermissionTitle() -> String { return "New Deny" }
    func denyPermissionMessage() -> String { return "New Deny Message" }
    func denyPermissionButton() -> String { return "GO" }
}
