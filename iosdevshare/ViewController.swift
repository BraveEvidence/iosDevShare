//
//  ViewController.swift
//  iosdevshare
//
//  Created by Pritish Sawant on 14/01/21.
//  Copyright © 2021 Pritish Sawant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(UserDefaults.standard.string(forKey: "incomingURL"))
        name.text = "Hi there"
         setupNotification()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setupNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(setUrl),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.setUrl()
    }

    @objc func setUrl() {
        if let incomingURL = UserDefaults(suiteName: "group.ShareExtension102")?.value(forKey: "incomingURL") as? String {
            name.text = incomingURL
            print(incomingURL)
            UserDefaults(suiteName: "group.ShareExtension102")?.removeObject(forKey: "incomingURL")
        }
    }



}

