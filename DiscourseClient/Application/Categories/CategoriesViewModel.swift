//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

protocol CategoryViewProtocol: AnyObject{
    func OnCategoryFetched()
    func OnCategoryFetchedError()
    
}

final class CategoriesViewModel: ViewModel {
    
    private var categories = [Category]()
    weak var view : CategoryViewProtocol?
    let coordinator: CategoriesCoordinator
    
    init(coordinator: CategoriesCoordinator){
        self.coordinator = coordinator
    }
    
    
    var categoriesCount: Int {
        return categories.count
    }
    
    func fetchCategories(){
        let request = CategoryRequest()
        session.request(request: request) { [weak self] result  in
            guard let self = self else { return }
            switch result{
                case .success(let response):
                    guard let categoryList = response?.categoryList.categories else { return }
                    self.categories = categoryList
                    self.view?.OnCategoryFetched()
                    print(self.categories)

                case.failure:
                    self.view?.OnCategoryFetchedError()
            }
        }
    }
    
    func category(from row: Int) -> Category {
        return categories[row]
    }
    
    func didSelectRowAt(at row: Int) {
        coordinator.didSelect(categoryId: categories[row].id)
   
    
}
}
