//
//  HomeCoordinator.swift
//  ProjetoInvestimento
//
//  Created by user on 30/01/23.
//

import UIKit

public protocol CoordinatorProtocol: AnyObject{
    
    func startHome()
    func goToBuyAndSellView(exchangeViewController: UIViewController)
    func goToCongratulation(buyAndSellViewController: UIViewController)
}

class Coordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    //MARK: - HOME
    func startHome() {
        
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    //MARK: - EXCHANGE
    func goToBuyAndSellView(exchangeViewController: UIViewController){
        
        navigationController.pushViewController(exchangeViewController, animated: true)
        navigationController.navigationBar.tintColor = UIColor.white
    }
    
    /// deveria estar aqui ?
    func routeView(_ tableView: UITableView, _ exchangeView: ExchangeViewController, _ indexPath: IndexPath, _ viewModel: ExchangeViewModel, _ wallet: Wallet){
        
        exchangeView.wallet = wallet
        exchangeView.exchange = Exchange(coins: viewModel.returnCoin(indexPath: indexPath.row),
                                         sigla: viewModel.returnSigla(indexPath: indexPath.row),
                                         variation: viewModel.returnVariationPercent(indexPath: indexPath.row),
                                         compra: viewModel.returnCompra(indexPath: indexPath.row),
                                         venda: viewModel.returnVenda(indexPath: indexPath.row),
                                         color: viewModel.returnVariationColor(indexPath: indexPath.row))
    }
    
    //MARK: - BUY AND SELL
    func goToCongratulation(buyAndSellViewController: UIViewController) {
        
        navigationController.pushViewController(buyAndSellViewController, animated: true)
        
    }
    
    ///deveria estar aqui ?
    func returnCongratulation(_ sender: UIButton, _ buyAndSell: BuyAndSellViewController, wallet: Wallet, amount: Int, exchange: Exchange){
        
        var returnValueConverted = ""

        if sender.tag == 1 {
            buyAndSell.titleScreen = sender.currentTitle?.capitalized
            returnValueConverted = wallet.BuyOrSell(amount, ofValue: exchange.compra, your: exchange.sigla, and: sender.tag)
        }
        else {
            buyAndSell.titleScreen = sender.currentTitle?.capitalized
            returnValueConverted = wallet.BuyOrSell(amount, ofValue: exchange.venda, your: exchange.sigla, and: sender.tag)
        }
        
        buyAndSell.labelText = "Parabéns! Você acabou de \(buyAndSell.titleScreen?.lowercased() ?? "") \(amount) \(exchange.coins), saldo total \(returnValueConverted)"
    }
    
    //MARK: - BACK ROOT VIEW
    func returnRootViewController() {
        
        self.navigationController.popToRootViewController(animated: true)
    }
}
