//
//  ViewController.swift
//  testeChat
//
//  Created by humberto Lima on 20/09/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit


struct Mensagens: Codable {
    var idAutor: Int?
    var mensagem: String?
}

class ViewController: UIViewController {

    @IBOutlet var tabelaMensagens: UITableView!
    @IBOutlet var campoMensagem: UITextField!
    
    var mensagens = [
        Mensagens(idAutor: 0, mensagem: "Texugo Alado"),
        Mensagens(idAutor: 1, mensagem: "Texugo Careca"),
        Mensagens(idAutor: 1, mensagem: "Astolfinho"),
        Mensagens(idAutor: 1, mensagem: "Mensagem 1"),
        Mensagens(idAutor: 0, mensagem: "Mensagem 2"),
        Mensagens(idAutor: 0, mensagem: "Mensagem 3"),
        Mensagens(idAutor: 0, mensagem: "Mensagem 4"),
        Mensagens(idAutor: 0, mensagem: "Mensagem 5"),
        Mensagens(idAutor: 0, mensagem: "Mensagem 6"),
        Mensagens(idAutor: 0, mensagem: "Mensagem 7")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelaMensagens.delegate = self
        tabelaMensagens.dataSource = self
        tabelaMensagens.register(UINib(nibName: "Cell1TableViewCell", bundle: nil), forCellReuseIdentifier: "cell1")
        tabelaMensagens.register(UINib(nibName: "Cell2TableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
        tabelaMensagens.scrollToBottom()
    }
    
    
    func alerta(title: String, mensagem:String){
        let alert = UIAlertController(title: title, message: mensagem, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func enviarMensagem(_ sender: UIButton) {
        guard campoMensagem.text != "" else {
            alerta(title: "Aviso", mensagem: "Digite a mensagem")
            return
        }
        
        let novaMensagem = Mensagens(idAutor: 0, mensagem: campoMensagem.text ?? "")
        campoMensagem.resignFirstResponder()
        campoMensagem.text = ""
        mensagens.append(novaMensagem)
        tabelaMensagens.reloadData()
        tabelaMensagens.scrollToBottom()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mensagens.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mensagemTemp = mensagens[indexPath.section]
        
        if (mensagemTemp.idAutor ?? -1) == 0 {
            let cell = tabelaMensagens.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! Cell1TableViewCell
            cell.labelMensagem.text = mensagemTemp.mensagem ?? ""
            return cell
        }else{
            let cell = tabelaMensagens.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! Cell2TableViewCell
            cell.labelMensagem.text = mensagemTemp.mensagem ?? ""
            return cell
        }
    }
}


extension UITableView {
    func scrollToBottom() {
        if self.numberOfSections > 1 {
            let lastSection = self.numberOfSections - 1
            self.scrollToRow(at: NSIndexPath.init(row: self.numberOfRows(inSection: lastSection) - 1, section: lastSection) as IndexPath, at: .bottom, animated: true)
        } else if numberOfRows(inSection: 0) > 0 && self.numberOfSections == 1 {
            self.scrollToRow(at: NSIndexPath.init(row: self.numberOfRows(inSection: 0) - 1, section: 0) as IndexPath, at: .bottom, animated: true)
        }
    }
}
