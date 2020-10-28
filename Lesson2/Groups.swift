import UIKit

class Groups: UITableViewController {
    
    var groups = [
            "Bob",
            "Sara",
            "Koly"
        ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return groups.count
        }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "Group", for: indexPath)

        let group = groups[indexPath.row]
        cell.textLabel?.text = group
        
        let countPeople = Int.random(in: 0..<10000)
        cell.detailTextLabel?.text = "\(countPeople) чел."
        
        return cell
    }

   
}

