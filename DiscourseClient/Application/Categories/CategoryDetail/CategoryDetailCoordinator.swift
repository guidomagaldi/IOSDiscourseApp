//
//  CategoryDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Guido Mola on 30/12/2021.
//

import UIKit

final class CategoryDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    var categoryId: Int
    
    init(navigator: UINavigationController, categoryId: Int ) {
        self.navigator = navigator
        self.categoryId = categoryId
        
    }
    
    func start() {
        let categoryDetailVM = CategoryDetailViewModel(id: categoryId, coordinator: self)
        let categoryDetailVC = CategoryDetailViewController(viewModel: categoryDetailVM)
        categoryDetailVC.title = "User detail"
        categoryDetailVM.delegate = categoryDetailVC
        
        // SI ES POR PROTOCOLO AÑADIR EL VIEWMODEL.VIEW = VIEWCONTROLLER
        
        navigator.pushViewController(categoryDetailVC, animated: true)
    }
}
