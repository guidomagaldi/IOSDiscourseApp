//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

protocol UserDetailProtocol: AnyObject{
    func onUserFetched()
    func onUserFetchedError()
}

final class UserDetailViewModel: ViewModel {
    
    private var user = [UserDetail]()
    weak var view : UserDetailProtocol?
    var username: String
    var userId : Int?
    let coordinator: UserDetailCoordinator
    
    
    init(username: String, coordinator: UserDetailCoordinator) {
        self.username = username
        
        self.coordinator = coordinator
    }
    
    func fetchUserDetail() {
        let userDetailRequest = UserDetailRequest(username: username)
      session.request(request: userDetailRequest) { [weak self] result in
            guard let self = self else { return }
          switch result{
              case .success(let response):
                  guard let response = response else { return }
                  self.username = response.username
                  self.userId = response.id
                  self.view?.onUserFetched()
                  print(response)
              case.failure:
                  self.view?.onUserFetchedError()
                  print("Error en fetchUser")
          }

       }
    }
}
