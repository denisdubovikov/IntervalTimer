//
//  MainPageViewController.swift
//  IntervalTimer
//
//  Created by Денис Дубовиков on 10.10.2020.
//

import UIKit

class MainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    
    var plusButton: UIButton!
    var templatesListButton: UIButton!
    
    let trainingsCount = 2
    let trainingsTitles = ["First", "Second"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupPlusButton()
        setupTemplatesListButton()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - TableView
    
    func setupTableView() {
        mainTableView.register(MainPageTableViewCell.self, forCellReuseIdentifier: "MainPageTableViewCell")
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainingsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainPageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MainPageTableViewCell") as! MainPageTableViewCell
        
        cell.titleLabel.text = trainingsTitles[indexPath.row]
        
        return cell
    }
    
    //MARK: - PlusButton
    
    func setupPlusButton() {
        plusButton = UIButton(frame: CGRect(origin: CGPoint(x: view.frame.size.width - 30, y: view.frame.size.height - 90), size: CGSize(width: 60, height: 60)))
        plusButton.center = CGPoint(x: view.frame.size.width - 60, y: view.frame.size.height - 60)
        
        plusButton.clipsToBounds = true
        plusButton.layer.cornerRadius = 30
        plusButton.backgroundColor = .blue
        
        view.addSubview(plusButton)
    }
    
    //MARK: - TemplatesListButton
    
    func setupTemplatesListButton() {
        templatesListButton = UIButton(frame: CGRect(origin: CGPoint(x: 30, y: view.frame.size.height - 90), size: CGSize(width: view.frame.size.width - 150, height: 40)))
        templatesListButton.center = CGPoint(x: 30 + (view.frame.size.width - 150) / 2, y: view.frame.size.height - 60)
        
        templatesListButton.clipsToBounds = true
        templatesListButton.layer.cornerRadius = 20
        templatesListButton.backgroundColor = .blue
        
        view.addSubview(templatesListButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
