//
//  DetailNewsTableViewController.swift
//  Linceu
//
//  Created by Esdras Bezerra da Silva on 07/08/15.
//  Copyright (c) 2015 Esdras Bezerra da Silva. All rights reserved.
//

import UIKit

class DetailNewsTableViewController: UITableViewController {
    
//    let news: [(String,String)] = []
//    let detailNews: [(String,String)] = []
    
    
    let news = [
        ("GPC é reativado","Grupo de Patrulhamento Ciclístico é reativado"),
        ("Secretaria de Segurança","Fórum Municipal de Segurança Pública"),
        ("Furto no Wallmart","Homens armados levam televisores"),
        ("Flagrante de tráfico de entorpecente","Homem é preso com 1 kilo de cocaína"),
        ("Segurança Cidadã","Nova política de Segurança pública é adotada")
    ]
    
    let detailNews = [
        ("A ronda feita com bicicletas foi reativada pela Guarda Municipal de Araras. Segundo a Secretaria Municipal de Segurança Pública e Defesa Civil, os novos gms que se formaram no final do mês de maio já estão realizando este serviço. Oito guardas, divididos em grupos, fazem a ronda nas principais ruas do Centro da cidade - que concentra grande fluxo de pessoas e veículos - e em locais onde a ação de marginais, principalmente nos furtos de veículos, é mais intensa. Os pontos foram definidos após levantamentos realizados pela corporação. O uso das bicicletas permite mais agilidade dos guardas para atender casos de roubos e furtos nestes locais. Viaturas, muitas vezes, encontram dificuldades para perseguir suspeitos em meio ao trânsito, especialmente nos horários de fluxo mais intenso de veículos. “A fiscalização empregando bicicletas é muito eficaz, pela sua flexibilidade, principalmente na região central da cidade, pois o guarda consegue atuar no trânsito e na prevenção de delitos, podendo solicitar ajuda das viaturas que estão em outros bairros, caso haja necessidade”, esclarece o secretário de Segurança Pública e Defesa Civil João Tranquillo Beraldo. Os 58 novos gms que concluíram o curso de formação, no último dia 30 de maio, estão em fase de adaptação para que possam atuar normalmente nas diversas modalidades de patrulhamento realizadas pela Guarda Municipal de Araras, como rondas comunitárias, auxílio na orientação e fiscalização do trânsito, e guarnecendo setores fixos. No momento, não realizam atividades compondo guarnições em viaturas das Rondas Comunitárias, até que recebam o porte de arma e os coletes balísticos. “Por enquanto, os novos guardas municipais atuarão sempre em grupos, em locais em que possam ser apoiados pelas guarnições de serviço normal, priorizando a área central, utilizando as tonfas, classificadas como armamento não letal, e não realizarão rondas com viaturas, disse o secretário.\"","Rafael Farias"),
        ("Secretaria Municipal de Segurança Pública e Defesa Civil convida a sociedade civil para participar do Primeiro Fórum Municipal de Segurança Pública. Voce quer fazer a diferença na sua comunidade? Participe, ajude a construir uma Araras participativa","Enzo Gabriel"),
        ("Nesta tarde, um grupo de adolescentes, adentraram ao Walmart furtaram dois notebooks e 5 jogos para o console Xbox One. Os adolescentes entraram normalmente, pegaram os produtos e fugiram pela etrada principal com  o apoio de vem veiculo que os aguardava na entrada do estabelecimento. Este fato chocou os representantes do conselho tutelar e a opinião pública.","Érika Santana"),
        ("No último final de semana, durante o patrulhamento de rotina, uma equipe da Gurada Municipal nas proximidades da escola municipal Antonia Marques Dahmen percebeu o empreendimento de fuga de um automóvel preto ao visualizar a equipe. Os Guardas Municipais fizeram o acompanhamento do veiculo até conseguirem abordá-lo. Em busca no interior do veículo, foi encontrado um quilo que cocaína. O comandante da Guarda Municipal, eleogiou o trabalho da equipe e disse priorizar o patrulhamento em áreas escolares.","Natalia Pedro"),
        ("Há dois meses ações das forças de segurança e da administração municipal estão em vigor buscando as causas da violência em Araras para a implementação de ações preventivas ao crimes da cidade. Estas ações visam a integração das forcas de segurança e colaboração da comunidade para o desenvolvimento de politicas públicas mais significativas.","Francisco Bezerra")
    ]
    
    
    var indice: Int = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Detail News Started!")
        print("\nIndice: \(indice)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        print("Detail News Started!")
        print("\nIndice: \(indice)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! NewsTableViewCell
//
//        // Configure the cell...
//        
        let (noticia,autor) = detailNews[indice]
//        
        cell.field?.text = autor
        cell.value.text = noticia

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
