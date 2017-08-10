//
//  ResourceTableViewController.swift
//  Test
//
//  Created by Roger Francoeur on 17-08-10.
//  Copyright © 2017 Roger Francoeur. All rights reserved.
//

import UIKit

class ResourceTableViewController: UITableViewController {
    
    var category : CategoryType?
    var ascending = false
    var resourceList = [Resource]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view title
        self.navigationItem.title = "RESOURCES"
        
        // Add sorting button to navigation
        let sortButtonItem = UIBarButtonItem.init(
            title: "Sort",
            style: .plain,
            target: self,
            action: #selector(rightButtonAction)
        )
        self.navigationItem.rightBarButtonItem = sortButtonItem;
        
        // Parse the categories from Json
        guard let category = category else {
            return
        }
        readResourcesFromJson(category)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resourceList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = resourceList[indexPath.row].title
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller
        let resourceViewController = segue.destination as! InformationViewController
        
        guard let selectedRow = tableView.indexPathForSelectedRow?.row else {
            return
        }
        
        // Pass the selected resource to the new view controller.
        resourceViewController.resource = resourceList[selectedRow]
     
    }
    
    // MARK: - Private
    
    @objc private func rightButtonAction(){
        filterList()
    }
    
    private func filterList() {
        
        if ascending {
            resourceList.sort() { $0.title! > $1.title! }
        }
        else{
            resourceList.sort() { $0.title! < $1.title! }
        }
        
        ascending = !ascending
        
        // notify the table view the data has changed
        tableView.reloadData()
        
    }
    
    private func readResourcesFromJson(_ resourceType: CategoryType) {
        
        do {
            if let file = Bundle.main.url(forResource: resourceType.rawValue, withExtension: "json", subdirectory: "data") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [Any] {
                    
                    // Json is an array
                    for eachRessource in object {
                        resourceList.append(Resource(eachRessource as! [String: Any]))
                    }
                    
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("No file")
            }
        } catch {
            print(error.localizedDescription)
        }

    }
    
}

// MARK: - Structure

struct Resource {
    let id: String?
    let slug: String?
    let title: String?
    let description: String?
    let photo: String?
    let contactInfo: ContactInfo?
    var addresses: [Address]?
    let socialMedia: SocialMedia?
    let freeText: FreeText?
    let bizHours: BizHours?
    
    init(_ dict: [String: Any]) {
        
        id = dict["_id"] as? String ?? ""
        slug = dict["slug"] as? String ?? ""
        title = dict["title"] as? String ?? ""
        description = dict["description"] as? String ?? ""
        photo = dict["photo"] as? String ?? ""
        
        if let contactSection = dict["contactInfo"] as? [String: Any] {
            contactInfo = ContactInfo(contactSection)
        }
        else {
            contactInfo = nil
        }
        
        if let addressSection = dict["addresses"] as? [Any] {
            for address in addressSection {
                
                addresses = [Address]()
                addresses?.append(Address(address as! [String : Any]))
            }
            
        }
        else {
            addresses = nil
        }
        
        if let socialMediaSection = dict["socialMedia"] as? [String: Any] {
            socialMedia = SocialMedia(socialMediaSection)
        }
        else {
            socialMedia = nil
        }
        
        if let bizHoursSection = dict["bizHours"] as? [String: Any] {
            bizHours = BizHours(bizHoursSection)
        }
        else {
            bizHours = nil
        }
        
        if let freeTextSection = dict["freeText"] as? [String: Any] {
            freeText = FreeText(freeTextSection)
        }
        else {
            freeText = nil
        }
        
    }
}

struct ContactInfo {
    
    let phoneNumber: String?
    let tollFree: String?
    let faxNumber: String?
    let email: String?
    let website: String?
    
    init(_ dict: [String: Any]) {
        phoneNumber = (dict["phoneNumber"] as? [String])?[0] ?? ""
        tollFree = (dict["tollFree"] as? [String])?[0] ?? ""
        faxNumber = (dict["faxNumber"] as? [String])?[0] ?? ""
        email = (dict["email"] as? [String])?[0] ?? ""
        website = (dict["website"] as? [String])?[0] ?? ""
        
    }
    
}

struct Address {
    
    let address1: String?
    let zipCode: String?
    let city: String?
    let state: String?
    let country: String?
    let location: (latitude: String, longitude:String)?
    
    init(_ dict: [String: Any]) {
        address1 = dict["address1"] as? String ?? ""
        zipCode = dict["zipCode"] as? String ?? ""
        city = dict["city"] as? String ?? ""
        state = dict["state"] as? String ?? ""
        country = dict["country"] as? String ?? ""
        
        if let gps = dict["gps"] as? [String: Any] {
            location = ("","")
            location?.latitude = gps["latitude"] as! String
            location?.longitude = gps["longitude"] as! String
        }
        else {
            location = nil
        }
    }
    
}

struct FreeText {
    let note: String?
    
    init (_ dict: [String: Any]) {
        note = dict.first?.value as? String
    }
    
}

struct SocialMedia {
    
    let facebook: String?
    let twitter: String?
    let youtubeChannel: String?
    
    init(_ dict: [String: Any]) {
        facebook = (dict["facebook"] as? [String])?[0] ?? ""
        twitter = (dict["twitter"] as? [String])?[0] ?? ""
        youtubeChannel = (dict["youtubeChannel"] as? [String])?[0] ?? ""
    }
    
}

struct BizHours {
    
    let monday: (from: String, to:String)?
    let tuesday: (from: String, to:String)?
    let wednesday: (from: String, to:String)?
    let thursday: (from: String, to:String)?
    let friday: (from: String, to:String)?
    let satursday: (from: String, to:String)?
    let sunday: (from: String, to:String)?
    
    init(_ dict: [String: Any]) {
        
        if let mondayHours = dict["monday"] as? [String: Any] {
            monday = ("","")
            monday?.from = mondayHours["from"] as! String
            monday?.to = mondayHours["to"] as! String
        }
        else {
            monday = nil
        }
        if let tuesdayHours = dict["tuesday"] as? [String: Any] {
            tuesday = ("","")
            tuesday?.from = tuesdayHours["from"] as! String
            tuesday?.to = tuesdayHours["to"] as! String
        }
        else {
            tuesday = nil
        }
        if let wednesdayHours = dict["wednesday"] as? [String: Any] {
            wednesday = ("","")
            wednesday?.from = wednesdayHours["from"] as! String
            wednesday?.to = wednesdayHours["to"] as! String
        }
        else {
            wednesday = nil
        }
        if let thursdayHours = dict["thursday"] as? [String: Any] {
            thursday = ("","")
            thursday?.from = thursdayHours["from"] as! String
            thursday?.to = thursdayHours["to"] as! String
        }
        else {
            thursday = nil
        }
        if let fridayHours = dict["friday"] as? [String: Any] {
            friday = ("","")
            friday?.from = fridayHours["from"] as! String
            friday?.to = fridayHours["to"] as! String
        }
        else {
            friday = nil
        }
        if let satursdayHours = dict["satursday"] as? [String: Any] {
            satursday = ("","")
            satursday?.from = satursdayHours["from"] as! String
            satursday?.to = satursdayHours["to"] as! String
        }
        else {
            satursday = nil
        }
        if let sundayHours = dict["sunday"] as? [String: Any] {
            sunday = ("","")
            sunday?.from = sundayHours["from"] as! String
            sunday?.to = sundayHours["to"] as! String
        }
        else {
            sunday = nil
        }
    }
    
}


