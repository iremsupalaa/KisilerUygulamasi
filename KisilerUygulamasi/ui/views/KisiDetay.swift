//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by İremsu Pala on 18.03.2024.
//

import UIKit

class KisiDetay: UIViewController {
    @IBOutlet weak var kisiAdtf: UITextField!
    @IBOutlet weak var kisiTeltf: UITextField!
    var kisi: Kisiler?
    var viewModel = KisiDetayViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            kisiAdtf.text = k.kisi_ad
            kisiTeltf.text = k.kisi_tel
        }
        
    }
    

    @IBAction func guncelleButonu(_ sender: Any) {
        if let ka = kisiAdtf.text,let kt = kisiTeltf.text , let k = kisi {
            viewModel.guncelle(kisi_ad: ka, kisi_id: k.kisi_id! , kisi_tel: kt)
            
            
        }
    }
    
    
}
