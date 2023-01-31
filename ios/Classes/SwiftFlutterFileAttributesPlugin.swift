import Flutter
import UIKit

public class SwiftFlutterFileAttributesPlugin: NSObject, FlutterPlugin {
    let fileManager = FileManager.default
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_file_attributes", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterFileAttributesPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "get_file_attributes") {
            if let filePath = call.arguments as? String {
                do {
                    let fileAttribute = try fileManager.attributesOfItem(atPath: filePath)
                    let size = fileAttribute[FileAttributeKey.size]
                    let appendOnly = fileAttribute[FileAttributeKey.appendOnly]
                    let busy = fileAttribute[FileAttributeKey.busy]
                    let creationDate = fileAttribute[FileAttributeKey.creationDate] as! Date
                    let creationDateSinceEpoch  = creationDate.timeIntervalSince1970
                    let deviceIdentifier = fileAttribute[FileAttributeKey.deviceIdentifier]
                    let extensionHidden = fileAttribute[FileAttributeKey.extensionHidden]
                    let groupOwnerAccountID = fileAttribute[FileAttributeKey.groupOwnerAccountID]
                    let groupOwnerAccountName = fileAttribute[FileAttributeKey.groupOwnerAccountName]
                    let hfsCreatorCode = fileAttribute[FileAttributeKey.hfsCreatorCode]
                    let hfsTypeCode = fileAttribute[FileAttributeKey.hfsTypeCode]
                    let immutable = fileAttribute[FileAttributeKey.immutable]
                    let modificationDate = fileAttribute[FileAttributeKey.modificationDate] as! Date
                    let modificationDateSinceEpoch = modificationDate.timeIntervalSince1970
                    let ownerAccountID = fileAttribute[FileAttributeKey.ownerAccountID]
                    let ownerAccountName = fileAttribute[FileAttributeKey.ownerAccountName]
                    let posixPermissions = fileAttribute[FileAttributeKey.posixPermissions]
                    let protectionKey = fileAttribute[FileAttributeKey.protectionKey]
                    let referenceCount = fileAttribute[FileAttributeKey.referenceCount]
                    let systemFileNumber = fileAttribute[FileAttributeKey.systemFileNumber]
                    let systemFreeNodes = fileAttribute[FileAttributeKey.systemFreeNodes]
                    let systemFreeSize = fileAttribute[FileAttributeKey.systemFreeSize]
                    let systemNodes = fileAttribute[FileAttributeKey.systemNodes]
                    let systemNumber = fileAttribute[FileAttributeKey.systemNumber]
                    let systemSize = fileAttribute[FileAttributeKey.systemSize]
                    let type = fileAttribute[FileAttributeKey.type]
                    
                    var attributeDictionary:[String:Any] = [:]
                    attributeDictionary.updateValue(size as Any, forKey: "size")
                    attributeDictionary.updateValue(appendOnly as Any, forKey: "appendOnly")
                    attributeDictionary.updateValue(busy as Any, forKey: "busy")
                    attributeDictionary.updateValue(creationDateSinceEpoch as Any, forKey: "creationDate")
                    attributeDictionary.updateValue(deviceIdentifier as Any, forKey: "deviceIdentifier")
                    attributeDictionary.updateValue(extensionHidden as Any, forKey: "extensionHidden")
                    attributeDictionary.updateValue(groupOwnerAccountID as Any, forKey: "groupOwnerAccountID")
                    attributeDictionary.updateValue(groupOwnerAccountName as Any, forKey: "groupOwnerAccountName")
                    attributeDictionary.updateValue(hfsCreatorCode as Any, forKey: "hfsCreatorCode")
                    attributeDictionary.updateValue(hfsTypeCode as Any, forKey: "hfsTypeCode")
                    attributeDictionary.updateValue(immutable as Any, forKey: "immutable")
                    attributeDictionary.updateValue(modificationDateSinceEpoch as Any, forKey: "modificationDate")
                    attributeDictionary.updateValue(ownerAccountID as Any, forKey: "ownerAccountID")
                    attributeDictionary.updateValue(ownerAccountName as Any, forKey: "ownerAccountName")
                    attributeDictionary.updateValue(posixPermissions as Any, forKey: "posixPermissions")
                    attributeDictionary.updateValue(protectionKey as Any, forKey: "protectionKey")
                    attributeDictionary.updateValue(referenceCount as Any, forKey: "referenceCount")
                    attributeDictionary.updateValue(systemFileNumber as Any, forKey: "systemFileNumber")
                    attributeDictionary.updateValue(systemFreeNodes as Any, forKey: "systemFreeNodes")
                    attributeDictionary.updateValue(systemFreeSize as Any, forKey: "systemFreeSize")
                    attributeDictionary.updateValue(systemNodes as Any, forKey: "systemNodes")
                    attributeDictionary.updateValue(systemNumber as Any, forKey: "systemNumber")
                    attributeDictionary.updateValue(systemSize as Any, forKey: "systemSize")
                    attributeDictionary.updateValue(type as Any, forKey: "type")
                    
                    result(attributeDictionary)
                    
                } catch let error {
                    result(error.localizedDescription)
                }
                result("query failed")
            }
            result("Invalid arguments")
        }
        result("Unknown method call " + call.method)
    }
}
