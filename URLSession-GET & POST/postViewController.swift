//
//  postViewController.swift
//  URLSession-GET & POST
//
//  Created by vignesh on 6/6/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit

class postViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
   
    @IBOutlet weak var messageText: UITextView!
    
    
    @IBAction func postbuttonTapped(_ sender: Any) {
        
        
        
        let params = ["username":userName.text, "message":messageText.text]
        
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        guard let httpbody = try? JSONSerialization.data(withJSONObject: params, options: []) else {return }
        request.httpBody = httpbody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)// raw data 
                
                do {
                    
                    let json =  try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
                
                
            }
        }.resume()
        
        
    }

}
