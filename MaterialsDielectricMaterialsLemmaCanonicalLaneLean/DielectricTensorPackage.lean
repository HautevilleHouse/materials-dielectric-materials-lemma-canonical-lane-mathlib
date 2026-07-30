import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricTensorPackage where
  material : Type u
  topology : TopologicalSpace material
  permittivityTensor : Type v
  frequencyRange : Type w
  linearResponse : Prop
  causalitySatisfied : Prop
  kramersKronigValid : Prop
  tensorSymmetry : Prop

structure DielectricTensorEvidence (D : DielectricTensorPackage) where
  linearResponseClosed : D.linearResponse
  causalitySatisfiedClosed : D.causalitySatisfied
  kramersKronigValidClosed : D.kramersKronigValid
  tensorSymmetryClosed : D.tensorSymmetry

def DielectricTensorClosed (D : DielectricTensorPackage) : Prop :=
  D.linearResponse ∧ D.causalitySatisfied ∧ D.kramersKronigValid ∧ D.tensorSymmetry

theorem dielectric_tensor_closed_from_evidence (D : DielectricTensorPackage)
    (E : DielectricTensorEvidence D) : DielectricTensorClosed D := by
  exact And.intro E.linearResponseClosed
    (And.intro E.causalitySatisfiedClosed
      (And.intro E.kramersKronigValidClosed E.tensorSymmetryClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
