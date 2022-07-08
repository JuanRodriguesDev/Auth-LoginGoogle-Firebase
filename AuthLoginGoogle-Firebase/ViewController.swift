//
//  ViewController.swift
//  AuthLoginGoogle-Firebase
//
//  Created by Juan Rodrigues a on 07/07/22.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class ViewController: UIViewController, GIDSignInDelegate {

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func alert (title:String, menssage:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: menssage, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func tappedLoginGoogleButton(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.SignIn()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user : GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            return
        }
    
        guard let auth = user.authentication else{return}
        
        let credenciais = FIRGoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
    
        Auth.auth().signIn(with: credenciais) { (result, error) in
            if error != nil{
                self.alert(title: "Falha ao logar", menssage: "Por favor tente novamente mais tarde")
                
            }else{
                
                self.alert(title: "Sucesso ao Logar", menssage: "Login realizado com sucesso")
                
            }
        }
        
        
    }
    
    
    
    
    
    
    
    @IBAction func tappedLogOutButton(_ sender: Any) {
    }
    

}

