//
//  DetailViewController.swift
//  Milestone project 4
//
//  Created by Carmen Morado on 1/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var imagePath: String?
    var selectedPictureNumber: Int?
    var totalPictures: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedPictureNumber!) of \(totalPictures!)"

        navigationItem.largeTitleDisplayMode = .never
        
        if let path = imagePath {
            imageView.image = UIImage(contentsOfFile: path)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
 

}
