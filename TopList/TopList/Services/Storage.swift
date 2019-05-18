//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   Storage
//  Description      :   Directory manager that resolves data from URL path
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import Foundation

public class Storage {
    
    fileprivate init() { }
    
    enum FileType : String {
        case json
        case other
    }
    
    /// Retrieve and convert a struct from a file on disk
    ///
    /// - Parameters:
    ///   - fileName: name of the file where struct data is stored
    ///   - directory: directory where struct data is stored
    ///   - type: struct type (i.e. Message.self)
    /// - Returns: decoded struct model(s) of data
    static func retrieve<T: Decodable>(_ fileName: String, of fileType: FileType, as type: T.Type) -> T {
        if fileExists(fileName, of: fileType) {
            guard let path = Bundle.main.path(forResource: fileName, ofType: fileType.rawValue) else {
                fatalError("File  - \(fileName) does not exist!")
            }

            if let data = FileManager.default.contents(atPath: path) {
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(type, from: data)
                    return model
                } catch {
                    fatalError(error.localizedDescription)
                }
            } else {
                fatalError("No data at \(path)!")
            }

        }else{
            fatalError("Error since file is not available")
        }
    }
    
    
    /// Returns BOOL indicating whether file exists at specified directory with specified file name
    static func fileExists(_ fileName: String, of type: FileType) -> Bool {
        guard let path = Bundle.main.path(forResource: fileName, ofType: type.rawValue) else {
            fatalError("File  - \(fileName) does not exist!")
        }
        return FileManager.default.fileExists(atPath: path)
    }
}
