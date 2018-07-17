//
//  TableViewController.swift
//  TestTable
//
//  Created by mohammad mahdi on ۱۳۹۷/۴/۱۶.
//  Copyright © ۱۳۹۷ mohammad mahdi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UISearchControllerDelegate,UISearchResultsUpdating{
    var list = List()
    var filtered = List()
let searchcontroller = UISearchController(searchResultsController: nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchcontroller.searchBar.text , !searchText.isEmpty{
            
       
            if let searchText = searchController.searchBar.text, !searchText.isEmpty {
               var fil = list.ListOfRep.filter{
                rep in
                
                return (rep.name?.lowercased().contains(searchText.lowercased()))!
                }
                filtered = List(repos:fil)
tableView.reloadData()
            }
                
            
        }else{
           filtered = list
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        let navi = self.navigationController?.hidesBarsOnTap = true
        self.navigationController?.title = "sdd"
        self.navigationController?.navigationBar.barTintColor = .red
        self.navigationController?.hidesBarsWhenKeyboardAppears = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdenty")
        
        searchcontroller.searchResultsUpdater = self
        searchcontroller.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchcontroller.searchBar

        
        /// ein ye tike vm hastesh 
        APImanager().getData{(result) in
            self.list = result
            
            self.filtered = self.list
            self.tableView.reloadData()
        }
   
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
        
        
            return filtered.ListOfRep.count

      
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdenty", for: indexPath)

        cell.textLabel?.text = filtered.ListOfRep[indexPath.row].name
        cell.detailTextLabel?.text = filtered.ListOfRep[indexPath.row].FullName
        // Configure the cell...

        return cell
    }
 



}
