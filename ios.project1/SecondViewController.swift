//
//  SecondViewController.swift
//  ios.project1
//
//  Created by Patrick Moniqui on 17-10-05.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var prixVehicule : Float = 0
    
    @IBOutlet weak var txtMiseFond: UITextField!
    @IBOutlet weak var txtPrixVehicule: UITextField!
    @IBOutlet weak var txtTauxInteret: UITextField!
    @IBOutlet weak var txtTaux: UITextField!
    @IBOutlet weak var btnCalcul: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCalcul.addTarget(self, action: "btnCalcul_Click:", for: .touchUpInside)
    }
    
    func btnCalcul_Click(_ sender: AnyObject?) {
        if FieldValidation() {
            var miseFond = Float(txtPrixVehicule.text!)! - Float(txtMiseFond.text!)!
            var interet : Float = Float(txtTauxInteret.text!)!
            var nbMois : Int32 = Int32(txtTaux.text!)!
            
            var prix : Float = CalculPrixMensuel(montant: miseFond, interet: interet, nbMois: nbMois)
            
            lblResult.text = "Le prix par mois est: " + String(prix)
        }
        else
        {
            lblResult.text = "Veuillez entrer des données valides."
        }
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func FieldValidation() -> Bool
    {
        var result : Bool = true;
        
        if let mFloat = Float(txtMiseFond.text!) {
            print("Your string is float.")
        }else {
            result = false
        }
        
        if let mFloat = Float(txtPrixVehicule.text!) {
            print("Your string is float.")
        }else {
            result = false
        }
        
        if let mFloat = Float(txtTauxInteret.text!) {
            print("Your string is float.")
        }else {
            result = false
        }
        
        if let mFloat = Float(txtTaux.text!) {
            print("Your string is float.")
        }else {
            result = false
        }
        
        return result
    }

    func CalculPrixMensuel(montant: Float, interet: Float, nbMois: Int32) -> Float
    {
        var prix : Float = 0
        var _pow = pow(Double((1+interet/12)), Double(nbMois))
        
        var num = montant * interet / (Float(nbMois)/12)
        var den = Double(1) - Double(1 / _pow)
        
        prix = Float(num / Float(den))
        
        return prix / Float(nbMois)
    }


}

