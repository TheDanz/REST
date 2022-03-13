//
//  ViewController.swift
//  REST
//
//  Created by Danil Ryumin on 13.03.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func OK_Click(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        viewController.ID = textField.text ?? "0"
        guard let navigator = navigationController else { return }
        navigator.pushViewController(viewController, animated: true)
    }
}

