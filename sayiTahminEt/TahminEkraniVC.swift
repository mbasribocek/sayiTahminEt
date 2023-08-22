//
//  TahminEkraniVC.swift
//  sayiTahminEt
//
//  Created by basribocek on 22.08.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {
    @IBOutlet weak var LabelKalanHak: UILabel!
    @IBOutlet weak var TextFieldGirdi: UITextField!
    @IBOutlet weak var yardimciLabel: UILabel!
    
    var rastgeleSayi:Int?
    var kalanHak:Int = 5
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rastgeleSayi = Int.random(in: 1...100)
        print(rastgeleSayi!)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
           let gidilecekVC = segue.destination as! SonucEkraniVC
                gidilecekVC.sonuc = gelenVeri
            }
        
    }
    

    @IBAction func TahminEtButton(_ sender: Any) {
       
        
        LabelKalanHak.text = "Kalan hak \(kalanHak)"
        
        if let veri = TextFieldGirdi.text{
            if let tahmin = Int(veri){
                if kalanHak != 0 {
                    print("kalan hak sıfırdan fazla")
                    if tahmin == rastgeleSayi! {
                        //doğru bilindi
                        yardimciLabel.isHidden = false
                        yardimciLabel.text = "aferin doğru bildin"
                        
                        // sayfa geçişi olacak
                        let sonuc = true
                        performSegue(withIdentifier:"tahminToSonuc", sender: sonuc)
                        
                    }
                    else if tahmin >= rastgeleSayi! {
                        //fazla söylendi
                        yardimciLabel.isHidden = false
                        yardimciLabel.text = "azalt"
                        kalanHak-=1
                    }
                    else if tahmin <= rastgeleSayi! {
                        //az söylendi
                        yardimciLabel.isHidden = false
                        yardimciLabel.text = "arttır"
                        kalanHak-=1
                    }
           
                    
                }
                else{
                    
                    //başarısız sayfasına geçiş
                    let sonuc = false
                    performSegue(withIdentifier:"tahminToSonuc", sender: sonuc)
                    
                    
                }
            }
        }
        TextFieldGirdi.text = ""
        
    }
    

}
