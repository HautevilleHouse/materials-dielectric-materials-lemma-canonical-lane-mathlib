import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure BoundaryConditionsPackage where
  domain : Type u
  boundaryType : Type v
  continuityCondition : Prop
  jumpCondition : Prop
  impedanceMatching : Prop
  surfacePolarization : Prop

structure BoundaryConditionsEvidence (B : BoundaryConditionsPackage) where
  continuityConditionClosed : B.continuityCondition
  jumpConditionClosed : B.jumpCondition
  impedanceMatchingClosed : B.impedanceMatching
  surfacePolarizationClosed : B.surfacePolarization

def BoundaryConditionsClosed (B : BoundaryConditionsPackage) : Prop :=
  B.continuityCondition ∧ B.jumpCondition ∧ B.impedanceMatching ∧ B.surfacePolarization

theorem boundary_conditions_closed_from_evidence (B : BoundaryConditionsPackage)
    (E : BoundaryConditionsEvidence B) : BoundaryConditionsClosed B := by
  exact And.intro E.continuityConditionClosed
    (And.intro E.jumpConditionClosed
      (And.intro E.impedanceMatchingClosed E.surfacePolarizationClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
