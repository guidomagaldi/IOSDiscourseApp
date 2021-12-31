//
//  CategoryDetailViewController.swift
//  DiscourseClient
//
//  Created by Guido Mola on 30/12/2021.
//

import Foundation
import UIKit

class CategoryDetailViewController: UIViewController{
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryId: UILabel!

    
    let viewModel : CategoryDetailViewModel
    
    init(viewModel: CategoryDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "CategoryDetailViewController", bundle: nil)
        _ = viewModel.delegate
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCategory()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        
    }
       
}


extension CategoryDetailViewController: CategoryDetailProtocol{
    func onCategoryFetched(category: Category) {
        categoryId.text = "\(category.id)"
        categoryName.text = category.name
        hideLoading()
    }
    
    func onCategoryFetchedError() {
        print("Error")
    }
    
    
}
