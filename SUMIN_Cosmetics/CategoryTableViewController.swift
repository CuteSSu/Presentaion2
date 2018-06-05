//
//  CategoryTableViewController.swift
//  SUMIN_Cosmetics
//
//  Created by SWUCOMPUTER on 2018. 6. 3..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    //카테고리를 크게 3개를 분류해주었다. 각각 카테고리 클릭시 맞는 하장품 리스트를 보여주고 여기에 맞는 화장품들을 추가할 수 있다. 
    var cosmeticCategory:[String:[String]] =
        ["스킨케어":[], "메이크업":[], "바디&헤어":[]]
        

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "카테고리"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cosmeticCategory.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllList Cell", for: indexPath)

        // Configure the cell...
        var categotyName = Array(cosmeticCategory.keys)
        cell.textLabel?.text = categotyName[indexPath.row]

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailTableView"{
            if let destinaiton = segue.destination as? DetailTableViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destinaiton.title = Array(cosmeticCategory.keys) [selectedIndex]
                    destinaiton.detailList = Array(cosmeticCategory.values)[selectedIndex]
                }
            }
        }
    }
}
