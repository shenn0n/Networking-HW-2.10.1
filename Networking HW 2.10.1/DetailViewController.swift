//
//  DetailViewController.swift
//  Networking HW 2.10.1
//
//  Created by Александр Манжосов on 07.10.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageArticle: UIImageView!
    @IBOutlet var titleArticle: UILabel!
    @IBOutlet var descriptionArticle: UILabel!
    @IBOutlet var contentArticle: UILabel!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //titleArticle.text = article.title
        configure(with: article)
    }
    
    func configure(with article: Article) {
        
        titleArticle.text = article.title
        descriptionArticle.text = article.description
        contentArticle.text = article.content
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: article.urlToImage) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageArticle.image = UIImage(data: imageData)
            }
        }
    }
    
}
