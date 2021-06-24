//
//  HomeVM.swift
//  BasicSwift
//
//  Created by Edo Oktarifa on 11/04/21.
//

import Foundation
import UIKit

class HomeVM: NSObject {
    func generateViewModel() -> [HomeModel] {
        let homeData = [HomeModel(homeTitle: "Egg Time",action: #selector(eggSelected(vc:)), disclosure: true),
                        HomeModel(homeTitle: "Xylophone",action: #selector(xylophoneSelected(vc:)), disclosure: false),
                        HomeModel(homeTitle: "Quiz", action: #selector(quizSelected(vc:)), disclosure: true),
                        HomeModel(homeTitle: "Quiz Multiple Choice", action: #selector(quizMultipleChoiceSelected(vc:)), disclosure: true)
        ]
        return homeData
    }
    
    @objc func eggSelected(vc parent: UIViewController){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EggViewController")
        parent.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func xylophoneSelected(vc parent: UIViewController){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "XylophoneViewController")
        parent.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func quizSelected(vc parent: UIViewController){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizViewController")
        parent.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func quizMultipleChoiceSelected(vc parent: UIViewController){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizMultipleChoiceVC")
        parent.navigationController?.pushViewController(vc, animated: true)
    }
}
