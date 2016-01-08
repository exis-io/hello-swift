import Foundation
import Riffle

class ExampleSession: Riffle.Domain, Riffle.Delegate {
    override func onJoin() {
        register("echo") { (msg: String) -> String in
            Riffle.ApplicationLog("Echo: \(msg)")
            return msg
        }
    }
}

let env = NSProcessInfo.processInfo().environment
var fabric: String! = env["WS_URL"]
var domain: String! = env["DOMAIN"]

Riffle.SetFabric(fabric)
ExampleSession(name: domain).join()
