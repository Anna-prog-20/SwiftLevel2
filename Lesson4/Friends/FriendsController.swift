import UIKit

class FriendsController: UITableViewController {
    
    var friends = [
            "Bob",
            "Sara",
            "Koly"
        ]
    
    var idFriend: Int!
    var seguePhoto: PhotoController!
    
    override func viewDidLoad() {
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        idFriend = indexPath.row
        seguePhoto.idFriend = idFriend
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friends.count
        }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friend", for: indexPath) as! FriendsCell
        let friend = friends[indexPath.row]
        cell.nameFriend.text = friend
        cell.faceImage.setImage(named: "\(indexPath.row)")
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idFriend" {
           seguePhoto = segue.destination as? PhotoController
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

