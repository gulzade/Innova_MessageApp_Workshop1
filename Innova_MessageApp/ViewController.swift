//
//  ViewController.swift
//  Innova_MessageApp
//Gülzade Karataş, Barlas Orkun Tuna, Alican Kurt Innova Bootcamp Workshop1
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var msg: UITextView!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var oncelikSwitchButton: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        text1.layer.borderColor = UIColor.black.cgColor
        text1.layer.borderWidth = 2
        msg.layer.borderWidth = 2.0
            
    }


    @IBAction func sendMsg(_ sender: Any) {
        guard let email = text1.text as? String else{
            return
        }
        if email.isEmpty{
            info.text = "Email alanını boş bırakmayınız!"
        }else if !email.contains("@") {
            info.text = "Email hatalı girildi, lütfen kontrol ediniz!"
        }else if email.count < 5{
            info.text = "Email eksik girildi, lütfen kontrol ediniz!"
        }else{
            // E-mail doğru
            guard let message = msg.text as? String else{
                return
            }
            if message.isEmpty{
                info.text = "Mesaj alanını boş bırakmayınız!"
            }else{
                
                if email.contains(","){
                    let address = email.split(separator: ",")
                    for mail in address {
                        if(!mail.contains("@")){
                            info.text = "Emaillerden biri hatalı girildi, lütfen kontrol ediniz!"
                            return
                        }
                    }
                    writeToLabel(emailArray: address, message: message)
                }else{
                    // Eğer tek email varsa
                    let address = email.split(separator: ",")
                    writeToLabel(emailArray: address, message: message)
                }
                
            }
            
        }
    }
    
    public func writeToLabel(emailArray: Array<Substring>, message: String ){
        var emailString = ""
        
        for email in emailArray{
            emailString = "To: \(email) \n \(emailString)"
        }
        info.text = "\(emailString) \nmesaj: \(message)"
        if oncelikSwitchButton.isOn{
            info.textColor = .red
        }else{
            info.textColor = .black
        }
        
    }
    
    
    
}

