import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricProperties where
  permittivity : Float
  dielectricStrength : Float
  lossTangent : Float
  polarizationType : String

structure DielectricPropertiesEvidence (D : DielectricProperties) where
  permittivityPositive : D.permittivity > 0
  dielectricStrengthPositive : D.dielectricStrength > 0
  lossTangentRange : 0 ≤ D.lossTangent ∧ D.lossTangent < 1
  polarizationTypeRecognized : D.polarizationType ∈ ["electronic", "ionic", "orientational"]

def DielectricPropertiesClosed (D : DielectricProperties) : Prop :=
  D.permittivity > 0 ∧ D.dielectricStrength > 0 ∧ (0 ≤ D.lossTangent ∧ D.lossTangent < 1)

theorem dielectric_properties_closed_from_evidence (D : DielectricProperties)
    (E : DielectricPropertiesEvidence D) : DielectricPropertiesClosed D := by
  exact And.intro E.permittivityPositive
    (And.intro E.dielectricStrengthPositive E.lossTangentRange)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse