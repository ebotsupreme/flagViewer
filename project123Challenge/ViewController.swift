//
//  ViewController.swift
//  project123Challenge
//
//  Created by Eddie Jung on 8/2/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()
    var countryNameFormatted  = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            if item.hasSuffix("png") {
                countries.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Countries", for: indexPath)
        
        let countryName = countries[indexPath.row]
        
        if let index = countryName.range(of: "@")?.lowerBound {
            let substring = countryName[..<index]

            let country = String(substring)

            cell.textLabel?.text = country.uppercased()
            cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 20)
        }
        
        cell.imageView?.image = UIImage(named: countryName)
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            let countryName = countries[indexPath.row]
            
            if let index = countryName.range(of: "@")?.lowerBound {
                let substring = countryName[..<index]
                
                let country = String(substring)
                
                vc.selectedImage = countryName
                vc.countryNameToShare = country.uppercased()
                
            }
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

