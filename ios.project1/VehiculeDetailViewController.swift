//
//  VehiculeDetailController.swift
//  ios.project1
//
//  Created by Patrick Moniqui on 17-10-11.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import UIKit

class VehiculeDetailViewController: UIViewController {
    
    @IBOutlet weak var lblAnnee: UILabel!
    @IBOutlet weak var lblMarque: UILabel!
    @IBOutlet weak var lblModele: UILabel!
    @IBOutlet weak var lblOdometre: UILabel!
    @IBOutlet weak var lblNbPortiere: UILabel!
    @IBOutlet weak var lblCouleurEx: UILabel!
    @IBOutlet weak var lblCouleurINt: UILabel!
    @IBOutlet weak var lblTypeTrans: UILabel!
    @IBOutlet weak var lblNbCyl: UILabel!
    @IBOutlet weak var lblOptions: UILabel!
    @IBOutlet weak var btnContact: UIBarButtonItem!
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    var vehiculeDetail : Vehicule?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadVehicule(vehicule: vehiculeDetail!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LoadVehicule(vehicule: Vehicule)
    {
        lblAnnee.text = String(vehicule.annee)
        lblMarque.text = vehicule.marque
        lblModele.text = vehicule.modele
        lblOdometre.text = String(vehicule.odometre)
        lblNbPortiere.text = String(vehicule.nbPortiere)
        lblCouleurEx.text = vehicule.couleurEx
        lblCouleurINt.text = vehicule.couleurInt
        lblTypeTrans.text = vehicule.typeTransmission
        lblNbCyl.text = String(vehicule.nbCylindre)
        lblOptions.text = "- " + vehicule.options.joined(separator: "\n- ")
        
        // Tab item
        navItem.title = String(vehicule.annee) + " " + vehicule.marque + " " + vehicule.modele
    }
}

