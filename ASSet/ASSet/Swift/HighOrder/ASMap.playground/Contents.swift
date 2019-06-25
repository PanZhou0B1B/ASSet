import UIKit

struct ASReduce {
    
}
extension ASReduce{
    public static func simpleTraverse00(){
        let lans = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
        
        let result01 = lans.reduce("") { (result, string) -> String in
            return result == "" ? string : result + "、" + string
        }
        let result02 = lans.reduce("") {
            append($0, with: $1)
        }
        print(result01)
        print(result02)
    }
}
extension ASReduce{
    
    /// 拼接字符串
    private static func append(_ string1: String, with string2: String) -> String {
        return string1 == "" ? string2 : string1 + "、" + string2
    }
}

ASReduce.simpleTraverse00()
