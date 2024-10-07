//
//  TableViewController.swift
//  Networking HW 2.10.1
//
//  Created by Александр Манжосов on 07.10.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let jsonUrlOne = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=b537443b3a074278a349c4a92e4582cd"
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let article = articles[indexPath.row]
        cell.configure(with: article)

        return cell
    }
 
    
    func fetchData() {
        
        guard let urlOne = URL(string: jsonUrlOne) else { return }
        URLSession.shared.dataTask(with: urlOne) { data, _, _ in
            if let data = data {
                do {
                    let news = try JSONDecoder().decode(Welcome.self, from: data)
                    self.articles = news.articles
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
        
    }
    



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.article = articles[indexPath.row] 
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
