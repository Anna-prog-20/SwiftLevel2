import UIKit

class FriendsController: UITableViewController {
    
    var symbolControl: SymbolControl!
    
    var friendsName = [
            "Bob",
            "Sara",
            "Koly",
            "Bill",
            "Any",
            "Alex"
        ]
    
    var friends: [User] = []
    var groupSymbol: [GroupSymbol] = []
    
    var idFriend: Int!
    var seguePhoto: PhotoController!
    
    func fillData() {
        friendsName.sort()
        for i in 0...friendsName.count - 1 {
            let user = User(id: i, name: friendsName[i])
            friends.append(user)
        }
    }
    
    override func viewDidLoad() {
        fillData()
        writeGroupFriend()
        //symbolControl.groupSymbol = groupSymbol
        symbolControl = SymbolControl.init(frame: CGRect(x: view.frame.maxX - 20, y: 0, width: 20, height: view.frame.height),groupSymbol: groupSymbol)
        
        symbolControl.isUserInteractionEnabled = true
        view.addSubview(symbolControl)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        symbolControl.frame = CGRect.init(x: symbolControl.frame.origin.x, y: scrollView.contentOffset.y + 120, width: symbolControl.frame.width, height: symbolControl.frame.height)
    }
    
    func writeGroupFriend() {
        var i = 0
        var k = 0
        var firstSymbol = ""
        for friend in friends {
            let nameFriend = friend.name
            let friendSymbol = String(nameFriend[nameFriend.startIndex])
            if firstSymbol != friendSymbol {
                k = i
                groupSymbol.append(GroupSymbol(id: i, name: friendSymbol))
                groupSymbol[i].users.append(friend)
                i = i + 1
            }
            else {
                groupSymbol[k].users.append(friend)
            }
            firstSymbol = friendSymbol
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        idFriend = groupSymbol[indexPath.section].users[indexPath.row].id
        seguePhoto.idFriend = idFriend
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupSymbol[section].users.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friend", for: indexPath) as! FriendsCell
        let friend = groupSymbol[indexPath.section].users[indexPath.row]
        cell.nameFriend.text = friend.name
        cell.faceImage.setImage(named: "\(friend.id)")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idFriend" {
           seguePhoto = segue.destination as? PhotoController
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupSymbol.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(groupSymbol[section].name)"
        }
    
}

