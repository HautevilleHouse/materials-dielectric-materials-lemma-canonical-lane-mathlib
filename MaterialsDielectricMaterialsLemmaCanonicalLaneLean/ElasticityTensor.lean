import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure ElasticityTensor where
  stiffnessMatrix : Type u
  complianceMatrix : Type v
  youngModulus : Float
  poissonRatio : Float
  shearModulus : Float

structure ElasticityTensorEvidence (E : ElasticityTensor) where
  stiffnessMatrixDefined : Prop
  complianceMatrixDefined : Prop
  youngModulusPositive : E.youngModulus > 0
  poissonRatioRange : (-1 < E.poissonRatio ∧ E.poissonRatio < 0.5)
  shearModulusPositive : E.shearModulus > 0

def ElasticityTensorClosed (E : ElasticityTensor) : Prop :=
  E.youngModulus > 0 ∧ (-1 < E.poissonRatio ∧ E.poissonRatio < 0.5) ∧ E.shearModulus > 0

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensor)
    (Ev : ElasticityTensorEvidence E) : ElasticityTensorClosed E := by
  exact And.intro Ev.youngModulusPositive
    (And.intro Ev.poissonRatioRange Ev.shearModulusPositive)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse