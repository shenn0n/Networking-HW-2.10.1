//
//  TableViewCell.swift
//  Networking HW 2.10.1
//
//  Created by Александр Манжосов on 07.10.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var publishedAt: UILabel!
    @IBOutlet var imageNews: UIImageView!
    
    func configure(with article: Article) {
        authorLabel.text = article.author
        publishedAt.text = article.publishedAt
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: article.urlToImage ?? "https://elbuz.com/image/data/eg_products/news/er.png") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageNews.image = UIImage(data: imageData)
            }
        }
    }
}
