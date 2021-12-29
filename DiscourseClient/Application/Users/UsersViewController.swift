//
//  UsersViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class UsersViewController: UIViewController {
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private var users = [UsersResponse]()
    let viewModel: UsersViewModel
    
    init(viewModel: UsersViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        view.addSubview(table)
        
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        viewModel.fetchUsers()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
    }

    func bindViewModel(){
        viewModel.onUserListSuccess = { [weak self]  in
            self?.hideLoading()
            self?.table.reloadData()
           
            
        }
        viewModel.onUserListError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
        let cell = UITableViewCell()
        let user = viewModel.getUser(at: indexPath)
        cell.textLabel?.text = user.user.name
        
        
              var imageStringURL = "https://mdiscourse.keepcoding.io"
        imageStringURL.append(user.user.avatarTemplate.replacingOccurrences(of: "{size}", with: "100"))
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
           if let url = URL(string: imageStringURL), let data = try? Data(contentsOf: url) {
               DispatchQueue.main.async {
                   cell.imageView?.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
}
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(at: indexPath.row)
    }
}
