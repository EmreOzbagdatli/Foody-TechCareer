//
//  FoodCardViewController.swift
//  Foody
//
//  Created by Emre Özbağdatlı on 20.10.2023.
//

import UIKit

class FoodCardViewController: UIViewController {
    
   var viewModel = FoodCardViewModel()
    var cartFoods: [FoodsCart] = []
    var cartFoodsTwo: FoodsCartResponse = FoodsCartResponse()

    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cartTableView.dataSource = self
        cartTableView.delegate = self

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
          viewModel.showCart(kullaniciAdi: "mali") { [weak self] in
              self?.cartTableView.reloadData()
        
          }
      }
   
}




extension FoodCardViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sepetYemekListesi.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        let yemekDetay = viewModel.sepetYemekListesi[indexPath.row]
  
        cell.cartPrice.text = yemekDetay.yemek_fiyat
        cell.cartFoodName.text = yemekDetay.yemek_adi
 
       
               if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemekDetay.yemek_resim_adi!)") {
                   DispatchQueue.main.async {
                       cell.cartImageView.kf.setImage(with: url)
                       
                   }
               }

        return cell
    }
}
