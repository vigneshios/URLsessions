//
//  ViewController.swift
//  URLSession-GET & POST
//
//  Created by vignesh on 6/6/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
    }

    @IBAction func GetUsers(_ sender: Any) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let response = response {
                print(response) // if status code = 200 - 299 -> success else check URL.
            }
            
            if let data = data {
                print(data)// raw data without serializing
                
                //serializing data to json format
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(json)
                }catch {
                    print(error)
                }
                
              
                
            }
        }.resume()
        
    }
    
    
    @IBAction func AddNewPost(_ sender: Any) {
        
        print("post")
        
    }

}

