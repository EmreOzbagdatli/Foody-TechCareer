//
//  FoodListViewModel.swift
//  Foody
//
//  Created by Emre Özbağdatlı on 10.10.2023.
//

import Foundation


class FoodListViewModel {

    var delegate: FoodListViewModelDelegate!
    
    func getFoods(){

        FoodListManager.shared.getFoods { [weak self] result in
            switch result {
            case .success(let response):
                if let yemekler = response.yemekler {
                    self?.delegate.show(foods: yemekler)
                }
            case .failure(let error):
                print(error)
            }
        }



    }

}

protocol FoodListViewModelDelegate {
    func show(foods: [Foods])
}
