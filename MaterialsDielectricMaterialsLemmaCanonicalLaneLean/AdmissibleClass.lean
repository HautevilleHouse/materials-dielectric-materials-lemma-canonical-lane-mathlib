import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure AdmittedObject where
  material : Type
  permittivity : material → ℝ
  frequency : ℝ
  admittanceClosed : Prop
  remainderRecorded : Prop

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.admittanceClosed ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
