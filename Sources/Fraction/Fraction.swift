enum FractionError: Error {
case zeroDenominator
}

public struct Fraction: CustomStringConvertible, Equatable {
    var numerator: Int
    var denominator: Int
    var description: String {
      let wholePart = (numerator/denominator) != 0 ? "\(numerator/denominator) " : ""
    let fractionPart = (numerator/denominator) != 0 ? "\(abs(numerator%denominator))/\(denominator)" : "\(numerator%denominator)/\(denominator)"
      return wholePart + (fractionPart.first! == "0" ? "" : fractionPart)
    }

    public init?(_ numerator:Int, _ denominator: Int) {
      guard denominator != 0 else { return nil }
      self.numerator = numerator * (abs(denominator) / denominator)
      self.denominator = abs(denominator)
    }


    private static func gcd(a: Int, b: Int) -> Int {
      // Return the positive number if one of a and b is zero
      if a * b == 0 {
        return a + b
      }
      else {
        return (a < b ? gcd(a: a, b: b - a) : gcd(a: a-b, b: b))
      }
    }

    public static func + (lhs: Fraction, rhs: Fraction) -> Fraction {
      let newLhs = lhs.numerator * rhs.denominator
      let newRhs = rhs.numerator * lhs.denominator
      let newDenominator =  lhs.denominator * rhs.denominator
      let newNumerator = newLhs + newRhs
      let factor = gcd(a: abs(newNumerator), b: newDenominator)
      return Fraction(newNumerator/factor, newDenominator/factor)!
    }

    public static func == (lhs: Fraction, rhs: Fraction) -> Bool {
      let newLhs = lhs.numerator * rhs.denominator
      let newRhs = rhs.numerator * lhs.denominator
      return newLhs == newRhs
    }

    public static func - (lhs: Fraction, rhs: Fraction) -> Fraction {
      return lhs + Fraction(-rhs.numerator, rhs.denominator)!
    }

    public static func * (lhs: Fraction, rhs: Fraction) -> Fraction {
      let newNumerator = lhs.numerator * rhs.numerator
      let newDenominator = lhs.denominator * rhs.denominator
      let factor = gcd(a: abs(newNumerator), b: newDenominator)
      return Fraction(newNumerator/factor, newDenominator/factor)!
    }

    public static func / (lhs: Fraction, rhs: Fraction) -> Fraction? {
      guard rhs.numerator != 0 else { return nil }
      return lhs * Fraction(rhs.denominator, rhs.numerator)!
    }

    public func toDecimal() -> Float {
      return Float(self.numerator)/Float(self.denominator)
    }
}
