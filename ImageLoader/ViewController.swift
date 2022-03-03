//
//  ViewController.swift
//  ImageLoader
//
//  Created by Bhushan Satish Rane on 01/03/22.
//  Copyright © 2022 Bhushan Satish Rane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    var array:[SampleModel]?
    var imageCatch = NSCache<NSString,UIImage>()
    var image:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RequestVM.shared.APICall { (sampleModel, error) in
            if error == nil && sampleModel != nil{
                self.array = sampleModel
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.text = (array![indexPath.row] ).description
        if let imageTemp = imageCatch.object(forKey: (array![indexPath.row] ).imageUrl! as NSString)
        {
            image = imageTemp
            cell.imageView?.image = image
        }
        else{
            URLToImage(urlImage: (array![indexPath.row] ).imageUrl!) { image,imageURL  in
                print(imageURL)
                self.image = image
                self.imageCatch.setObject(self.image ?? UIImage(), forKey: (self.array![indexPath.row] ).imageUrl! as NSString)
                cell.imageView?.image = image
            }
        }
        
//        cell.imageView?.image = image
        return cell
    }
    
    func URLToImage(urlImage:String,completionHandler:@escaping(UIImage,String)->()){
        let url = URL(string: urlImage)!
        var data:Data?
        var image:UIImage?
        DispatchQueue.global().async {
            data = try? Data(contentsOf: url)
            if let imageData = data {
                if let imageTemp = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        completionHandler(imageTemp,urlImage)
                        
                    }
                }
            }
        }
    }
}
