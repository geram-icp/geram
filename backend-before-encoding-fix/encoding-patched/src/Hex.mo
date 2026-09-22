import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

module {

  private func hexDigit(n : Nat8) : Text {
    switch (n) {
      case (0) { "0" };
      case (1) { "1" };
      case (2) { "2" };
      case (3) { "3" };
      case (4) { "4" };
      case (5) { "5" };
      case (6) { "6" };
      case (7) { "7" };
      case (8) { "8" };
      case (9) { "9" };
      case (10) { "a" };
      case (11) { "b" };
      case (12) { "c" };
      case (13) { "d" };
      case (14) { "e" };
      case (_) { "f" };
    };
  };

  public func encode(bytes : [Nat8]) : Text {
    var result = "";

    for (b in bytes.vals()) {
      let high : Nat8 = b / 16;
      let low : Nat8 = b % 16;

      result := result # hexDigit(high) # hexDigit(low);
    };

    result
  };
}
