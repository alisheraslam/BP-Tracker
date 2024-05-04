//
//  DisclaimerVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 18/04/2024.
//

import UIKit

class DisclaimerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Actions
    @IBAction func continueButton(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MeasurementVC") as? MeasurementVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
