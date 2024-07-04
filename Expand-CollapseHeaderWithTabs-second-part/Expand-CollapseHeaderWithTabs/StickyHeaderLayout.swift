import SwiftUI

class TabBarCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "TabBarCell"
    @IBOutlet weak var titleLabel: UILabel!

    func setTitle(title: String) {
        titleLabel.text = title
    }

    override var isSelected: Bool {
        willSet {
            if newValue {
                titleLabel.textColor = .black
            } else {
                titleLabel.textColor = .lightGray
            }
        }
    }

    override func prepareForReuse() {
        isSelected = false
    }
}

class SliderViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // Set the scroll direction to horizontal

        // Initialize the collection view with the layout
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }

        // Register a cell class
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TabBarCell")

        // Add the collection view to the view controller's view
        self.view.addSubview(collectionView)
    }

    // MARK: - UICollectionViewDataSource Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2 // Example number of items
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabBarCell", for: indexPath)
        cell.backgroundColor = .blue // Example cell background color
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout Methods

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100) // Example item size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Example line spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Example inter-item spacing
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        highlightView.translatesAutoresizingMaskIntoConstraints = false
//        constraints = [
//            highlightView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
//            highlightView.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
