//
//  ExchangeViewController.swift
//  ProjetoInvestimento
//
//  Created by user on 20/10/22.
//

import UIKit

class ExchangeViewController: UIViewController {

    //MARK: - Attributes
    
    var screenExchange: ExchangeScreen?
    var exchange: Exchange?
    var wallet: Wallet?

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenExchange?.textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.view.backgroundColor = .black
        title = "Câmbio"
        self.changeData()
        self.changeStateTextField()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        screenExchange?.textField.text = ""
    }
    
    override func loadView() {
        screenExchange = ExchangeScreen()
        self.view = screenExchange
    }
    
    //MARK: - Methods

    private func changeData(){
        guard let wallet = self.wallet,
              let exchange = exchange,
              let caixa = wallet.caixaWallet[exchange.sigla] else { return }
        
        screenExchange?.changeLabels(coins: "\(exchange.sigla) - \(exchange.coins)" ,
                                     variation: exchange.variation,
                                     compra: "Compra: \(wallet.convert(value: exchange.compra))" ,
                                     venda: "Venda: \(wallet.convert(value: exchange.venda))" ,
                                     saldo: "Saldo disponível: \(wallet.convert(value: wallet.saldo))",
                                     caixa: "\(caixa) \(exchange.coins) em caixa",
                                     color: exchange.color)
    }
    
    private func changeStateTextField(){
        self.screenExchange?.textField.addTarget(self, action: #selector(buttonChecked), for: .allEditingEvents)
    }
    
    @objc func buttonChecked(){
        
        guard let wallet = self.wallet,
              let exchange = self.exchange,
              let textField = self.screenExchange?.textField.text else { return }
        
        if wallet.validationDataBuy(exchange: exchange, textField: textField){
            self.screenExchange?.buttonComprar.addTarget(self, action: #selector(self.pressButton) , for: .touchUpInside)
            self.screenExchange?.buttonComprar.backgroundColor = .systemCyan
        }
        else {
            self.screenExchange?.buttonComprar.backgroundColor = .systemCyan.withAlphaComponent(0.5)
            self.screenExchange?.buttonComprar.removeTarget(self, action: #selector(self.pressButton), for: .touchUpInside)
        }
        
        if wallet.validationDataSell(exchange: exchange, textField: textField) {
            self.screenExchange?.buttonVender.addTarget(self, action: #selector(self.pressButton) , for: .touchUpInside)
            self.screenExchange?.buttonVender.backgroundColor = .systemCyan
        }
        else {
            self.screenExchange?.buttonVender.backgroundColor = .systemCyan.withAlphaComponent(0.5)
            self.screenExchange?.buttonVender.removeTarget(self, action: #selector(self.pressButton), for: .touchUpInside)
        }
    }
    
    @objc func pressButton(sender: UIButton){
        
        let buyAndSell: BuyAndSellViewController = BuyAndSellViewController()
        let coordinator = Coordinator(navigationController: navigationController ?? nil)
        guard let amount = Int(self.screenExchange?.textField.text ?? ""),
              let wallet = self.wallet,
              let exchange = self.exchange else { return }

        coordinator.returnCongratulation(sender, buyAndSell, wallet: wallet, amount: amount, exchange: exchange)
        coordinator.goToCongratulation(buyAndSellViewController: buyAndSell)
    }
}

//MARK: - Delegate: TextField
extension ExchangeViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == screenExchange?.textField {
            let allowedCharacters = "0123456789"
            let allowedCharactersSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharactersIn = CharacterSet(charactersIn: string)
            let numbers = allowedCharactersSet.isSuperset(of: typedCharactersIn)
            return numbers
        }
        return true
    }
    
    
}
