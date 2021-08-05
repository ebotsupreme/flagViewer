//
//  DetailViewController.swift
//  project123Challenge
//
//  Created by Eddie Jung on 8/2/21.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var countryNameToShare: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.layer.borderWidth = 1
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
    }
    
    @objc func shareImage() {
        guard let image = imageView.image?.pngData() else {
            print("Image not found.")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, countryNameToShare ?? ""], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

}
