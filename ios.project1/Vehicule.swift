//
//  Vehicule.swift
//  ios.project1
//
//  Created by Patrick Moniqui on 17-10-11.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation

class Vehicule {
    
    var annee : Int32
    var marque : String
    var modele : String
    var odometre : Int32
    var nbPortiere : Int32
    var couleurEx : String
    var couleurInt : String
    var typeTransmission : String
    var nbCylindre : Int32
    var options : [String]
    
    init()
    {
        self.annee = 0
        self.marque = ""
        self.modele = ""
        self.odometre = 0
        self.nbPortiere = 0
        self.couleurEx = ""
        self.couleurInt = ""
        self.typeTransmission = ""
        self.nbCylindre = 0
        self.options = [String]()
    }
    
    init(_annee : Int32, _marque : String, _modele : String, _odo : Int32, _nbPorte : Int32, _couleurEx : String, _couleurInt : String, _typeTrans : String, _nbCyl : Int32)
    {
        self.annee = _annee
        self.marque = _marque
        self.modele = _modele
        self.odometre = _odo
        self.nbPortiere = _nbPorte
        self.couleurEx = _couleurEx
        self.couleurInt = _couleurInt
        self.typeTransmission = _typeTrans
        self.nbCylindre = _nbCyl
        self.options = [String]()
    }
    
    func addOption(option : String)
    {
        self.options.append(option)
    }
    
    func addOptions(options : [String])
    {
        for option in options
        {
            self.options.append(option)

        }
    }
    
}
