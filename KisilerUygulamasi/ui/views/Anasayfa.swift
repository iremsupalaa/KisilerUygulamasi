//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by İremsu Pala on 18.03.2024.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var kisilerTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar! //searchbar protocol ile çalışır.
    var kisilerListesi = [Kisiler]() //arayüzde ne göstereceksek onunla ilgili tanımlama yapmamız gerekir.
    
    var viewModel = AnasayfaViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        _ = viewModel.kisilerListesi.subscribe(onNext: { liste in
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData() //arayüzde değişiklik yapıldı. güncellenmis halin tekrar listelenmesi için
            
        })
    }
    override func viewWillAppear(_ animated: Bool) { //bu metod sayfaya geri dönüldüğünü gösterir. Kişi Detay ve Kişi Güncelle sayfalarından sonra anasayfaya geri döndüğümüz için bu metodu ekledik. Aynı zamanda sayfa ilk açıldıgı zamanda da çalışır. 
        viewModel.kisileriYukle() //Anasayfadan hem detay hem de kayıt sayfalarına gidilip daha sonra tekrar anasayfaya dönüldüğünde tekrar kisilerin yüklenmesi için
    }


    @IBAction func detayButton(_ sender: Any) {
        let kisi = Kisiler(kisi_ad: "iremsu", kisi_id: 111, kisi_tel: "12345")
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
}
extension Anasayfa: UISearchBarDelegate { //anasayfa class'ını genişletmek için extension yapısından faydalandık.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count // bölüm içindeki satır sayısı için numberOfRowSections metodunu kullandık. Kişiler Listesi dizimizdeki eleman sayısı kadar satırımız olacağı için return kısmında kisilerListesi.count la dizideki eleman sayısıını döndürdük.
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        hucre.label1.text = kisi.kisi_ad
        hucre.label2.text = kisi.kisi_tel
        
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) seçildi") //burası biz seçtiğimiz satırın indexini gösterir.
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {contextual,view,bool in
            let kisi = self.kisilerListesi[indexPath.row] // artık sil dediğimizde bize kişiler nesnesini verecek
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) 'i silmek istediğine emin misin?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "Hayır,silme", style: .destructive)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet,sil", style: .cancel) { action in //silmek istediğimizde konsola yazdırmak için action in ekledik.
                self.viewModel.sil(kisi_id: kisi.kisi_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}



