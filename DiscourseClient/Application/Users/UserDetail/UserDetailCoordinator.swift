//
//  UserDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

final class UserDetailCoordinator: Coordinator {
    
    var navigator: UINavigationController
    let userName: String
    
    
    init(navigator: UINavigationController, userName: String ) {
        self.navigator = navigator
        self.userName = userName
        //self.userId = userId
      
    }
    
    func start() {
        let userDetailVM = UserDetailViewModel(username: userName, coordinator: self)
        let userDetailVC = UserDetailViewController(viewModel: userDetailVM)
        userDetailVC.title = "User detail"
        
        // SI ES POR PROTOCOLO AÑADIR EL VIEWMODEL.VIEW = VIEWCONTROLLER
       
        navigator.pushViewController(userDetailVC, animated: true)
    }
}
