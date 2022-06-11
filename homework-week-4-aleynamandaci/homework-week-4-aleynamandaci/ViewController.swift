//
//  ViewController.swift
//  homework-week-4-aleynamandaci
//
//  Created by Aleyna Mandacı on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }

    private func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CryptoCell")
    }
    
    private func fetchData(){
        
        if let url = URL.init(string: "https://api.nomics.com/v1/currencies/ticker?key=815066069d8b357df3a9ca10f7d184e70ab8ef8d"){
            URLSession.shared.dataTask(with: url) { data, response, error in
                print(response)
            }
        }
        
    }
    
}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! TableViewCell
        return cell
    }
    
    
}

