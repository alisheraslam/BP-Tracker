//
//  AccountInfoVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 18/04/2024.
//

import UIKit

class AccountInfoVC: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Actions
    @IBAction func saveButton(_ sender: UIButton) {
        if !(ageTextField.text?.isEmpty ?? true) {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DisclaimerVC") as? DisclaimerVC {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            self.showAlert(title: "Alert", message: "Please Enter Your Age")
        }
    }
    @IBAction func maleCheckBtn(_ sender: UIButton) {
        maleButton.setImage(UIImage(named: "CheckFill"), for: .normal)
        femaleButton.setImage(UIImage(named: "Check"), for: .normal)
    }
    @IBAction func femaleCheckBtn(_ sender: UIButton) {
        femaleButton.setImage(UIImage(named: "CheckFill"), for: .normal)
        maleButton.setImage(UIImage(named: "Check"), for: .normal)
    }
}
