//
//  ViewController.swift
//  DemoCoreData
//
//  Created by Đừng xóa on 7/2/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view, typically from a nib.
        guard let entity = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] else { return  }
        textField.text = entity?.last?.name
    }

    @IBAction func ButtonTap(_ sender: UIButton) {
        guard textField.text != nil else {return}
        let entity = Entity(context: AppDelegate.context)
        entity.name = textField.text
        AppDelegate.saveContext()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

