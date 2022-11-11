//
//  ViewController.swift
//  ProjetoInvestimento
//
//  Created by user on 14/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Attributes
    
    let viewModel: ExchangeViewModel = ExchangeViewModel()
    var screenHome: HomeScreen?
    var screenExchange: ExchangeScreen?
    var wallet = Wallet()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate(delegate: self) //primeiro executa o delegate
        self.viewModel.seek() //dps executa a requisicao
        title = "Moedas"
        
        navigationController?.navigationItem.titleView?.tintColor = .white
        
    }
    
    override func loadView() {
        self.screenHome = HomeScreen()
        self.view = screenHome
    }
    
    //MARK: - Methods
    
}

//MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.returnCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeTableViewCell.identifier, for: indexPath) as? ExchangeTableViewCell
        cell?.changeExchangeCell(exchange: self.viewModel.nameExchange(indexPath: indexPath.row))
        cell?.changeVaritionCell(varition: self.viewModel.returnVariationPercent(indexPath: indexPath.row), color: self.viewModel.returnVariationColor(indexPath: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let rootExchange: ExchangeViewController = ExchangeViewController()
        rootExchange.wallet = wallet
        rootExchange.exchange.coins = self.viewModel.returnCoin(indexPath: indexPath.row)
        rootExchange.exchange.sigla = self.viewModel.returnSigla(indexPath: indexPath.row)
        rootExchange.exchange.variation = self.viewModel.returnVariationPercent(indexPath: indexPath.row)
        rootExchange.exchange.color = self.viewModel.returnVariationColor(indexPath: indexPath.row)
        rootExchange.exchange.compra = self.viewModel.returnCompra(indexPath: indexPath.row)
        rootExchange.exchange.venda = self.viewModel.returnVenda(indexPath: indexPath.row)
        tableView.reloadData()
        navigationController?.pushViewController(rootExchange, animated: true)
        navigationController?.navigationBar.tintColor = UIColor.white

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
}

//MARK: - Delegate: ExchangeViewModelDelegate
extension HomeViewController: ExchangeViewModelDelegate{
    func success() {
        self.screenHome?.delegateTableView(delegate: self, dataSource: self)
        self.screenHome?.tableView.reloadData()
    }
    
    func error(mensage: String) {
        print("Deu ruim")
    }
    
    
}


