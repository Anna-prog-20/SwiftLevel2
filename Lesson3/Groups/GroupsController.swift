import UIKit

class GroupsController: UITableViewController {
    
    var groups = [
            "Group1",
            "Group2",
            "Group3"
        ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return groups.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchGroup", for: indexPath) as! GroupsCell

        let group = groups[indexPath.row]
        cell.nameGroupGlobal.text = group
        cell.faceImageGroupGlobal.image = UIImage(named: "gr\(indexPath.row)")
        
        return cell
    }

   
}

