//
//  ViewController.swift
//  Networking
//
//  Created by Jyo Mithun on 18/10/17.
//  Copyright © 2017 m-innotech. All rights reserved.
//
import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var dataSourceArray = [Actor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let apiCall = APIMananer.shared.fetchActorsFromApi()
        apiCall.then {
            actors -> Void in
            self.dataSourceArray = actors
            self.table.reloadData()
            }.catch{ error -> Void in
                
        }
        
    }

 
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell") as! ActorCell
        cell.name.text = dataSourceArray[indexPath.row].name!
        cell.country.text = dataSourceArray[indexPath.row].country!
        cell.spouse.text = dataSourceArray[indexPath.row].spouse!
        cell.descLabel.text = dataSourceArray[indexPath.row].des
        let url = URL(string:dataSourceArray[indexPath.row].imageURL!)
        cell.actorImage.af_setImage(withURL: url!)
        
        return cell
    }
    
    
}
    




