//
//  ViewController.swift
//  HungryBruins
//
//  Created by XCodeClub on 2018-03-30.
//  Copyright © 2018 LA_HACKS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    @IBOutlet weak var email_text: UITextField!
    
    @IBOutlet weak var logIn: UIButton!
    
    @IBOutlet weak var pwText: UITextField!
    
    @IBOutlet weak var regiEmail: UITextField!
    
    @IBOutlet weak var regiPW: UITextField!
    
    @IBOutlet weak var ConfirmPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInTapped(_ sender: UIButton) {
        //Form validation on email
        if let email=email_text.text, let pass=pwText.text
        {
            Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                if let u=user
                {
//                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//                    let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("nextView") as NextViewController
//                    self.presentViewController(nextViewController, animated:true, completion:nil)
                    
                    self.performSegue(withIdentifier: "loginid", sender: self)
                }
                else
                {

                }
            })
        }
    }
    
    @IBAction func registerTapped(_ sender: UIButton)
    {
        let email = regiEmail.text
        let pw = regiPW.text
        let pwc = ConfirmPW.text
        if  email != "" && pw != "" && pwc != "" && pw == pwc
        {
            Auth.auth().createUser(withEmail: email!, password: pw!, completion: { (user, error) in
                if let u=user
                {
                    self.performSegue(withIdentifier: "registerToPlaces", sender: self)
                }
                else
                {
                    
                }
            })
        }
        
    }
    
    
}

