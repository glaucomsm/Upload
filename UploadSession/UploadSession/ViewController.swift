//
//  ViewController.swift
//  UploadSession
//
//  Created by Glauco Moraes on 04/04/16.
//  Copyright © 2016 EngageX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets 
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    // Retorna uma cópia da configuração da sessão.
    var configuracao : NSURLSessionConfiguration!
    
    let baseURL = NSURL(string: "https://httpbin.org")
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Método disparado depois que a view foi carregada em memória.
        self.configuracao = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        self.download()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Este método é disparado quando o aplicativo recebe um aviso de memória do iOS.
    }
    
    // MARK: - Methods
    
    func download()
    {
        let url = NSURL(string: "http://www.engage-x.com/engagex_logo.png")
        
        let sessao = NSURLSession(configuration: configuracao)
        
        // Método que cria uma tarefa de download a partir de uma URL especificada, salva os resultados em um arquivo, e retorna os resultados em um callback.
        let tarefa = sessao.downloadTaskWithURL(url!)
        { (url, resposta, erro) in
            
            let imagemDados = NSData(contentsOfURL: url!)
            
            let imagem = UIImage(data: imagemDados!)
            
            print("Imagem baixada com sucesso!!")
            
            NSOperationQueue.mainQueue().addOperationWithBlock {
                self.imageView.image = imagem
            }
        }
        
        tarefa.resume()
    }

}

