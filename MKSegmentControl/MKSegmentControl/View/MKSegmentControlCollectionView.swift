//
//  MKSegmentControlCollectionView.swift
//  MKSegmentControl
//
//  Created by vd-rahim on 11/19/18.
//

import UIKit

class MKSegmentControlCollectionView: UIView{
    
    private(set) var segmentControlLableArray: [String] = []{
        didSet{
            cellWidthArray = Array<CGFloat>(repeating: 0, count: segmentControlLableArray.count)
            labelWidthArray = Array<CGFloat>(repeating: 0, count: segmentControlLableArray.count)
        }
    }
    private var cellWidthArray:[CGFloat] = []
    private var labelWidthArray:[CGFloat] = []
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
        collectionView.register(UINib(nibName: "MKSegmentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MKSegmentCollectionViewCell")
    }
    
    func setupSelectionIndicator() {
        let frame = CGRect(x: 20, y: 35.5, width: labelWidthArray.first ?? 0 - 20, height: 2.0)
        indicatorView.frame = frame
        indicatorView.backgroundColor = UIColor.red
        self.addSubview(indicatorView)
    }
    
    func updateSegmentControl (titleArray:[String]){
        segmentControlLableArray = titleArray
        getWidthForSegmentControl()
        setupSelectionIndicator()
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        collectionView.layoutSubviews()
    }
    
    func updateViewForOrientationChange(){
        getWidthForSegmentControl()
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        collectionView.layoutSubviews()
    }
    
    func getWidthForSegmentControl() {
        
        var width:CGFloat = 0
        var totalWidth:CGFloat = 0
        for index in 0..<segmentControlLableArray.count{
            
            width = segmentControlLableArray[index].width(withConstrainedHeight: 20.33, font: UIFont.systemFont(ofSize: 17, weight: .bold))
            
            labelWidthArray[index] = width
            width += 40
            
            if width < minWidth {
                width = minWidth
            }
            totalWidth += width
            cellWidthArray[index] = width
        }
        let screenWidth = UIScreen.main.bounds.width
        if totalWidth < screenWidth {
            let toBeDividedWidth = (screenWidth - totalWidth) / CGFloat(segmentControlLableArray.count)
            for index in 0..<segmentControlLableArray.count {
                cellWidthArray[index] = cellWidthArray[index] + toBeDividedWidth
            }
        }
    }
    
    func removeSelectionFromPreviousSegment() {
        let cell = collectionView.cellForItem(at: selectedIndex) as! MKSegmentCollectionViewCell
        cell.selectedIndicatorView.isHidden = true
        
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
        let cell = collectionView.cellForItem(at: indexPath) as! MKSegmentCollectionViewCell
        
        var isSelected = false
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .allowUserInteraction, animations: {

            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            
        }) { (_) in
            self.indicatorView.isHidden = false
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {

                let frame = CGRect(x: cell.frame.origin.x + cell.titleLabel.frame.origin.x - collectionView.contentOffset.x, y: 35.5 , width: self.cellWidthArray[indexPath.row] - 40, height: 2.0)
                self.indicatorView.frame = frame
                self.removeSelectionFromPreviousSegment()
            }) { (_) in
                
                self.selectedIndex = indexPath
                self.indicatorView.isHidden = true
                isSelected = indexPath.row == self.selectedIndex.row ? true : false
                cell.selectedIndicatorView.isHidden = !isSelected
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidthArray[indexPath.row], height: 25)
    }
    
    
}
