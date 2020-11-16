import UIKit

class MyGroupsController: UITableViewController {
    
    var groupsName = [
            "Защита животных"
        ]
    var groups: [Group] = []
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            let groupsController = segue.source as! GroupsController
            if let indexPath = groupsController.tableView.indexPathForSelectedRow {
                let group = groupsController.filteredData[indexPath.row]
                let groupFilter = groups.filter({
                    (item: Group) -> Bool in
                    return item.name.range(of: group.name, options: .caseInsensitive) != nil
                })
                if groupFilter.count <= 0 {
                    groups.append(group)
                }
               tableView.reloadData()
            }
        }
    }
    
    func fillData() {
        groupsName.sort()
        for i in 0...groupsName.count - 1 {
            let group = Group(id: i, name: groupsName[i])
            groups.append(group)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "Group", for: indexPath) as! MyGroupsCell

        let group = groups[indexPath.row]
        cell.nameGroup.text = group.name
        cell.faceImage.setImage(named: "gr\(indexPath.row)")
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
