//
//  ViewController.swift
//  Saker9nov
//
//  Created by Bill Martensson on 2020-11-09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var theTableview: UITableView!
    
    var names = [String]()
    var amount = [Int]()

    var markedRow : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        names.append("Arne")
        names.append("Bengt")
        names.append("Caesar")
        names.append("David")
        names.append("Erik")

        amount.append(7)
        amount.append(4)
        amount.append(0)
        amount.append(0)
        amount.append(0)

        theTableview.dataSource = self
        theTableview.delegate = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PersonTableViewCell
        
        cell.thevc = self
        cell.myIndexpath = indexPath
        
        cell.nameLabel.text = names[indexPath.row]
        cell.amountLabel.text = String(amount[indexPath.row])
        
        cell.backgroundColor = .white
        if(markedRow != nil)
        {
            if(markedRow == indexPath.row)
            {
                cell.backgroundColor = .red
            }
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .normal, title: "Add") { (action, view, handler) in
                    print("Add Action Tapped")
        }
        deleteAction.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
                    print("Delete Action Tapped")
            self.names.remove(at: indexPath.row)
            self.theTableview.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = .red

        let archiveAction = UIContextualAction(style: .destructive, title: "Archive") { (action, view, handler) in
                    print("Archive Action Tapped")
        }
        archiveAction.backgroundColor = .blue


        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, archiveAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let mrow = markedRow
        {
            if(mrow == indexPath.row)
            {
                return 150
            }
        }
        
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let mrow = markedRow
        {
            if(mrow == indexPath.row)
            {
                markedRow = nil
                theTableview.reloadData()
                return
            }
        }
        
        
        markedRow = indexPath.row
        //theTableview.reloadRows(at: [indexPath], with: .fade)
        theTableview.reloadData()
    }
    
    func letsPlus(rownumber : IndexPath)
    {
        amount[rownumber.row] += 1
        theTableview.reloadData()
    }
    func letsMinus(rownumber : IndexPath)
    {
        amount[rownumber.row] -= 1
        theTableview.reloadData()
    }

    
}

