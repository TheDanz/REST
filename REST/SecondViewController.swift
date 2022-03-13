//
//  SecondViewController.swift
//  REST
//
//  Created by Danil Ryumin on 13.03.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var ID: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()
    }
    
    func getPosts() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(ID)")
        guard let requestUrl = url else { return }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            guard let data = data, let dataString = String(data: data, encoding: .utf8), (response as? HTTPURLResponse)?.statusCode == 200, error == nil else { return }
            DispatchQueue.main.async {
                self.textView.text = dataString
            }
        }
        task.resume()
    }
}
