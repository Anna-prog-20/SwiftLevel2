import UIKit

class FriendsController: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet var tableFriends: UITableView!
    @IBOutlet weak var searchFriend: UISearchBar!
    
    var symbolControl: SymbolControl!
    
    var friendsName = [
            "Bob",
            "Sara",
            "Koly",
            "Bill",
            "Any",
            "Alex",
            "Petya",
            "Bib"
        ]
    
    var friends: [User] = []
    var groupSymbol: [GroupSymbol] = []
    var filteredData: [User]!
    
    var idFriend: Int!
    var seguePhoto: PhotoController!
    private let headerID = String(describing: HeaderSection.self)
    
    func fillData() {
        friendsName.sort()
        for i in 0...friendsName.count - 1 {
            let user = User(id: i, name: friendsName[i])
            friends.append(user)
        }
    }
    
    override func viewDidLoad() {
        tableFriends.dataSource = self
        searchFriend.delegate = self
        
        fillData()
        filteredData = friends
        
        writeGroupFriend()
        
        
        tableView.register(UINib(nibName: headerID, bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
        symbolControl = SymbolControl.init(frame: CGRect(x: view.frame.maxX - 20, y: 0, width: 20, height: view.frame.height),groupSymbol: groupSymbol)
        
        symbolControl.isUserInteractionEnabled = true
        view.addSubview(symbolControl)
        symbolControl.layer.zPosition = 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! HeaderSection
        header.setBackgroundColor(color: view.backgroundColor!, alpha: 0.5)
        header.textHeader.text = groupSymbol[section].name
        return header
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        symbolControl.frame = CGRect.init(x: symbolControl.frame.origin.x, y: scrollView.contentOffset.y + 130, width: symbolControl.frame.width, height: symbolControl.frame.height)
    }
    
    func writeGroupFriend() {
        var i = 0
        var k = 0
        var firstSymbol = ""
        for friend in filteredData {
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
        }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? friends : friends.filter({
            (item: User) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive) != nil
        })
        groupSymbol = []
        writeGroupFriend()
        tableFriends.reloadData()
    }
    
}

