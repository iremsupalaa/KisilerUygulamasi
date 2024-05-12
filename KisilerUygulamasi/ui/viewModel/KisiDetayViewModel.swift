//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by İremsu Pala on 12.05.2024.
//

import Foundation

class KisiDetayViewModel {
    var krepo = KisilerDaoRepository()
    func guncelle(kisi_ad: String, kisi_id: Int, kisi_tel:String) {
        print("Kişi Güncelle: \(kisi_ad) - \(kisi_tel) - \(kisi_id)")
    }
}
