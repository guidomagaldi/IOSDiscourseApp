//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

final class UsersViewModel: ViewModel {
    
    private var directoryItems = [DirectoryItem]()
  
    let coordinator: UsersCoordinator
    
    var onUserListSuccess: (() -> Void)?
    var onUserListError: ((String) -> Void)?
    
    init(coordinator: UsersCoordinator){
        self.coordinator = coordinator
    }
    
    func fetchUsers(){
        let userRequest = UserRequest()
        session.request(request: userRequest) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    // LLAMAMOS AL QUE IMPLEMENTA EL CLOSURE
                    guard let response = response else { return }
                    self.directoryItems = response.directoryItems
                    
                    self.onUserListSuccess?()
                case .failure(let error):
                    // LLAMAMOS AL QUE IMPLEMENTA EL CLOSURE
                    self.onUserListError?(error.localizedDescription)
            }        }
    }
    
    var userCount: Int {
        return directoryItems.count
    }
    
    func getUser(at index: IndexPath) -> DirectoryItem {
        return self.directoryItems[index.row]
    }
    
    func didSelectRowAt(at row: Int) {
        coordinator.didSelect(userName: directoryItems[row].user.username)
    }
}



