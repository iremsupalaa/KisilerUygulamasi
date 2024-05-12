//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by İremsu Pala on 12.05.2024.
//

import Foundation
import RxSwift
class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    func kaydet (kisi_ad: String, kisi_tel:String) {
        print("Kişi Kaydet: \(kisi_ad) - \(kisi_tel)")
    }
    func guncelle(kisi_ad: String, kisi_id: Int, kisi_tel:String) {
        print("Kişi Güncelle: \(kisi_ad) - \(kisi_tel) - \(kisi_id)")
    }
    func ara(aramaKelimesi:String) {
        print("Kişi Ara: \(aramaKelimesi)")
    }
    func sil(kisi_id:Int) {
        print("Kişi Sil: \(kisi_id)")
        kisileriYukle()//silme işleminden sonra anasayfaya dönüldügünde tekrar kişilerin listelenmesi için
    }
    func kisileriYukle() {
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_ad: "Ahmet", kisi_id: 111, kisi_tel: "12345")
        let k2 = Kisiler(kisi_ad: "İrem", kisi_id: 222, kisi_tel: "23456")
        let k3 = Kisiler(kisi_ad: "Kadir", kisi_id: 333, kisi_tel: "34567")
        let k4 = Kisiler(kisi_ad: "Cansu", kisi_id: 444, kisi_tel: "45678")
        
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        liste.append(k4)
        kisilerListesi.onNext(liste)  //kisileriYukle fonksiyonu çalıştıgında bu yapıyı tetikleyeek ve bir önceki katmana (View Model) göndermemiz gerekecek.
       
        
    }
}
