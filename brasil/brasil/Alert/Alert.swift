//
//  Alert.swift
//  brasil
//
//  Created by Eduardo on 20/12/23.
//

import UIKit
import Foundation

enum AlertStrings: String {
    case atention = "Atenção"
    case errorlogin = "Erro ao logar. Verifique seus dados e tente novamente!"
    case errorIncorrect = "Dados incorretos"
    case cancelLoginGoogle = "Você cancelou o acesso com google"
    case cancelLoginFacebook = "Você cancelou o acesso com Facebook"
    case errorRegister = "Erro ao cadastrar. Verifique seus dados"
    case sucessRegister = "Registro realizado com sucesso!"
    case congratulations = "Parabéns"
    case characters = "Inserir um nome com no mínimo 2 caractéries"
    
}

class Alert: NSObject {

        var controller: UIViewController


        init(controller: UIViewController) {
            self.controller = controller

        }

        func getAlert(title: String, message: String, completion: (() -> Void)? = nil ) {

            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel) { share in
                completion?()
            }

            alertController.addAction(cancel)
            self.controller.present(alertController, animated: true, completion: nil)

        }

    }


