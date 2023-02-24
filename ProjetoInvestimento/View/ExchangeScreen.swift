//
//  ExchangeScreen.swift
//  ProjetoInvestimento
//
//  Created by user on 20/10/22.
//

import UIKit

class ExchangeScreen: UIView {
    
    //MARK: - Elements
    
    lazy var coinsLabel: UILabel = {
        let coinsLabel = UILabel()
        coinsLabel.translatesAutoresizingMaskIntoConstraints = false
        coinsLabel.textColor = .white
        coinsLabel.textAlignment = .left
        coinsLabel.font = UIFont.boldSystemFont(ofSize: 23)
        return coinsLabel
    }()
    
    lazy var variationLabel: UILabel = {
        let variationLabel = UILabel()
        variationLabel.translatesAutoresizingMaskIntoConstraints = false
        variationLabel.textColor = .green
        variationLabel.textAlignment = .left
        variationLabel.font = UIFont.systemFont(ofSize: 20)
        return variationLabel
    }()
    
    lazy var compraLabel: UILabel = {
        let compraLabel = UILabel()
        compraLabel.translatesAutoresizingMaskIntoConstraints = false
        compraLabel.textColor = .white
        compraLabel.font = UIFont.systemFont(ofSize: 15)
        compraLabel.textAlignment = .left
        return compraLabel
    }()
    
    lazy var vendaLabel: UILabel = {
        let vendaLabel = UILabel()
        vendaLabel.translatesAutoresizingMaskIntoConstraints = false
        vendaLabel.textColor = .white
        vendaLabel.font = UIFont.systemFont(ofSize: 15)
        vendaLabel.textAlignment = .left
        return vendaLabel
    }()
    
    lazy var saldoLabel: UILabel = {
        let saldoLabel = UILabel()
        saldoLabel.translatesAutoresizingMaskIntoConstraints = false
        saldoLabel.textColor = .white
        saldoLabel.font = UIFont.systemFont(ofSize: 23)
        saldoLabel.textAlignment = .left
        return saldoLabel
    }()
    
    lazy var caixaLabel: UILabel = {
        let caixaLabel = UILabel()
        caixaLabel.translatesAutoresizingMaskIntoConstraints = false
        caixaLabel.textColor = .white
        caixaLabel.font = UIFont.systemFont(ofSize: 23)
        caixaLabel.textAlignment = .left
        return caixaLabel
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(self.variationLabel)
        stackView.addSubview(self.coinsLabel)
        stackView.addSubview(self.compraLabel)
        stackView.addSubview(self.vendaLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 20
        
        return stackView
    }()
    
    lazy var textField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Quantidade"
        textField.borderStyle = .roundedRect //espaço entre o placeholder e a borda
        textField.layer.borderWidth = 1
        textField.returnKeyType = .done
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 15
        textField.textColor = .white
        textField.backgroundColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "Quantidade", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.textAlignment = .left
  
        textField.keyboardType = .numberPad

        return textField
    }()
    
    lazy var buttonVender: UIButton = {
        let btnVender = UIButton()
        btnVender.translatesAutoresizingMaskIntoConstraints = false
        btnVender.layer.borderColor = UIColor.blue.cgColor
        btnVender.layer.cornerRadius = 20
        btnVender.setTitle("VENDER", for: .normal)
        btnVender.tag = 0
        btnVender.backgroundColor = .systemCyan.withAlphaComponent(0.5)
        return btnVender
    }()
    
    lazy var buttonComprar: UIButton = {
        let btnComprar = UIButton()
        btnComprar.translatesAutoresizingMaskIntoConstraints = false
        btnComprar.layer.borderColor = UIColor.blue.cgColor
        btnComprar.layer.cornerRadius = 20
        btnComprar.setTitle("COMPRAR", for: .normal)
        btnComprar.tag = 1
        btnComprar.backgroundColor = .systemCyan.withAlphaComponent(0.5)
        return btnComprar
    }()
    
    lazy var stackViewButton: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(self.buttonVender)
        stack.addArrangedSubview(self.buttonComprar)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    lazy var body: UIView = {
        let body = UIView()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.addSubview(self.stackView)
        body.addSubview(self.saldoLabel)
        body.addSubview(self.caixaLabel)
        body.addSubview(self.textField)
        body.addSubview(self.stackViewButton)
        return body
    }()
    
    //MARK: - Contructs
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(body)
        self.configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    public func changeLabels(coins: String, variation: String, compra: String, venda: String, saldo: String, caixa: String, color: UIColor){
        self.coinsLabel.text = coins
        self.variationLabel.text = variation
        self.variationLabel.textColor = color
        self.compraLabel.text = compra
        self.vendaLabel.text = venda
        self.saldoLabel.text = saldo
        self.caixaLabel.text = caixa

    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
        
            //body
            self.body.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.body.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.body.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.body.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            //stackView
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            self.stackView.bottomAnchor.constraint(equalTo: self.vendaLabel.bottomAnchor, constant: 20), //a
        
            //coinsLabel
            self.coinsLabel.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            self.coinsLabel.bottomAnchor.constraint(equalTo: self.variationLabel.topAnchor),
            self.coinsLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.coinsLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.coinsLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //variationLabel
            self.variationLabel.topAnchor.constraint(equalTo: self.coinsLabel.bottomAnchor),
            self.variationLabel.bottomAnchor.constraint(equalTo: self.compraLabel.topAnchor),
            self.variationLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.variationLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.variationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //compraLabel
            self.compraLabel.topAnchor.constraint(equalTo: self.variationLabel.bottomAnchor),
            self.compraLabel.bottomAnchor.constraint(equalTo: self.vendaLabel.topAnchor),
            self.compraLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.compraLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.compraLabel.heightAnchor.constraint(equalToConstant: 30),
            
            //vendaLabel
            self.vendaLabel.topAnchor.constraint(equalTo: self.compraLabel.bottomAnchor),
            self.vendaLabel.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20),
            self.vendaLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.vendaLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.vendaLabel.heightAnchor.constraint(equalToConstant: 30),
            
            //saldoLabel
            self.saldoLabel.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 40),
            self.saldoLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.saldoLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.saldoLabel.bottomAnchor.constraint(equalTo: self.caixaLabel.topAnchor, constant: -20),
            
            //caixaLabel
            self.caixaLabel.topAnchor.constraint(equalTo: self.saldoLabel.bottomAnchor),
            self.caixaLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.caixaLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.caixaLabel.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -20),
            
            //textField
            self.textField.topAnchor.constraint(equalTo: self.caixaLabel.bottomAnchor),
            self.textField.heightAnchor.constraint(equalToConstant: 60),
            self.textField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.textField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            //stackViewButton
            self.stackViewButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.stackViewButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.stackViewButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.stackViewButton.heightAnchor.constraint(equalToConstant: 50),
            
            //buttonVender
            self.buttonVender.topAnchor.constraint(equalTo: self.stackViewButton.topAnchor),
            self.buttonVender.bottomAnchor.constraint(equalTo: self.stackViewButton.bottomAnchor),
            self.buttonVender.leadingAnchor.constraint(equalTo: self.stackViewButton.leadingAnchor),
            self.buttonVender.trailingAnchor.constraint(equalTo: self.buttonComprar.leadingAnchor, constant: -20),

            
            //buttonComprar
            self.buttonComprar.topAnchor.constraint(equalTo: self.stackViewButton.topAnchor),
            self.buttonComprar.bottomAnchor.constraint(equalTo: self.stackViewButton.bottomAnchor),
            self.buttonComprar.leadingAnchor.constraint(equalTo: self.buttonVender.trailingAnchor),
            self.buttonComprar.trailingAnchor.constraint(equalTo: self.stackViewButton.trailingAnchor),

        ])
    }
}
