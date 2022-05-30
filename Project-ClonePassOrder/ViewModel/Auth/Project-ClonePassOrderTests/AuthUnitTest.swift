//
//  Project_ClonePassOrderTests.swift
//  Project-ClonePassOrderTests
//
//  Created by 정덕호 on 2022/05/30.
//

import XCTest
@testable import Project_ClonePassOrder

class AuthUnitTest: XCTestCase {
    
    var sut: AuthViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AuthViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    func test_textFieldEmptyVaild를_호출시_email_password_파라미터에_둘중_하나라도빈문자열을_전달했을때_email변수와_password변수가_모두_nil인지() {
        //given
        let emailText = ""
        let paswordText = "123123"
        
        //when
        sut.textFieldEmptyVaild(email: emailText, password: paswordText)
        
        //then
        XCTAssertNil(sut.email, "이메일이 Nil이 아닙니다.")
        XCTAssertNil(sut.password, "패스워드가 Nil이 아닙니다")
    }
    func test_textFiledEmptyVaild를_호출시_email_password_파라미터에_둘모두_비어있지않은_문자열을_전달했을때_전달받은값과_변수가_모두일치하는지() {
        //given
        let emailText = "qwer@naver.com"
        let passwordText = "123456"

        //when
        sut.textFieldEmptyVaild(email: emailText, password: passwordText)
        
        //then
        XCTAssertEqual(sut.email, emailText, "이메일이 일치하지않습니다")
        XCTAssertEqual(sut.password, passwordText, "패스워드가 일치하지않습니다")
    }
    func test_textFieldEmptyString을_호출시_textfieldEmptyValue값이_emailEmpty인경우_아이디를입력해주세요를_리턴하는지() {
        //given
        sut.textfildEmpty.value = .emailEmpty
        
        //when
        let vaild = sut.textFieldEmptyString()
        
        //then
        XCTAssertEqual(vaild,"아이디를 입력해주세요!", "리턴하지않습니다")
    }
    func test_textFieldEmptyString을_호출시_textfieldEmptyValue값이_passwordEmpty인경우_비밀번호를입력해주세요를_리턴하는지() {
        //given
        sut.textfildEmpty.value = .passwordEmpty
        
        //when
        let vaild = sut.textFieldEmptyString()
        
        //then
        XCTAssertEqual(vaild,"비빌번호를 입력해주세요!", "리턴하지않습니다")
    }

}
