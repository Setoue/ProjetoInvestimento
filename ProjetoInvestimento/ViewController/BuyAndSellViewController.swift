//
//  BuyAndSellViewController.swift
//  ProjetoInvestimento
//
//  Created by user on 25/10/22.
//

import UIKit


class BuyAndSellViewController: UIViewController {

    //MARK: - Attributes
    
    var screenBuyAndSell: BuyAndSellScreen?
    var titleScreen: String?
    var labelText: String?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = self.titleScreen
        self.screenBuyAndSell?.changeData(label: labelText ?? "")
        self.screenBuyAndSell?.buttonHome.addTarget(self, action: #selector(tappedBackHome), for: .touchUpInside)
    }

    override func loadView() {
        screenBuyAndSell = BuyAndSellScreen()
        self.view = screenBuyAndSell
    }
    
    //MARK: - Methods
   
    @objc func tappedBackHome(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    static func returnMessage(your choice : String, and inQuantity: Int, of coins: String, all saldo: String) -> String {
        return "Parabéns! Você acabou de \(choice) \(inQuantity) \(coins), saldo total \(saldo)"
    }
}

