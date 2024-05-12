//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by İremsu Pala on 18.03.2024.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var kisiAdtf: UITextField!
    @IBOutlet weak var kisiTeltf: UITextField!
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func kaydetButonu(_ sender: Any) {
        
        if let ka = kisiAdtf.text, let kt = kisiTeltf.text {
            kaydet(kisi_ad: ka, kisi_tel: kt)
        }
    }
    func kaydet (kisi_ad: String, kisi_tel:String) {
        viewModel.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
