//
//  ViewController.swift
//  Technology Assessment - Task
//
//  Created by Mustafa on 27/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {

    //Declare properties here ..
    @IBOutlet weak var articlesTableView: UITableView! {
        didSet {
            articlesTableView.dataSource = self
            articlesTableView.delegate = self
        }
    }
    
    //Declare instance variables here ..
    private var popularArticlesArray: [MostPopularArticlesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.articlesTableView.estimatedRowHeight = 400
        self.articlesTableView.rowHeight = UITableView.automaticDimension
        
        requestAPIData()
    }
    
    
    //MARK: - Networking
    func requestAPIData() {
        let url = APIEndpoints.baseURL + APIEndpoints.mostPopularArticlesApi + APIKey.ApiKey
        Request.requestMostPopularArticleData(url: url) {
            success, response, error in
            if success {
                if let response = response {
                    if response["status"] == "OK" {
                        print(response)
                        for dict in response["results"].arrayValue {
                            let articleList = MostPopularArticlesModel(json: dict)
                            self.popularArticlesArray.append(articleList)
                        }
                        
                        DispatchQueue.main.async {
                         self.articlesTableView.reloadData()
                        }
                        
                        
                        
                    }
                }
                
            }
        }
    }
    
    
    //MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVCSegue" {
            if let VC = segue.destination as? DetailViewController {
                if let indexPath = articlesTableView.indexPathForSelectedRow {
                    VC.imageURL = popularArticlesArray[indexPath.row].images[0].url
                    VC.articleTitle = popularArticlesArray[indexPath.row].title
                    VC.articleDesc = popularArticlesArray[indexPath.row].desc
                }
            }
        }
    }


}

//MARK: - Tableview data source
extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularArticlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleTableViewCell
        
        cell.articleImageView.imageWithURL(url: popularArticlesArray[indexPath.row].images[0].url)
        cell.titleLabel.text = popularArticlesArray[indexPath.row].title
        cell.authorLabel.text = popularArticlesArray[indexPath.row].author
        cell.dateLabel.text = popularArticlesArray[indexPath.row].date
        
        return cell
    }
}

//MARK: - Tableview delegate
extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailVCSegue", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

