import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricPackage where
  polarizationField : Type u
  electricField : Type v
  permittivityTensor : Type w
  linearResponse : Prop
  dielectricConstantDefined : Prop
  lossTangentDefined : Prop
  frequencyDependence : Prop

structure DielectricEvidence (D : DielectricPackage) where
  linearResponseClosed : D.linearResponse
  dielectricConstantDefinedClosed : D.dielectricConstantDefined
  lossTangentDefinedClosed : D.lossTangentDefined
  frequencyDependenceClosed : D.frequencyDependence

def DielectricClosed (D : DielectricPackage) : Prop :=
  D.linearResponse ∧ D.dielectricConstantDefined ∧
  D.lossTangentDefined ∧ D.frequencyDependence

theorem dielectric_closed_from_evidence (D : DielectricPackage)
    (E : DielectricEvidence D) : DielectricClosed D := by
  exact And.intro E.linearResponseClosed
    (And.intro E.dielectricConstantDefinedClosed
      (And.intro E.lossTangentDefinedClosed E.frequencyDependenceClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
