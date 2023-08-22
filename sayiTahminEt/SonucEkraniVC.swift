//
//  SonucEkraniVC.swift
//  sayiTahminEt
//
//  Created by basribocek on 22.08.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç"

        if sonuc == true{
            SonucLabel.text = "Kazandınız"
          
            SonucImageView.image = UIImage(named: "happy")
        }
        else{
            SonucLabel.text = "Kaybettiniz"
            SonucImageView.image = UIImage(named: "sad")
        }
    }
    var sonuc:Bool?
    @IBOutlet weak var SonucImageView: UIImageView!
  
    @IBOutlet weak var SonucLabel: UILabel!
    
    @IBAction func tekrarOyna(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
