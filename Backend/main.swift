import Foundation
import Riffle

class Backend: Domain {
    override func onJoin() {
        print("Joined the fabric!")

        // Register our echo method with the fabric.
        register("echo", echo)
    }

    func echo(msg: String) -> String {
        print("echo \(msg)")
        return msg
    }
}

let env = NSProcessInfo.processInfo().environment
var fabric: String! = env["WS_URL"]
var domain: String! = env["DOMAIN"]

Riffle.setFabric(fabric)
Backend(name: domain).join()
