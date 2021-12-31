//
//  CategoryDetailViewModel.swift
//  DiscourseClient
//
//  Created by Guido Mola on 30/12/2021.
//

import Foundation


protocol CategoryDetailProtocol:AnyObject{
    func onCategoryFetched(category: Category )
    func onCategoryFetchedError()
}

class CategoryDetailViewModel: ViewModel{
    
    private var category = [Category]()
    weak var delegate : CategoryDetailProtocol?
    let coordinator : CategoryDetailCoordinator
    var id : Int
    
    init(id: Int, coordinator: CategoryDetailCoordinator) {
        self.id = id
        self.coordinator = coordinator
    }
    
    
    
    func fetchCategory(){
        let categoryDetailRequest = CategoryDetailRequest(id: id)
        session.request(request: categoryDetailRequest) { [weak self] result  in
            //Preguntar
            guard let self = self else {return}
            switch result {
                case .success(let response):
                    guard let response = response else { return }
                    self.category = [response.category]
                    self.delegate?.onCategoryFetched(category: response.category)
                case .failure:
                    self.delegate?.onCategoryFetchedError()
            }
        }
    }
    
}
