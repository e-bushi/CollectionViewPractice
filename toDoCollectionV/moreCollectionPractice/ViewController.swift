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

   var tasks = ["Buy groceries"]

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    //sets the parameters for the header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! TaskHeader
        header.homeController = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    
    //sets the parameters for each collection view cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let TaskCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TaskCell
        TaskCell.nameLabel.text = tasks[indexPath.item]
        return TaskCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func addNewTask(taskName: String) {
        tasks.append(taskName)
        collectionView?.reloadData()
    }

}





class baseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){}
}

//CUSTOM HEADER CLASS
class TaskHeader: baseCell {
    
    var homeController: HomeController?

    let taskNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Task Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    let addTaskToCollection: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupViews() {
        addSubview(taskNameTextField)
        addSubview(addTaskToCollection)
        
        addTaskToCollection.addTarget(self, action: #selector(self.addTask) , for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-[v1(80)]-8-|",
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: ["v0": taskNameTextField, "v1": addTaskToCollection]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-24-[v0]-24-|",
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: ["v0": taskNameTextField]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|",
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: ["v0": addTaskToCollection]))
    }
    
    @objc func addTask() {
        homeController?.addNewTask(taskName: taskNameTextField.text!)
        taskNameTextField.text = ""
    }
}




//CUSTOM CELL CLASS
class TaskCell: baseCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
//        label.text = "Sample text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
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









