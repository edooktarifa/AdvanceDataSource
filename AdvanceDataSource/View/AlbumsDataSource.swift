//
//  AlbumsDataSource.swift
//  AdvanceDataSource
//
//  Created by Phincon on 20/04/23.
//

import Foundation
import UIKit

class AlbumsListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var dataSource = [Album]()
    weak var delegateAlbums: AlbumsListDataSourceDelegate?
    
    func updateAlbums(_ albums: [Album]) {
        self.dataSource = albums
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") else { return UITableViewCell() }
        reusableCell.textLabel?.text = dataSource[indexPath.row].title
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegateAlbums?.didSelectAlbums(album: dataSource[indexPath.row])
    }
}
