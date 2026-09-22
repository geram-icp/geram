import Principal "mo:base/Principal";
import Time "mo:base/Time";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor {

  type Certificate = {
    id : Text;
    owner : Principal;
    issuer : Principal;
    title : Text;
    certificateType : Text;
    value : Nat;
    metadata : Text;
    image : Text;
    externalUrl : Text;
    issuedAt : Int;
    active : Bool;
  };

  stable var certificates : [Certificate] = [];

  func findCertificate(id : Text) : ?Certificate {
    Array.find<Certificate>(
      certificates,
      func(certificate : Certificate) : Bool {
        certificate.id == id
      }
    )
  };

  public shared ({ caller }) func issueCertificate(
    id : Text,
    owner : Principal,
    title : Text,
    certificateType : Text,
    value : Nat,
    metadata : Text,
    image : Text,
    externalUrl : Text
  ) : async Bool {

    switch (findCertificate(id)) {
      case (?_) {
        false
      };

      case null {

        let certificate : Certificate = {
          id = id;
          owner = owner;
          issuer = caller;
          title = title;
          certificateType = certificateType;
          value = value;
          metadata = metadata;
          image = image;
          externalUrl = externalUrl;
          issuedAt = Time.now();
          active = true;
        };

        certificates := Array.append<Certificate>(
          certificates,
          [certificate]
        );

        true
      };
    };
  };

  public query func getCertificate(
    id : Text
  ) : async ?Certificate {
    findCertificate(id)
  };

  public query func verifyCertificate(
    id : Text
  ) : async Bool {

    switch (findCertificate(id)) {
      case null {
        false
      };

      case (?certificate) {
        certificate.active
      };
    };
  };

  public query func getOwner(
    id : Text
  ) : async ?Principal {

    switch (findCertificate(id)) {
      case null {
        null
      };

      case (?certificate) {
        ?certificate.owner
      };
    };
  };

  public shared ({ caller }) func transferCertificate(
    id : Text,
    newOwner : Principal
  ) : async Bool {

    var found : Bool = false;
    var authorized : Bool = false;

    let updatedCertificates = Array.map<Certificate, Certificate>(
      certificates,
      func(certificate : Certificate) : Certificate {

        if (certificate.id == id) {

          found := true;

          if (certificate.owner == caller) {

            authorized := true;

            {
              id = certificate.id;
              owner = newOwner;
              issuer = certificate.issuer;
              title = certificate.title;
              certificateType = certificate.certificateType;
              value = certificate.value;
              metadata = certificate.metadata;
              image = certificate.image;
              externalUrl = certificate.externalUrl;
              issuedAt = certificate.issuedAt;
              active = certificate.active;
            }

          } else {
            certificate
          }

        } else {
          certificate
        }
      }
    );

    if (found and authorized) {
      certificates := updatedCertificates;
      true
    } else {
      false
    }
  };

};
