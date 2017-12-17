//
//  ViewController.swift
//  moreCollectionPractice
//
//  Created by Chris Mauldin on 12/16/17.
//  Copyright © 2017 Chris Mauldin. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "To-do List"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(TaskCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(TaskHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    //sets the parameters for the header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    
    //sets the parameters for each collection view cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let TaskCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TaskCell
        TaskCell.nameLabel.text = "Sample Task \(indexPath.item)"
        return TaskCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

}



//CUSTOM HEADER CLASS
class TaskHeader: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        
        
        addConstraint(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|",
                                                     options: NSLayoutFormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": nameLabel])[0])
        addConstraint(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|",
                                                     options: NSLayoutFormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": nameLabel])[0])
    }
}




//CUSTOM CELL CLASS
class TaskCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
//        label.text = "Sample text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        
    
        addConstraint(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|",
                                                     options: NSLayoutFormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": nameLabel])[0])
        addConstraint(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|",
                                                     options: NSLayoutFormatOptions(),
                                                     metrics: nil,
                                                     views: ["v0": nameLabel])[0])
    }
}









