import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var nameFriend: UILabel!
    @IBOutlet weak var faceImageFriend: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
