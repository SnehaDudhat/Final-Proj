//
//  NetworkClient.swift
//  VIPDemo
//
//  Created by Rahul Srivastava on 23/05/17.
//  Copyright © 2017 Rahul Srivastava. All rights reserved.
//

import Alamofire
import ObjectMapper
import NVActivityIndicatorView

public typealias ResponseData = [String: Any]
public typealias ResponseArray = [Any]
public typealias FailureMessage = String
public typealias ResponseString = String
public typealias FailureCode    = Int

class NetworkClient {
  
    // MARK: - Constant
    struct Constants {
      
      struct RequestHeaderKey {
        static let contentType                  = "Content-Type"
        static let applicationJSON              = "application/json"
      }
      
      struct HeaderKey {
        
        static let Authorization                = "Authorization"
      }
      
      struct ResponseKey {
        
        static let code                         = "code"
        static let data                         = "data"
        static let message                      = "message"
        static let list                         = "list"
        static let serverLastSync               = "server_last_sync"
      }
      
      struct ResponseCode {
        
        static let kSuccessCode                 = 1
        static let kTokenExpiredCode            = 401
      }
    }
  
    // MARK: - Properties
    
    // A Singleton instance
    static let sharedInstance = NetworkClient()
    
    // A network reachability instance
    let networkReachability = NetworkReachabilityManager()
    
    // MARK: - Functions
    
    // Initialize
    private init() {
        networkReachability?.startListening()
        setIndicatorViewDefaults()
    }
    
    // MARK: - Indicator view
    private func setIndicatorViewDefaults() {
        
        NVActivityIndicatorView.DEFAULT_TYPE = .ballClipRotatePulse
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor.white
        NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE = CGSize(width: 40, height: 40)
        NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE_FONT = UIFont.boldSystemFont(ofSize: 17)
    }
    
    /// show indicator before network request
    func showIndicator(_ message:String?, stopAfter: Double) {
        
        let activityData = ActivityData(message: message)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        
        if stopAfter > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + stopAfter) {
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            }
        }
    }
    
    ///Stop Indicator Manually
    func stopIndicator() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    /// Show indicator
    func showIndicatorInView(view: UIView) -> NVActivityIndicatorView {
        
        let indicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40), type: NVActivityIndicatorType.ballScaleMultiple, color: UIColor.gray.withAlphaComponent(0.8))
        indicatorView.center = view.center
        view.superview?.addSubview(indicatorView)
        
        indicatorView.startAnimating()
        return indicatorView
    }
    
    // MARK: - Network Request
    
    // Global function to call web service
    func request(_ url: URLConvertible, command: String, method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, success:@escaping ((Any, String)->Void), failure:@escaping ((FailureMessage,FailureCode)->Void)) {
        
        // check network reachability
        guard (networkReachability?.isReachable)! else {

            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
//            failure("No Internet Connection.",100)
             Utilities.showAlertView(title: AppConstants.appName, message: "No Internet Connection.")
            return
        }
        
        // create final url
        let finalURLString: String = "\(url)\(command)"
        let finalURL = NSURL(string : finalURLString)! as URL
        
        
        // Network request
        Alamofire.request(finalURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response: DataResponse<Any>) in

            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()

            // check result is success
            guard response.result.isSuccess else {
                failure((response.result.error?.localizedDescription)!,100)
                return
            }

            let responseObject = response.result.value as? [String: Any]

            // get status code
            let statusCode = responseObject?[Constants.ResponseKey.code] as? Int ?? 0

            // get status message
            let message = responseObject?[Constants.ResponseKey.message] as? String ?? ""
            
            //User LogOut
            if statusCode == Constants.ResponseCode.kTokenExpiredCode {
                ApplicationData.sharedInstance.logoutUser()
                failure(message,statusCode)
                return
            }
            
            //Check Flag
            if responseObject?["flag"] as? Bool == false {
                failure(message,statusCode)
                return
            }

            // get data object
            let dataObject = responseObject?[Constants.ResponseKey.data]
            
            if let data = dataObject as? [[String : Any]] {
                success(data, message)
                return
            }
            
            // pass data as dictionary if data key contains json object
            if let data = dataObject as? ResponseData {
                success(data, message)
                return
            }
            else {
                failure(message,statusCode)
                return
            }
        }
    }
}
