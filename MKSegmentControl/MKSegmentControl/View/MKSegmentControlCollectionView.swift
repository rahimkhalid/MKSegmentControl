//
//  MKSegmentControlCollectionView.swift
//  MKSegmentControl
//
//  Created by Rahim on 11/19/18.
//

import UIKit

class MKSegmentControlCollectionView: UIView{
    
    private(set) var segmentControlLableArray: [String] = []{
        didSet{
            cellWidthArray = Array<CGFloat>(repeating: 0, count: segmentControlLableArray.count)
        }
    }
    private var cellWidthArray:[CGFloat] = []
    @IBOutlet weak var collectionView: UICollectionView!
    let minWidth:CGFloat = 70
    private let indicatorView:UIView = UIView()
    private var selectedIndex:IndexPath = IndexPath(row: 0, section: 0)
    
    internal static func getView() -> MKSegmentControlCollectionView {
        
        if let nib = Bundle.main.loadNibNamed(String(describing: self) , owner: self, options: nil)?.first as? UIView,
            let view = nib as? MKSegmentControlCollectionView {
            view.setupControl()
            return view
        }
        return UIView() as! MKSegmentControlCollectionView
    }
    
    func setupControl() {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerNib()
    }
    
    func registerNib(){
        collectionView.register(MKSegmentCollectionViewCell.self, forCellWithReuseIdentifier: "MKSegmentCollectionViewCell")
    }
    
    func setupSelectionIndicator() {
        
        var x: CGFloat = 20
        if collectionView.visibleCells.count > 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MKSegmentCollectionViewCell", for: selectedIndex) as? MKSegmentCollectionViewCell {
                
                x += cell.frame.origin.x + cell.titleLabel.frame.origin.x
            }
        }
        
        let frame = CGRect(x: x, y: 68, width: self.cellWidthArray[selectedIndex.row] - 40, height: 2.0)
        
        indicatorView.frame = frame
        indicatorView.backgroundColor = UIColor.red
        
    }
    
    func updateSegmentControl (titleArray:[String]){
        segmentControlLableArray = titleArray
        getWidthForSegmentControl()
        if segmentControlLableArray.count > 0{
            setupSelectionIndicator()
        }
        collectionView.addSubview(indicatorView)
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        collectionView.layoutSubviews()
    }
    
    func updateViewForOrientationChange(){
        getWidthForSegmentControl()
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        collectionView.layoutSubviews()
        setupCollectionViewScrollPosition()
        if segmentControlLableArray.count > 0{
            setupSelectionIndicator()
        }
    }
    
    func setupCollectionViewScrollPosition() {
        collectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: true)
    }
    
    func getWidthForSegmentControl() {
        
        var width:CGFloat = 0
        var totalWidth:CGFloat = 0
        for index in 0..<segmentControlLableArray.count{
            
            width = segmentControlLableArray[index].width(withConstrainedHeight: 20.33, font: UIFont.systemFont(ofSize: 17, weight: .bold))
            width += 40
            
            if width < minWidth {
                width = minWidth
            }
            totalWidth += width
            cellWidthArray[index] = width
        }
        
        let currentOrientation = UIApplication.shared.statusBarOrientation
        var screenWidth = UIScreen.main.bounds.width
        
        if currentOrientation != .portrait {
            let safeareaInset = UIApplication.shared.keyWindow!.safeAreaInsets
            screenWidth -= (safeareaInset.left + safeareaInset.right)
        }
        if totalWidth < screenWidth {
            let toBeDividedWidth = (screenWidth - totalWidth) / CGFloat(segmentControlLableArray.count)
            for index in 0..<segmentControlLableArray.count {
                cellWidthArray[index] = cellWidthArray[index] + toBeDividedWidth
            }
        }
    }
    
}

extension MKSegmentControlCollectionView: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return segmentControlLableArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MKSegmentCollectionViewCell", for: indexPath) as! MKSegmentCollectionViewCell
        
        let isSelected = indexPath.row == selectedIndex.row ? true : false
        cell.populateCell(title: segmentControlLableArray[indexPath.row], isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        UIView.animate(withDuration: 0.3, animations: {
            self.setupSelectionIndicator()
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidthArray[indexPath.row], height: 60)
    }
    
    
}
