//
//  Kisiler.swift
//  KisilerUygulamasi
//
//  Created by İremsu Pala on 18.03.2024.
//

import Foundation

class Kisiler {
    
    var kisi_ad : String?
    var kisi_id : Int?
    var kisi_tel : String?
    
    init() {
        
    }
    
    init(kisi_ad: String, kisi_id: Int, kisi_tel: String) {
        self.kisi_ad = kisi_ad
        self.kisi_id = kisi_id
        self.kisi_tel = kisi_tel
    }
    
}
