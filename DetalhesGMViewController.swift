//
//  DetalhesGMViewController.swift
//  Linceu
//
//  Created by Evandro Henrique Couto de Paula on 17/06/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit
import MessageUI

class DetalhesGMViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var elementoRecebido: Int!
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var textDescricao: UITextView!
    @IBOutlet weak var botaoEmail: UIButton!
    @IBOutlet weak var botaoTelefone: UIButton!
    
    var dados: AnyObject? = AnyObject?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.elementoRecebido)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let path = NSBundle.mainBundle().pathForResource("Atores", ofType: "plist")
        
        let dictionary = NSDictionary(contentsOfFile: path!)
        
        self.dados = dictionary?.objectForKey("gm")
        
        switch (elementoRecebido){
        case 0:
            self.labelTitulo.text = "Guarda Municipal de Araras"
            self.textDescricao.text = dados?.objectForKey("instituicao") as! String
            self.botaoEmail.hidden = true
            self.botaoTelefone.hidden = true
            break
        case 1:
            self.labelTitulo.text = "Missão"
            self.textDescricao.text = dados?.objectForKey("missao") as! String
            self.botaoEmail.hidden = true
            self.botaoTelefone.hidden = true
            break
        case 2:
            self.labelTitulo.text = "Departamentos"
            self.textDescricao.text = dados?.objectForKey("departamentos") as! String
            self.botaoEmail.hidden = true
            self.botaoTelefone.hidden = true
            break
        case 3:
            self.labelTitulo.text = "Fale Conosco"
            self.textDescricao.hidden = false
            self.botaoTelefone.hidden = false
            self.textDescricao.text = dados?.objectForKey("faleconosco") as! String
            let arrayContato = dados?.objectForKey("contato") as! NSArray
            
            self.botaoTelefone.setTitle(arrayContato.objectAtIndex(0) as? String, forState: UIControlState.Normal)
            self.botaoEmail.setTitle(arrayContato.objectAtIndex(1) as? String, forState: UIControlState.Normal)
        default:
            self.labelTitulo.text = "Dados não obtidos"
            self.textDescricao.text = "Dados não obtidos"
        }
        
        
    }
    
    @IBAction func enviarEmail(){
        if (MFMailComposeViewController.canSendMail()){
            // Send e-mail
            let emailTitle = "Titulo Email"
            let messageBody = "Digite sua mensagem"
            
            let arrayContato = dados?.objectForKey("contato") as! NSArray
            
            let toEntity = [arrayContato.objectAtIndex(1) as! String]
            
            let messageController: MFMailComposeViewController = MFMailComposeViewController()
            messageController.mailComposeDelegate = self
            messageController.setToRecipients(toEntity)
            messageController.setMessageBody(messageBody, isHTML: false)
            messageController.setSubject(emailTitle)
            
            self.presentViewController(messageController, animated: true, completion: nil)
        } else {
            print("Fail to send email!")
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
            
        case MFMailComposeResultCancelled.rawValue:
            print("Mail Cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail Saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail Failed")
        default:
            break
            
        }
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    @IBAction func makeCall(){
        let arrayContato = dados?.objectForKey("contato") as! NSArray
        let phone = String(format: "tel://%@", arrayContato.objectAtIndex(0) as! String)
        let phoneFormated = NSURL(string: phone)
        UIApplication.sharedApplication().openURL(phoneFormated!)
    }

 
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
}
