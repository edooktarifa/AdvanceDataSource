//
//  ViewController.swift
//  AdvanceDataSource
//
//  Created by Phincon on 20/04/23.
//

import UIKit

protocol AlbumsListDataSourceDelegate: AnyObject {
    func didSelectAlbums(album: Album)
}

class ViewController: UIViewController, AlbumsListDataSourceDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = AlbumsListDataSource()
    private var viewModel = AlbumsViewModel()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTable()
        fetchData()
        setupRefreshControl()
    }
    
    func setupTable(){
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        dataSource.delegateAlbums = self
    }
    
    func setupRefreshControl(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
          refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
          tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        fetchData()
        refreshControl.endRefreshing()
    }
    
    func fetchData(){
        viewModel.fetchData { albums
            in
            self.dataSource.updateAlbums(albums)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func didSelectAlbums(album: Album) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

