//  ResourceDetailViewModel.swift
//  QuickSeries
//
//  Created by Franck Clement on 06/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit
import Foundation

class ResourceDetailViewModel: NSObject {
    
    let resource: Resource
    
    private(set) var sections: [ResourceSection] = []
    
    init(resource: Resource) {
        self.resource = resource
        super.init()
        setupSections()
    }
    
    private func setupSections() {
        sections.append(HeaderSection(subtitle: resource.subtitle?.htmlFree(),
                                      photoURL: resource.photoURL))
        if let contact = resource.contact {
            sections.append(ContactSection(contact: contact))
        }
        if let addresses = resource.addresses {
            sections.append(AddressSection(addresses: addresses))
        }
    }
}


extension ResourceDetailViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        switch section.sectionType {
        case .header: return dequeueHeaderCell(tableView, at: indexPath, with: section as! HeaderSection)
        case .contact: return dequeueContactCell(tableView, at: indexPath, with: section as! ContactSection)
        case .address: return dequeueAddressCell(tableView, at: indexPath, with: section as! AddressSection)
        }
    }
    
    private func dequeueHeaderCell(_ tableView: UITableView, at indexPath: IndexPath, with section: HeaderSection) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderCell.self), for: indexPath) as? HeaderCell else {
            fatalError("Could not dequeue HeaderCell. Verify that tableview register HeaderCell type")
        }
        cell.configureCell(subtitle: section.subtitle, photoURL: section.photoURL)
        return cell
    }
    
    private func dequeueContactCell(_ tableView: UITableView, at indexPath: IndexPath, with section: ContactSection) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TappableCell.self), for: indexPath) as? TappableCell else {
            fatalError("Could not dequeue TappableCell. Verify that tableview register TappableCell type")
        }
        cell.configure(with: section.contacts[indexPath.item])
        return cell
    }
    
    private func dequeueAddressCell(_ tableView: UITableView, at indexPath: IndexPath, with section: AddressSection) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TappableCell.self), for: indexPath) as? TappableCell else {
            fatalError("Could not dequeue TappableCell. Verify that tableview register TappableCell type")
        }
        cell.configure(with: section.addresses[indexPath.item])
        return cell
    }
}
