//
//  ViewController.swift
//  Linceu
//
//  Created by Esdras Bezerra da Silva on 31/05/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var callMe: UIButton!
    
    
    @IBOutlet weak var tableViewGM: UITableView!
    
    let dados = ["A Instituição","A missão","Os Departamentos","Fale Conosco",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //println(dados)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //teste()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableViewGM.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        
        
        cell.textLabel?.text = dados[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        switch (indexPath.row){
        case 0:
            cell.imageView?.image = UIImage(named: "Organization-32")
        case 1:
            cell.imageView?.image = UIImage(named: "News")
        case 2:
            cell.imageView?.image = UIImage(named: "Department-32")
            
        case 3:
            cell.imageView?.image = UIImage(named: "Talk-32")
            
        case 4:
            cell.imageView?.image = UIImage(named: "Groups")
        default:
            cell.imageView?.image = nil
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Guarda Municipal de Araras"
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(self.dados[indexPath.row])
    }
    
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        if segue.identifier == "teste" {
    //            var vc = segue.destinationViewController as! SegurancaCidada
    //        }
    //    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        if segue.identifier == "mostrarDetalhesGM"
        {
//            let indexPath:NSIndexPath = self.tableViewGM.indexPathForSelectedRow!
            let destination = segue.destinationViewController as! DetalhesGMViewController
            destination.elementoRecebido = self.tableViewGM.indexPathForSelectedRow?.row
        }
    }
    
    
    
}

