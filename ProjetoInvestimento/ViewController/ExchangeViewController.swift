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
    var exchange: Exchange = Exchange()
    var wallet: Wallet?

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        title = "Câmbio"
//        guard let wallet = self.wallet else { return }
        let compra = self.exchange.compra ?? 0
        let venda = self.exchange.venda ?? 0
        let sigla = self.exchange.sigla ?? ""
        let caixa = self.wallet?.caixaWallet[sigla]
        let saldo = self.wallet?.saldo
        let saldoWallet = self.wallet?.convert(value: saldo ?? 0)
        screenExchange?.changeLabels(coins: "\(sigla) - \(exchange.coins ?? "")" ,
                                     variation: exchange.variation ?? "",
                                     compra: "Compra: R$ \(compra)" ,
                                     venda: "Venda: R$ \(venda)" ,
                                     saldo: "Saldo disponível: \(saldoWallet ?? "")",
                                     caixa: "\(caixa ?? 0) \(exchange.coins ?? "") em caixa",
                                     color: exchange.color ?? UIColor())
        
        self.screenExchange?.buttonComprar.backgroundColor = .blue.withAlphaComponent(0.4)
        self.screenExchange?.buttonVender.backgroundColor = .blue.withAlphaComponent(0.4)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        self.buttoBuyChecked()
        self.buttonSellChecked()
    }
    
    override func loadView() {
        screenExchange = ExchangeScreen()
        self.view = screenExchange
    }
    
    //MARK: - Methods
    
    func buttoBuyChecked(){
        
        if self.wallet?.saldo ?? 0 > 0 && self.screenExchange?.textField.text ?? "" != ""{
            self.screenExchange?.buttonComprar.addTarget(self, action: #selector(self.pressButtonBuy) , for: .touchUpInside)
            self.screenExchange?.buttonComprar.backgroundColor = .blue
        }
        else {
            self.screenExchange?.buttonComprar.backgroundColor = .blue.withAlphaComponent(0.4)
            self.screenExchange?.buttonComprar.removeTarget(self, action: #selector(self.pressButtonBuy), for: .touchUpInside)
        }
    }
    
    func buttonSellChecked(){
        
        if self.wallet?.caixaWallet[self.exchange.sigla ?? ""] ?? 0 > 0 && self.screenExchange?.textField.text ?? "" != "" && self.wallet?.caixaWallet[self.exchange.sigla ?? ""] ?? 0 >= Int(self.screenExchange?.textField.text ?? "") ?? 0 {
            self.screenExchange?.buttonVender.addTarget(self, action: #selector(self.pressButtonSell) , for: .touchUpInside)
            self.screenExchange?.buttonVender.backgroundColor = .blue
        }
        else {
            self.screenExchange?.buttonVender.backgroundColor = .blue.withAlphaComponent(0.4)
            self.screenExchange?.buttonVender.removeTarget(self, action: #selector(self.pressButtonSell), for: .touchUpInside)
        }
    }
    
    
    @objc func pressButtonSell(){
        
        let buyAndSell: BuyAndSellViewController = BuyAndSellViewController()
        buyAndSell.labelText = self.toSellExchange()
        buyAndSell.titleScreen = "Vender"
        self.navigationController?.pushViewController(buyAndSell, animated: true)
    }
    @objc func pressButtonBuy(){
        
        let buyAndSell: BuyAndSellViewController = BuyAndSellViewController()
        buyAndSell.labelText = self.toBuyExchange()
        buyAndSell.titleScreen = "Comprar"
        self.navigationController?.pushViewController(buyAndSell, animated: true)
    }
    
    func toBuyExchange() -> String{
        
        guard let amount = Int(self.screenExchange?.textField.text ?? "") else { return ""}
        print(amount)
        guard let compra = self.exchange.compra else {return ""}
        
        let returnBuy = self.wallet?.buy(quantity: amount, valueBuy: compra, sigla: exchange.sigla ?? "")
        return "Parabéns! Você acabou de comprar \(amount) \(self.exchange.coins ?? ""), saldo total \(returnBuy ?? "")"
    }
    
    func toSellExchange() -> String{
        
        guard let amount = Int(self.screenExchange?.textField.text ?? "") else { return ""}
        guard let vender = self.exchange.venda else {return ""}
        
        let returnSell = self.wallet?.sell(quantity: amount, valueSell: vender, sigla: exchange.sigla ?? "")
        return "Parabéns! Você acabou de vender \(amount) \(self.exchange.coins ?? ""), saldo total \(returnSell ?? "")"
    }
}

