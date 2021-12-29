//
//  CategoriesViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    let viewModel: CategoriesViewModel
    
    init(viewModel: CategoriesViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCategories()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .gray
        view.addSubview(table)
        
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}


extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categoriesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let category = viewModel.category(from: indexPath.row)
        cell.textLabel?.text = category.name
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate {
        
    }


extension CategoriesViewController: CategoryViewProtocol{
    func OnCategoryFetched() {
        hideLoading()
        table.reloadData()
        showAlert(title: "success")
    }
    
    func OnCategoryFetchedError() {
        hideLoading()
        showAlert(title: "Error fetching Categories")
    }
    
    
}

