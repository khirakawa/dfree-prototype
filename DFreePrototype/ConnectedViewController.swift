import UIKit

class ConnectedViewController: UIViewController, PTDBeanDelegate {
    
    var connectedBean: PTDBean?
    
    @IBOutlet weak var progressBar: UIProgressView!

    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            progressBar.setProgress(fractionalProgress, animated: animated)
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: PTDBeanDelegate
        
    func bean(bean: PTDBean!, serialDataReceived data: NSData!) {
        let num = transformData(data)
        println("GOT MESSAGE: \(num)")
        if num > 0 {
            counter = num
        }
    }
    
    // Here we do any necessary calculations to transform the data.  Return value should be between 0 and 100.
    func transformData(data: NSData!) -> Int {
        let datastring = NSString(data: data, encoding: NSUTF8StringEncoding)
        let out = (datastring?.integerValue)!
        return out
    }
}