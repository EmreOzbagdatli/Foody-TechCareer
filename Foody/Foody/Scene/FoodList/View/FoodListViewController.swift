//
//  ViewController.swift
//  Foody
//
//  Created by Emre Özbağdatlı on 8.10.2023.
//

import UIKit

class FoodListViewController: UIViewController {

    var viewModel = FoodListViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.delegate = self
        viewModel.getFoods()
    }


}

extension FoodListViewController: FoodListViewModelDelegate {
    func show(foods: [Foods]) {
        print(foods)
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
    }
}

