//
//  JSONParser.swift
//  Linceu
//
//  Created by Rodrigo A E Miyashiro on 6/17/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit

class JSONParser: NSObject {
   
    
    func pathJSON (file:String) ->NSData{
        let path = NSBundle.mainBundle().pathForResource(file, ofType: "json")
        
        // Conteúdo binário do arquivo
        let data = NSData(contentsOfFile: path!)
        
        if(path == nil) {
            // Não encontrou o arquivo no projeto
            print("Path não encontrado...")
            return data!
        }
        else {
            if(data == nil) {
                // Não conseguiu ler o arquivo
                print("Não conseguiu ler o arquivo...")
                return data!
            }
            if (data!.length == 0) {
                print("NSData vazio...");
                return data!
            }
            
            return data!
        }
        
    }
    
    
    func parseJSON (path:String) ->Array<Noticia>{
        
        var noticias : Array<Noticia> = []
        
        let data:NSData = pathJSON(path)
        
        if let json: NSDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as? NSDictionary {
            if let items = json["noticias"] as? NSArray {
                for item in items {
                    // construct your model objects here
                    
                    let noticia = Noticia()
                    
                    noticia.tituloNoticia = (item["titulo"]     as? String)!
                    noticia.imagemNoticia = (item["imagem"]     as? String)!
                    noticia.textNoticia   = (item["descricao"]  as? String)!
                    
                    noticias.append(noticia)
                }
            }
        }
        return noticias
    }
    
    
    
}
