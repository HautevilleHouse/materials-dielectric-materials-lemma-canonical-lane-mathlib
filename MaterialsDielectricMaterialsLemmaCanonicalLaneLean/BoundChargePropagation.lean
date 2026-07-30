import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure BoundChargePropagationPackage where
  boundChargeDensity : Type u
  continuityEquation : Prop
  polarisationRelation : Prop
  surfaceBoundCharge : Prop
  divergenceRelation : Prop

structure BoundChargePropagationEvidence (B : BoundChargePropagationPackage) where
  continuityEquationClosed : B.continuityEquation
  polarisationRelationClosed : B.polarisationRelation
  surfaceBoundChargeClosed : B.surfaceBoundCharge
  divergenceRelationClosed : B.divergenceRelation

def BoundChargePropagationClosed (B : BoundChargePropagationPackage) : Prop :=
  B.continuityEquation ∧ B.polarisationRelation ∧ B.surfaceBoundCharge ∧ B.divergenceRelation

theorem bound_charge_propagation_closed_from_evidence (B : BoundChargePropagationPackage)
    (E : BoundChargePropagationEvidence B) : BoundChargePropagationClosed B := by
  exact And.intro E.continuityEquationClosed
    (And.intro E.polarisationRelationClosed
      (And.intro E.surfaceBoundChargeClosed E.divergenceRelationClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse