//
//  FoodCardViewModel.swift
//  Foody
//
//  Created by Emre Özbağdatlı on 22.10.2023.
//

import Foundation
import Alamofire

class FoodCardViewModel {

    var sepetYemekListesi = [FoodsCart]()

    func showCart(kullaniciAdi: String, completion: @escaping () -> Void) {
        let params: Parameters = ["kullanici_adi": kullaniciAdi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(FoodsCartResponse.self, from: data)
                    if let list = response.sepet_yemekler {
                        self.sepetYemekListesi = list
                        completion()
                    }

                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func removeFromCart(cart: FoodsCart, comletionHandler: @escaping () -> Void) {
        if let cartID = Int(cart.sepet_yemek_id ?? "0") {
            FoodListManager.shared.removeFromCart(sepetYemekID: cartID, kullaniciAdi: "mali") { result in
                self.showCart(kullaniciAdi: "mali") {
                    comletionHandler()
                }
            }
        }

    }
}
