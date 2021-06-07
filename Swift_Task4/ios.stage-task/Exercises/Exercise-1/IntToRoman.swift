import Foundation

public extension Int {
    var roman: String? {
        if(self <= 0 || self > 3999) {
            return nil
        }
        
    var n = self
    var result = ""
    
    for (value, letter)
        in [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")] {
            while n >= value {
                result += letter
                n   -= value
            }
        }
        return result
    }
}
