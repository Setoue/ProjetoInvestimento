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
        guard let wallet = self.wallet,
              let compra = self.exchange.compra,
              let venda = self.exchange.venda,
              let sigla = self.exchange.sigla,
              let coins = self.exchange.coins,
              let color = exchange.color,
              let caixa = wallet.caixaWallet[sigla] else { return }
        
        let saldoWallet = wallet.convert(value: wallet.saldo)
        screenExchange?.changeLabels(coins: "\(sigla) - \(coins)" ,
                                     variation: exchange.variation ?? "",
                                     compra: "Compra: R$ \(compra)" ,
                                     venda: "Venda: R$ \(venda)" ,
                                     saldo: "Saldo disponível: \(saldoWallet)",
                                     caixa: "\(caixa) \(coins) em caixa",
                                     color: color)
        
        self.screenExchange?.buttonComprar.backgroundColor = .blue.withAlphaComponent(0.4)
        self.screenExchange?.buttonVender.backgroundColor = .blue.withAlphaComponent(0.4)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        buttonChecked()
    }
    
    override func loadView() {
        screenExchange = ExchangeScreen()
        self.view = screenExchange
    }
    
    //MARK: - Methods
    
    func buttonChecked(){
        guard let wallet = self.wallet,
              let sigla = self.exchange.sigla,
              let textField = self.screenExchange?.textField.text else { return }
        
        if wallet.saldo > 0 && textField != ""{
            self.screenExchange?.buttonComprar.addTarget(self, action: #selector(self.pressButton) , for: .touchUpInside)
            self.screenExchange?.buttonComprar.backgroundColor = .blue
        }
        else {
            self.screenExchange?.buttonComprar.backgroundColor = .blue.withAlphaComponent(0.4)
            self.screenExchange?.buttonComprar.removeTarget(self, action: #selector(self.pressButton), for: .touchUpInside)
        }
        if wallet.caixaWallet[sigla] ?? 0 > 0 && textField != "" && wallet.caixaWallet[sigla] ?? 0 >= Int(textField) ?? 0 {
            self.screenExchange?.buttonVender.addTarget(self, action: #selector(self.pressButton) , for: .touchUpInside)
            self.screenExchange?.buttonVender.backgroundColor = .blue
        }
        else {
            self.screenExchange?.buttonVender.backgroundColor = .blue.withAlphaComponent(0.4)
            self.screenExchange?.buttonVender.removeTarget(self, action: #selector(self.pressButton), for: .touchUpInside)
        }
    }
    
    @objc func pressButton(sender: UIButton){
        
        if sender.tag == 1 {
            let buyAndSell: BuyAndSellViewController = BuyAndSellViewController()
            buyAndSell.labelText = self.returnCongratulation(tag: sender.tag)
            buyAndSell.titleScreen = "Comprar"
            self.navigationController?.pushViewController(buyAndSell, animated: true)
        } else {
            let buyAndSell: BuyAndSellViewController = BuyAndSellViewController()
            buyAndSell.labelText = self.returnCongratulation(tag: sender.tag)
            buyAndSell.titleScreen = "Vender"
            self.navigationController?.pushViewController(buyAndSell, animated: true)
        }
        
    }
    
    func returnCongratulation(tag: Int) -> String{
        var choice = ""
        var returnValue = ""
        guard let amount = Int(self.screenExchange?.textField.text ?? ""),
              let wallet = self.wallet,
              let sigla = self.exchange.sigla,
              let coins = self.exchange.coins else { return ""}
        
        if tag == 1 {
            guard let compra = self.exchange.compra else {return ""}
            choice = "comprar"
            returnValue = wallet.buy(amount, of: compra, your: sigla)
        }
        else {
            guard let vender = self.exchange.venda else {return ""}
            choice = "vender"
            returnValue = wallet.sell(amount, of: vender, your: sigla)
        }
        
        return "Parabéns! Você acabou de \(choice) \(amount) \(coins), saldo total \(returnValue)"
    }
}

