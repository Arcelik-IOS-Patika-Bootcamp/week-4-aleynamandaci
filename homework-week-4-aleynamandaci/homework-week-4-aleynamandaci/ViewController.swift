//
//  ViewController.swift
//  homework-week-4-aleynamandaci
//
//  Created by Aleyna Mandacı on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var coinData : [CryptoObject] = []
    //private var priceChange : [The7D] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
        fetchData()
    }

    private func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CryptoCell")
    }
    
    private func fetchData(){
        
        if let url = URL.init(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc"){
            let task = URLSession.shared.dataTask(with: url) { [unowned self ]data, response, error in
                
                do{
                    guard let data = data else {
                        return
                    }
                    let object = try JSONDecoder().decode([CryptoObject].self, from: data)
                    self.coinData = object
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
        
    }
    
}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! TableViewCell
        
        let rowItem = coinData[indexPath.row]
        
        if rowItem.cryptoChangePercentage24h < 0 {
            cell.cryptoPrice.text = String(format: "%.3f", rowItem.cryptoChangePercentage24h)
            cell.cryptoPrice.textColor = .systemRed
        }else {
            cell.cryptoPrice.text = String(format: "%.3f", rowItem.cryptoChangePercentage24h)
            cell.cryptoPrice.textColor = .systemGreen
        }
    
        cell.cryptoName.text = rowItem.cryptoName
       
        cell.cryptoSymbol.text = rowItem.cryptoSymbol
        
        cell.cryptoLogo.loadFrom(URLAddress: rowItem.cryptoLogoUrl)
        
        return cell
    }
    
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
