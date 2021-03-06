import Foundation
import UIKit

/**
 The StackCardView is a subclass of `UICollectionView` that we use internally in the `StackCard`.
 This allows for custom implementations of the underlying `UICollectionView` so that we can simplify some usages.
 */
public class StackCardView: UICollectionView {

    /// A `Bool` that indicates if the `UICollectionView` is currently scrolling.
    public var isScrolling: Bool {
        return (self.isDragging || self.isTracking || self.isDecelerating)
    }

    /**
     Returns a reusable cell object located by its identifier.
     Call this method from your data source object when asked to provide a new cell for the StackCardView.
     This method dequeues an existing cell if one is available or creates a new one based on the class or nib file you previously registered.
     
     **Important**
     
     You must register a class or nib file using the register(\_:forCellWithReuseIdentifier:) or register(\_:forCellWithReuseIdentifier:) method before calling this method.
     
     If you registered a class for the specified identifier and a new cell must be created, this method initializes the cell by calling its init(frame:) method. For nib-based cells, this method loads the cell object from the provided nib file. If an existing cell was available for reuse, this method calls the cell’s prepareForReuse() method instead.
     
     - parameter identifier: The reuse identifier for the specified cell. This parameter must not be nil.
     
     - parameter index: The index specifying the location of the cell. The data source receives this information when it is asked for the cell and should just pass it along. This method uses the index to perform additional configuration based on the cell’s position in the StackCardView.
     */
    public func dequeueReusableCell(withReuseIdentifier identifier: String, for index: Int) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: identifier, for: IndexPath(row: index, section: 0))
    }
}
