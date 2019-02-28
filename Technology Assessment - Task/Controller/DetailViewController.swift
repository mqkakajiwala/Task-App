//
//  DetailViewController.swift
//  Technology Assessment - Task
//
//  Created by Mustafa on 27/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //Declare properties here..
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleDetailTableView: UITableView! {
        didSet {
            articleDetailTableView.dataSource = self
            articleDetailTableView.delegate = self
        }
    }
    
    //Declare instance variables here ..
    private let tableHeaderHeight: CGFloat = 300
    public var imageURL: String?
    public var articleTitle: String?
    public var articleDesc: String?
    private var headerView: UIView! {
        didSet {
            headerView.setTableHeaderForStretchyView(tableView: articleDetailTableView, tableHeaderHeight: tableHeaderHeight)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        articleImageView.imageWithURL(url: imageURL!)
        
        headerView = articleDetailTableView.tableHeaderView
        stretchHeaderView()
    }
    
    //MARK: - Utils
    func stretchHeaderView() {
        headerView.frame = headerView.stretchTableHeaderView(tableView: articleDetailTableView, tableHeaderHeight: tableHeaderHeight)
    }
    
    
    
}

//MARK: - Tableview datasource
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        let titleLabel: UILabel = cell.viewWithTag(100) as! UILabel
        let descLabel: UILabel = cell.viewWithTag(200) as! UILabel
        
        if let title = articleTitle,
            let desc = articleDesc {
            titleLabel.text = title
            descLabel.text = desc
        }
        return cell
    }
}

//MARK: - Tableview delegate
extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}

//MARK: - ScrollView delegate
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        stretchHeaderView()
    }
}
