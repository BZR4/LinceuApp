//
//  RelatorioViewController.swift
//  Linceu
//
//  Created by Esdras Bezerra da Silva on 19/06/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit

class RelatorioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var dados = ["Roubo a pessoa","Roubo de veículo","Roubo em comércio","Furto a Pessoa","Furto em residência","Furto em comércio", "Violação de Direito"]
    
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var typePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dados.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dados[row] as String
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
