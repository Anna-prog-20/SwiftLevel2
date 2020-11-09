import UIKit

class FriendsController: UITableViewController {
    
    var friends = [
            "Bob",
            "Sara",
            "Koly",
            "Bill",
            "Any",
            "Alex"
        ]
    var groupFriend: [String] = []
    var countFriendInGroup: [Int] = []
    var index = 0
    
    var idFriend: Int!
    var seguePhoto: PhotoController!
    
    override func viewDidLoad() {
        writeGroupFriend()
    }
    
    func writeGroupFriend() {
        var i = 0
        friends.sort()
        var firstSymbol = ""
        for friend in friends {
            if firstSymbol != String(friend[friend.startIndex]) {
                groupFriend.append(String(friend[friend.startIndex]))
                countFriendInGroup.append(groupFriend.count - i)
                i = i + 1
            }
            else {
                countFriendInGroup[i-1] = countFriendInGroup[i-1] + 1
            }
            firstSymbol = String(friend[friend.startIndex])
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var i = 0
        let cell = tableView.cellForRow(at: indexPath) as!  FriendsCell
        let nameFriend = cell.nameFriend.text
        i = searchIndexSelectFriend(nameFriend: nameFriend!)
        idFriend = i
        seguePhoto.idFriend = idFriend
    }
    
    func searchIndexSelectFriend(nameFriend: String) -> Int{
        var i = 0
        for k in 0...friends.count - 1 {
           if friends[k] != nameFriend {
                i = i + 1
            }
            else {
                break
            }
        }
        return i
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countFriendInGroup[section]
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friend", for: indexPath) as! FriendsCell
        friends.sort()
        let friend = friends[index]
        cell.nameFriend.text = friend
        cell.faceImage.setImage(named: "\(index)")
        index = index + 1
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idFriend" {
           seguePhoto = segue.destination as? PhotoController
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupFriend.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "\(groupFriend[section])"
        }
    
}

