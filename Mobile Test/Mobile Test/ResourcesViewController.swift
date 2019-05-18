//
//  ResourcesViewController.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var resourcesTableView: UITableView!
    
    var resources: [Resource] = []
    var selectedResource = Resource(id: "", slug: "", eid: "", title: "", description: "", bizHours: nil, categoryEid: "", _v: 0, photoURL: "", active: false, updatedAt: "", createdAt: "", addresses: nil, contactInfo: nil, socialMedia: nil)
    var categoryEid = ""
    var isSortedUp = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        resourcesTableView.dataSource = self
        resourcesTableView.delegate = self
        
        switch categoryEid {
        case GlobalVariables.sharedManager.restaurantsEid:
            self.navigationItem.title = "Restaurants"
            guard let restaurantsURL = URL(string: "https://raw.githubusercontent.com/unboeing/mobile-test/master/data/restaurants.json") else {
                print("invalid restaurants url")
                return
            }
            URLSession.shared.dataTask(with: restaurantsURL) { (data, response, error) in
                if let data = data {
                    do {
                        self.resources = try JSONDecoder().decode([Resource].self, from: data)
                        DispatchQueue.main.async {
                            self.resourcesTableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else { return }
                }.resume()
        case GlobalVariables.sharedManager.vacationSpotsEid:
            self.navigationItem.title = "Vacation Spots"
            guard let vacationSpotURL = URL(string: "https://raw.githubusercontent.com/unboeing/mobile-test/master/data/vacation-spot.json") else {
                print("invalid vacation spot url")
                return
            }
            URLSession.shared.dataTask(with: vacationSpotURL) { (data, response, error) in
                if let data = data {
                    do {
                        self.resources = try JSONDecoder().decode([Resource].self, from: data)
                        DispatchQueue.main.async {
                            self.resourcesTableView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else { return }
                }.resume()
        default:
            print("more categories to implement?")
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resourcesTableView.dequeueReusableCell(withIdentifier: "resourceCell") as! ResourceCell
        cell.resourceToDisplay = resources[indexPath.row]
        cell.resourceDetailsButton.accessibilityHint = String(indexPath.row)
        cell.resourceDetailsButton.addTarget(self, action: #selector(resourceDetailsButtonTapped(sender:)), for: .touchUpInside)
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.detailedResource = self.selectedResource
        }
    }
    
    @IBAction func sortBarButtonTapped(_ sender: UIBarButtonItem) {
        if sender.title == "A to Z" {
            sender.title = "Z to A"
            self.resources = self.resources.sorted(by: { (resA, resB) -> Bool in
                if resA.title > resB.title {
                    return false
                }
                return true
            })
            self.resourcesTableView.reloadData()
        } else {
            sender.title = "A to Z"
            self.resources = self.resources.sorted(by: { (resA, resB) -> Bool in
                if resA.title < resB.title {
                    return false
                }
                return true
            })
            self.resourcesTableView.reloadData()
        }
    }
    
    @IBAction func resourceDetailsButtonTapped(sender: UIButton) {
        self.selectedResource = resources[Int(sender.accessibilityHint!)!]
        self.performSegue(withIdentifier: "detailsSegue", sender: self)
    }
    
}
