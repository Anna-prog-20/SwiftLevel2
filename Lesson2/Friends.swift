import UIKit

class Friends: UITableViewController {
    
    var friends = [
            "Bob",
            "Sara",
            "Koly"
        ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friends.count
        }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friend", for: indexPath) 
  
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend
        
        let year = Int.random(in: 1988..<2006)
        cell.detailTextLabel?.text = "\(year) г.р."
        
        return cell
    }

}
