//
//  FakeLoginActionService.swift
//  UnitTestingViewControllerTests
//
//  Created by EquipeSuporteAplicacao on 5/23/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit
@testable import UnitTestingViewController

class FakeLoginActionService: LoginServiceDelegate {
    
    var isLoginSuccessFullCalled = false
    var isHandleErrorCalled = false
    var error : LoginServiceError? = nil
    
    func loginSuccessfull(withUser: String) {
        isLoginSuccessFullCalled = true
    }
    
    func handle(error: LoginServiceError) {
        isHandleErrorCalled = true
        self.error = error
    }
}

class FakeFailureLoginService: LoginService {
    let error : LoginServiceError
    var delegate: LoginServiceDelegate
    
    init(error : LoginServiceError, delegate : LoginServiceDelegate) {
        self.error = error
        self.delegate = delegate
    }
    
    func login(withUsername username: String?, password: String?) {
        delegate.handle(error: error)
    }
}

//class FakeSuccessLoginService :

