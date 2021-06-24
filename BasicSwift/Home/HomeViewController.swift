//
//  HomeViewController.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 11/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var viewModel: [HomeModel] = []
    fileprivate var models : HomeVM!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupOutlet()
    }
    
    //MARK: -setup outlet
    func setupOutlet(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        models = HomeVM()
        viewModel = models.generateViewModel()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel[indexPath.row].homeTitle
        
        if viewModel[indexPath.row].disclosure == true{
            cell.accessoryType = .disclosureIndicator
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let action = viewModel[indexPath.row].action{
            models.perform(action, with: self)
        }
    }
}
