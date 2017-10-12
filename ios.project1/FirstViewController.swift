//
//  FirstViewController.swift
//  ios.project1
//
//  Created by Patrick Moniqui on 17-10-05.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var vehicules : [Vehicule] = [Vehicule]()
    let vehiculeDao = VehiculeDao()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var vec1 = Vehicule(_annee: 2005, _marque: "Honda", _modele: "Civic", _odo: 180000, _nbPorte: 2, _couleurEx: "Rouge", _couleurInt: "Beige", _typeTrans: "Manuel", _nbCyl: 4)
        vec1.addOption(option: "Groupe électrique")
        var vec2 = Vehicule(_annee: 2013, _marque: "Acura", _modele: "ILX", _odo: 90000, _nbPorte: 4, _couleurEx: "Blanc", _couleurInt: "Noir", _typeTrans: "Manuel", _nbCyl: 4)
        vec2.addOptions(options: ["Groupe électrique", "Banc chauffant", "Mirror chauffant"])
        var vec3 = Vehicule(_annee: 2015, _marque: "Toyota", _modele: "Corolla", _odo: 158000, _nbPorte: 4, _couleurEx: "Vert", _couleurInt: "Noir", _typeTrans: "Automatique", _nbCyl: 4)
        
        vehiculeDao.DeleteAllVehicule()
            
        vehiculeDao.AddVehicule(vehicule: vec1)
        vehiculeDao.AddVehicule(vehicule: vec2)
        vehiculeDao.AddVehicule(vehicule: vec3)
        vehicules = vehiculeDao.GetVehiculeList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicules.count
    
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = String(vehicules[indexPath.row].annee) + " " + vehicules[indexPath.row].marque + " " + vehicules[indexPath.row].modele
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVehicule = vehicules[indexPath.row]
        performSegue(withIdentifier: "VehiculeDetailSegue", sender: selectedVehicule)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let contact = UITableViewRowAction(style: .normal, title: "Contact") { action, index in
            (self.performSegue(withIdentifier: "ContactSegue", sender: nil))
        }
        contact.backgroundColor = .lightGray
        
        return [contact]
    }

    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier!
        {
        case "VehiculeDetailSegue" :
            let viewController : VehiculeDetailViewController = segue.destination as! VehiculeDetailViewController
            viewController.vehiculeDetail = sender as? Vehicule
            
        case "ContactSegue" :
            break
            
        default:
            break

        }
    }
}

