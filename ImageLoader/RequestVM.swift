//
//  RequestVM.swift
//  ImageLoader
//
//  Created by Bhushan Satish Rane on 01/03/22.
//  Copyright © 2022 Bhushan Satish Rane. All rights reserved.
//

import UIKit

class RequestVM: NSObject {
    static var shared = RequestVM()//UIApplication.shared.delegate as! AppDelegate
    
    let jsonData = """
    [
      {
        "description":"Lady with a red umbrella",
        "imageUrl":"https://picsum.photos/id/237/200/300"
      },
      {
        "description":"Flowers and some fruits",
        "imageUrl":"https://picsum.photos/200"
      },
      {
        "description":"Beautiful scenery",
        "imageUrl":"https://picsum.photos/seed/picsum/200/300"
      },
      {
        "description":"Some kind of bird",
        "imageUrl":"https://picsum.photos/200/300?grayscale"
      },
      {
        "description":"The attack of dragons",
        "imageUrl":"https://picsum.photos/200/300/?blur"
      },
     {
       "description":"The advance usage",
       "imageUrl":"https://picsum.photos/200/300.jpg"
     },
    {
    "description":"Lady with a red umbrella",
    "imageUrl":"https://picsum.photos/id/237/200/300"
    },
    {
        "description":"Flowers and some fruits",
        "imageUrl":"https://picsum.photos/200"
    },
    {
    "description":"Beautiful scenery",
    "imageUrl":"https://picsum.photos/seed/picsum/200/300"
    },
    {
    "description":"Some kind of bird",
    "imageUrl":"https://picsum.photos/200/300?grayscale"
    },
    {
    "description":"The attack of dragons",
    "imageUrl":"https://picsum.photos/200/300/?blur"
    },
    {
    "description":"The advance usage",
    "imageUrl":"https://picsum.photos/200/300.jpg"
    },
    {
    "description":"Lady with a red umbrella",
    "imageUrl":"https://picsum.photos/id/237/200/300"
    },
    {
    "description":"Flowers and some fruits",
    "imageUrl":"https://picsum.photos/200"
    },
    {
    "description":"Beautiful scenery",
    "imageUrl":"https://picsum.photos/seed/picsum/200/300"
    },
    {
    "description":"Some kind of bird",
    "imageUrl":"https://picsum.photos/200/300?grayscale"
    },
    {
    "description":"The attack of dragons",
    "imageUrl":"https://picsum.photos/200/300/?blur"
    },
    {
    "description":"The advance usage",
    "imageUrl":"https://picsum.photos/200/300.jpg"
    },
    {
        "description":"Lady with a red umbrella",
        "imageUrl":"https://picsum.photos/id/237/200/300"
      },
      {
        "description":"Flowers and some fruits",
        "imageUrl":"https://picsum.photos/200"
      },
      {
        "description":"Beautiful scenery",
        "imageUrl":"https://picsum.photos/seed/picsum/200/300"
      },
      {
        "description":"Some kind of bird",
        "imageUrl":"https://picsum.photos/200/300?grayscale"
      },
      {
        "description":"The attack of dragons",
        "imageUrl":"https://picsum.photos/200/300/?blur"
      },
     {
       "description":"The advance usage",
       "imageUrl":"https://picsum.photos/200/300.jpg"
     },
    {
    "description":"Lady with a red umbrella",
    "imageUrl":"https://picsum.photos/id/237/200/300"
    },
    {
        "description":"Flowers and some fruits",
        "imageUrl":"https://picsum.photos/200"
    },
    {
    "description":"Beautiful scenery",
    "imageUrl":"https://picsum.photos/seed/picsum/200/300"
    },
    {
    "description":"Some kind of bird",
    "imageUrl":"https://picsum.photos/200/300?grayscale"
    },
    {
    "description":"The attack of dragons",
    "imageUrl":"https://picsum.photos/200/300/?blur"
    },
    {
    "description":"The advance usage",
    "imageUrl":"https://picsum.photos/200/300.jpg"
    },
    {
    "description":"Lady with a red umbrella",
    "imageUrl":"https://picsum.photos/id/237/200/300"
    },
    {
    "description":"Flowers and some fruits",
    "imageUrl":"https://picsum.photos/200"
    },
    {
    "description":"Beautiful scenery",
    "imageUrl":"https://picsum.photos/seed/picsum/200/300"
    },
    {
    "description":"Some kind of bird",
    "imageUrl":"https://picsum.photos/200/300?grayscale"
    },
    {
    "description":"The attack of dragons",
    "imageUrl":"https://picsum.photos/200/300/?blur"
    },
    {
    "description":"The advance usage",
    "imageUrl":"https://picsum.photos/200/300.jpg"
    }
    ]
    """.data(using: .utf8)!
    
    private override init() {
        
    }
    func APICall(completionHandler:@escaping ([SampleModel]?, Error?) -> Void)  {
        let decoder = JSONDecoder()
        do{
            let result = try decoder.decode([SampleModel].self, from: jsonData)
            result.forEach { (sampleModel) in
                print(sampleModel.description)
                print(sampleModel.imageUrl)
            }
            print(result.description)
            
            //             let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            completionHandler(result,nil)
        }
        catch{
            completionHandler(nil, error)
            print("Error : \(error.localizedDescription)")
        }
        
        
    }
}
