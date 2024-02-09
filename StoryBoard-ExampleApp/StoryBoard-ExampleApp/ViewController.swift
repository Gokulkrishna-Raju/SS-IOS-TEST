//
//  ViewController.swift
//  StoryBoard-ExampleApp
//
//  Created by Gokulkrishna raju on 31/01/24.
//

import UIKit
import SurveySparrow

class ViewController: UIViewController, SsSurveyDelegate {
    
    @IBOutlet weak var ssSurveyView: SsSurveyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var domain: String = "mobile-sdk.surveysparrow.com"
    var token: String = "ntt-aMYx9J89WmrV46pvbGEJNz"
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      let surveySparrow = SurveySparrow(domain: domain, token: token)
      surveySparrow.params = ["emailaddress":"email@email.com","email":"email@email.com"]
      surveySparrow.scheduleSurvey(parent: self)
    }

    // MARK: Actions
    @IBAction func startFullscreenSurvey(_ sender: UIButton) {
      let ssSurveyViewController = SsSurveyViewController()
      ssSurveyViewController.domain = domain
      ssSurveyViewController.token = token
      ssSurveyViewController.params = ["emailaddress":"email@email.com","email":"email@email.com"]
      ssSurveyViewController.getSurveyLoadedResponse = true
      ssSurveyViewController.surveyDelegate = self
      present(ssSurveyViewController, animated: true, completion: nil)
    }

    @IBAction func startSurvey(_ sender: Any) {
        ssSurveyView.loadFullscreenSurvey(parent: self,delegate: self, domain:domain,
        token:token, params:["emailaddress":"email@email.com","email":"email@email.com"])
    }
    
    @IBAction func showEmbeddedSurvey(_ sender: Any) {
        ssSurveyView.loadEmbedSurvey(domain:domain,token:token, params:["emailaddress":"email@email.com","email":"email@email.com"])
    }
    
    
    func handleSurveyResponse(response: [String : AnyObject]) {
      print(response)
    }

    func handleSurveyLoaded(response: [String : AnyObject]){
      print(response)
    }

    func handleSurveyValidation(response: [String : AnyObject]) {
      print(response)
    }

}

