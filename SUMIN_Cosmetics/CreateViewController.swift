//
//  CreateViewController.swift
//  SUMIN_Cosmetics
//
//  Created by SWUCOMPUTER on 2018. 6. 3..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textName: UITextField!
    @IBOutlet var textID: UITextField!
    @IBOutlet var textPW: UITextField!
    @IBOutlet var textNickName: UITextField!
    @IBOutlet var labelStatus: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textName{
            textField.resignFirstResponder()
            self.textID.becomeFirstResponder() //이름 입력 후 아이디로 이동
        }
        else if textField == self.textID{
            textField.resignFirstResponder()
            self.textPW.becomeFirstResponder() //아이디 입력 후 비번으로 이동
        }
        else if textField == self.textPW{
            textField.resignFirstResponder()
            self.textNickName.becomeFirstResponder() //비번 입력 후 별명으로 이동
        }
        textField.resignFirstResponder()
        return true
    }
    
    // 저장버튼을 눌렀을때 label에 상태를 알려주는 함수이다.
    @IBAction func buttonCheck() {
        if textName.text == "" {
            labelStatus.text = "이름을 입력하세요"; return;
        }
        if textID.text == "" {
            labelStatus.text = "아이디을 입력하세요"; return;
        }
        if textPW.text == "" {
            labelStatus.text = "비번을 입력하세요"; return;
        }
        if textNickName.text == "" {
            labelStatus.text = "화장대 별명을 입력하세요"; return;
        }
        //서버를 통해 로그인 정보를 서버에 저장해준다.
        let urlString: String = "http://condi.swu.ac.kr/student/cosmetic/insertUser.php"
        guard let requestURL = URL(string: urlString) else{
            return
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        let restString: String = "name=" + textName.text! + "&id" + textID.text! + "&password" + textPW.text! + "&nickName" + textNickName.text!
        request.httpBody = restString.data(using: .utf8)
        self.executeRequest(request: request)
    }
    
    @IBAction func buttonSave() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func executeRequest(request: URLRequest) -> Void{
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print("Error: calling POST")
                return
            }
            guard let receivedData = responseData else {
                print("Error: not receiving Data")
                return
            }
            if let utf8Data = String(data: receivedData, encoding: .utf8) { DispatchQueue.main.async { // for Main Thread Checker
                self.labelStatus.text = utf8Data
                print(utf8Data) // php에서 출력한 echo data가 debug 창에 표시됨
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
