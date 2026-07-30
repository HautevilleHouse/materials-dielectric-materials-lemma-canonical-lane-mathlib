import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure PermittivityTensorPackage where
  mediumType : Type u
  permittivity : mediumType → Type v
  maxwellRelations : Prop
  frequencyDispersion : Prop
  constitutiveLaw : Prop
  positiveDefiniteness : Prop

structure PermittivityTensorEvidence (P : PermittivityTensorPackage) where
  maxwellRelationsClosed : P.maxwellRelations
  frequencyDispersionClosed : P.frequencyDispersion
  constitutiveLawClosed : P.constitutiveLaw
  positiveDefinitenessClosed : P.positiveDefiniteness

def PermittivityTensorClosed (P : PermittivityTensorPackage) : Prop :=
  P.maxwellRelations ∧ P.frequencyDispersion ∧ P.constitutiveLaw ∧ P.positiveDefiniteness

theorem permittivity_tensor_closed_from_evidence (P : PermittivityTensorPackage)
    (E : PermittivityTensorEvidence P) : PermittivityTensorClosed P := by
  exact And.intro E.maxwellRelationsClosed
    (And.intro E.frequencyDispersionClosed
      (And.intro E.constitutiveLawClosed E.positiveDefinitenessClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse