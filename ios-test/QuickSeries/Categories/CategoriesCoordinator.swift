//  CategoriesCoordinator.swift
//  QuickSeries
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit
import SafariServices
import MapKit
import MessageUI

final class CategoriesCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let categoriesService = CategoryService()
        let categoriesViewModel = CategoriesViewModel(service: categoriesService)
        let categoriesViewController = CategoriesViewController(viewModel: categoriesViewModel)
        categoriesViewController.title = "Categories"
        categoriesViewController.actionDelegate = self
        navigationController.pushViewController(categoriesViewController, animated: true)
    }
    
    fileprivate func prepareAndPushRestaurantsViewController() {
        let restaurantService = ResourceService(itemType: .restaurant)
        let restaurantsViewModel = ResourcesViewModel(service: restaurantService)
        let restaurantsViewController = ResourcesViewController(viewModel: restaurantsViewModel)
        restaurantsViewController.title = "Restaurants"
        restaurantsViewController.actionDelegate = self
        navigationController.pushViewController(restaurantsViewController, animated: true)
    }
    
    fileprivate func prepareAndPushVacationSpotsViewController() {
        let vacationSpotService = ResourceService(itemType: .vacationSpot)
        let vacationSpotsViewModel = ResourcesViewModel(service: vacationSpotService)
        let vacationSpotsViewController = ResourcesViewController(viewModel: vacationSpotsViewModel)
        vacationSpotsViewController.title = "Vacation Spots"
        vacationSpotsViewController.actionDelegate = self
        navigationController.pushViewController(vacationSpotsViewController, animated: true)
    }
    
    fileprivate func prepareAndPushResourceDetailViewController(from resource: Resource) {
        let resourceDetailViewModel = ResourceDetailViewModel(resource: resource)
        let resourceDetailViewController = ResourceDetailViewController(viewModel: resourceDetailViewModel)
        resourceDetailViewController.title = resource.title
        resourceDetailViewController.actionDelegate = self
        navigationController.pushViewController(resourceDetailViewController, animated: true)
    }
}

// MARK: CategoriesViewControllerActionDelegate

extension CategoriesCoordinator: CategoriesViewControllerActionDelegate {
    
    func didTap(category: Category) {
        switch category.type {
        case .restaurant:
            prepareAndPushRestaurantsViewController()
        case .vacationSpot:
            prepareAndPushVacationSpotsViewController()
        }
    }
}

// MARK: ResourcesViewControllerActionDelegate

extension CategoriesCoordinator: ResourcesViewControllerActionDelegate {
    
    func didTap(resource: Resource) {
        self.prepareAndPushResourceDetailViewController(from: resource)
    }
}

// MARK: ResourceDetailViewControllerActionDelegate

extension CategoriesCoordinator: ResourceDetailViewControllerActionDelegate {
    
    func didTap(cell: TappableCell) {
        guard let type = cell.type, let content = cell.content else { return }
        triggerAction(from: type, with: content)
    }
    
    private func triggerAction(from type: InformationType, with content: String) {
        
        switch type {
        case .address(let location): openMaps(from: location)
        case .email: sendEmail(to: content)
        case .website: openInEmbeddedSafari(url: URL(string: content)!)
        case .phoneNumber, .tollFreeNumber: call(number: content)
        default: break
        }
    }
    
    private func openInEmbeddedSafari(url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        navigationController.present(safariViewController, animated: true)
    }
    
    private func openMaps(from location: Location) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(location.latitude)!, longitude: CLLocationDegrees(location.longitude)!)))
        mapItem.openInMaps(launchOptions: nil)
    }
    
    private func sendEmail(to email: String) {
        if MFMailComposeViewController.canSendMail() {
            let emailViewController = MFMailComposeViewController()
            emailViewController.delegate = self
            emailViewController.mailComposeDelegate = self
            emailViewController.setToRecipients([email])
            
            navigationController.present(emailViewController, animated: true)
        }
    }
    
    private func call(number: String) {
        guard let url = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(url)
    }
}

// MARK: UINavigationControllerDelegate & MFMailComposeViewControllerDelegate

extension CategoriesCoordinator: UINavigationControllerDelegate {}
extension CategoriesCoordinator: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}


