//
//  SideMenuVCViewController.swift
//  cambridgewines
//
//  Created by Poonam on 31/10/19.
//  Copyright © 2019 Abhishek Rathi. All rights reserved.
//

import UIKit

class SideMenuVCViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    var tableView: UITableView = UITableView()
    let animals = ["Home", "Logout"]
    let cellReuseIdentifier = "cellSide"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
        tableView.frame = CGRect(x: 0, y: 64, width: view.frame.width, height: 100)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SideMenuTableCellTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:SideMenuTableCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! SideMenuTableCellTableViewCell
        
        cell.textLabel?.text = animals[indexPath.row]
    cell.imageView?.image = UIImage(named: "Image-1.png")
   // if indexPath.row == 0{
        //cell.imageCellView?.image = UIImage(named: "Image-1.png")
   // }el
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("You tapped cell number \(indexPath.row).")
        if indexPath.row == 0{
           // let home  = HomeView (nibName: "HomeView", bundle: nil)
            //self.push(viewController: home)
        }else {
            // create the alert
            let alert = UIAlertController(title: "Cambridge Wines", message: "Do you want to logout?", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }


}
