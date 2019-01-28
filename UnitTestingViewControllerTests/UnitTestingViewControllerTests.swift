//
//  UnitTestingViewControllerTests.swift
//  UnitTestingViewControllerTests
//
//  Created by EquipeSuporteAplicacao on 5/23/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import XCTest
@testable import UnitTestingViewController

class UnitTestingViewControllerTests: XCTestCase {
    
    var vcLogin : ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        vcLogin = vc
        _ = vcLogin.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDataNilIntoLoginServiceEndToEnd() {
        
        let fakeDelegateLoginService = FakeLoginActionService()
        let fakeLoginService = FakeFailureLoginService(error: .nilData , delegate: fakeDelegateLoginService)
        
        fakeLoginService.login(withUsername: "hue", password: "teste")
        
        XCTAssert(fakeLoginService.error == .nilData)
        XCTAssertTrue(fakeDelegateLoginService.isHandleErrorCalled)
    }
}
