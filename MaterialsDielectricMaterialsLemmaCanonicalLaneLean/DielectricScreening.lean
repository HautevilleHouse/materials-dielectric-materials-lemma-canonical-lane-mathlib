import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricScreeningPackage where
  chargeScreening : Type u
  dielectricFunction : Type v
  thomasFermiLength : Type w
  screeningLengthPositive : Prop
  linearResponse : Prop
  linkingToPermittivity : Prop

structure DielectricScreeningEvidence (D : DielectricScreeningPackage) where
  screeningLengthPositiveClosed : D.screeningLengthPositive
  linearResponseClosed : D.linearResponse
  linkingToPermittivityClosed : D.linkingToPermittivity

def DielectricScreeningClosed (D : DielectricScreeningPackage) : Prop :=
  D.screeningLengthPositive ∧ D.linearResponse ∧ D.linkingToPermittivity

theorem dielectric_screening_closed_from_evidence (D : DielectricScreeningPackage)
    (E : DielectricScreeningEvidence D) : DielectricScreeningClosed D := by
  exact And.intro E.screeningLengthPositiveClosed
    (And.intro E.linearResponseClosed E.linkingToPermittivityClosed)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse