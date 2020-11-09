import UIKit
@IBDesignable
class FaceImageView: UIView {
    private var faceImage: FaceImage
    
    @IBInspectable var radiusShadow: CGFloat = 10 {
            didSet {
                setNeedsDisplay()
            }
        }
    
    @IBInspectable var colorShadow: UIColor = UIColor.black {
            didSet {
                setNeedsDisplay()
            }
        }
    
    @IBInspectable var opacityShadow: Float = 0.5 {
            didSet {
                setNeedsDisplay()
            }
        }
    
    override init(frame: CGRect) {
        self.faceImage = FaceImage(frame: frame)
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        self.faceImage = FaceImage(coder: aDecoder)!
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    func setImage(named: String) {
        faceImage.image = UIImage(named: named)
        setNeedsDisplay()
    }
    
    private func setupView() {
        faceImage = FaceImage(frame: frame)
        self.addSubview(faceImage)
        showShadow()
        translation()
    }
    
    private func showShadow() {
        backgroundColor = UIColor.clear
        layer.shadowColor = colorShadow.cgColor
        layer.shadowOpacity = opacityShadow
        layer.shadowRadius = radiusShadow
        layer.shadowOffset = CGSize.zero
    }
    
    private func translation() {
        transform = CGAffineTransform(translationX: 0, y: 5)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

}
