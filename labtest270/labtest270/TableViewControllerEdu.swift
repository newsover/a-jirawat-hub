//
//  TableViewControllerEdu.swift
//  labtest270
//
//  Created by Student on 7/11/2561 BE.
//  Copyright © 2561 Student. All rights reserved.
//

import UIKit

class TableViewControllerEdu: UITableViewController {
    var webSchool:Array = ["http://google.co.th","http://google.co.th","http://google.co.th"]
    var imgSchool:Array = ["SWULOGO.png","logo_school.jpg","Logo_pramoch.gif"]
    var txtSchool:Array = ["SWU","WPM","PMR"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 180

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellList", for: indexPath) as!TableViewCellEdu
        cell.imgSchool.image = UIImage.init(named: imgSchool[indexPath.row])
        cell.txtSchool.text = txtSchool[indexPath.row]
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowData = self.tableView.indexPathForSelectedRow?.row
        let site = segue.destination as!webViewController
        site.schoolSite = webSchool[rowData!]
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
}
}
