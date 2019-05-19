//
//  CategoriesServices.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import ObjectMapper

public class CategoryServices: BaseNetworkingServices
{
    func getAllCategories(completionHandler: @escaping (_ result: Array<CategoryModel>?, AppError?) -> Void)
    {
        
        self.request(endpoint: Endpoints.categories.rawValue, method: .get) { [weak self] (result) in
            switch result{
            case .success(let cateogryObjects):
                
                if let categoryArray = cateogryObjects as? Array<Dictionary<String, Any>> {
                    var categories = Array<CategoryModel>()
                    for categoryObject in categoryArray {
                        if let newCategory = CategoryModel(JSON: categoryObject) {
                            categories.append(newCategory)
                        }
                    }
                    completionHandler(categories, nil)
                    return
                }
                completionHandler(nil, AppError.createNetworkingError(WithType: .jsonParsing))
                return
            case .failure(let error):
                completionHandler(nil, error as? AppError)
                return
            }
        }
    }
}
