//
//  ViewController.swift
//  UnitTestingViewController
//
//  Created by EquipeSuporteAplicacao on 5/23/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnEnter: UIButton!
    
    var loginService : LoginService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginService = LoginServiceHandler(delegate: self)
    }
    
    @IBAction func acessSystem(_ sender: UIButton) {
        loginService.login(withUsername: "teste", password: "teste")
    }
}

extension ViewController : LoginServiceDelegate{
    func loginSuccessfull(withUser: String) {}
    func handle(error: LoginServiceError) {}
}

public enum Result<T>{
    case success(T)
    case error(Error)
}

public enum LoginFormValidationError : Error{
    case invalidUsernameLength
    case invalidPasswordLength
    case invalidPasswordCharacters
}

public enum LoginServiceError : Error{
    case invalidCredentials
    case nilData
    case wrongStatusCode
    case unknown
}

protocol LoginService {
    var delegate : LoginServiceDelegate { get }
    func login(withUsername username : String?, password : String?)
}

protocol LoginServiceDelegate {
    func loginSuccessfull(withUser : String)
    func handle(error : LoginServiceError)
}

class LoginServiceHandler: LoginService {
    
    let delegate: LoginServiceDelegate
    
    init(delegate : LoginServiceDelegate) {
        self.delegate = delegate
    }
    
    func login(withUsername username: String?, password: String?) {
        
    }
}


