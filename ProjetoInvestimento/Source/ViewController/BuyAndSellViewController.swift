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
    }

    override func loadView() {
        screenBuyAndSell = BuyAndSellScreen()
        self.view = screenBuyAndSell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = self.titleScreen
        view.backgroundColor = .black
        
        screenBuyAndSell?.labelFinal.text = labelText
        
        self.screenBuyAndSell?.changeData(label: labelText ?? "")
        self.screenBuyAndSell?.buttonHome.addTarget(self, action: #selector(tappedBackHome), for: .touchUpInside)
    }
    
    //MARK: - Methods
   
    @objc func tappedBackHome(){
        let coordinator = Coordinator(navigationController: navigationController ?? nil)
        coordinator.returnRootViewController()
    }
    
    
}

