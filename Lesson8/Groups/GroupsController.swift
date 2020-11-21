import UIKit

class GroupsController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var tableGroups: UITableView!
    @IBOutlet weak var searchGroup: UISearchBar!
    
    var groupsName = [
            "Group1",
            "Group2",
            "Group3"
        ]
    var groups: [Group] = []
    var filteredData: [Group]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableGroups.dataSource = self
        searchGroup.delegate = self
        fillData()
        filteredData = groups
    }
    
    func fillData() {
        groupsName.sort()
        for i in 0...groupsName.count - 1 {
            let group = Group(id: i, name: groupsName[i])
            groups.append(group)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchGroup", for: indexPath) as! GroupsCell

        let group = filteredData[indexPath.row]
        cell.nameGroupGlobal.text = group.name
        cell.faceImage.setImage(named: "gr\(indexPath.row)")
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? groups : groups.filter({
            (item: Group) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableGroups.reloadData()
    }
   
}

