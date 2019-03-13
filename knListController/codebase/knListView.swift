//
//  ListView.swift
//  Ogenii
//
//  Created by Ky Nguyen Coinhako on 7/20/18.
//  Copyright © 2018 Ogenii. All rights reserved.
//

import UIKit

class knListCell<U>: knTableCell {
    var data: U?
}

class knListController<C: knListCell<U>, U>: knController, UITableViewDataSource, UITableViewDelegate {
    var datasource = [U]() { didSet { tableView.reloadData() }}
    fileprivate let cellId = String(describing: C.self)
    var rowHeight = UITableView.automaticDimension
    var contentInset: UIEdgeInsets?
    
    lazy var tableView: UITableView = { [weak self] in
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.dataSource = self
        tb.delegate = self
        tb.separatorStyle = .none
        return tb
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(C.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100

        setupView()
        view.backgroundColor = .white
    }
    
    override func setupView() {
        if let inset = contentInset {
            tableView.contentInset = inset
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCell(at: indexPath)
    }
    
    func getCell(at index: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: index) as! C
        cell.data = datasource[index.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(at: indexPath)
    }
    func didSelectRow(at indexPath: IndexPath) { }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat { return 0 }
}


class knController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    func setupView() { }
    func fetchData() { }
    deinit {
        print("Deinit \(NSStringFromClass(type(of: self)))")
    }
}
