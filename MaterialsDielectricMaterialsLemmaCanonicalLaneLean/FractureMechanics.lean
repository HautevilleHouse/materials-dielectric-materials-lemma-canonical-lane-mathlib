import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure FracturePackage where
  crackGeometry : Type u
  stressIntensityFactor : Type v
  fractureToughness : Type w
  crackPropagationCriterion : Prop
  energyReleaseRate : Prop
  criticalStressIntensity : Prop
  fractureInitiationPredicted : Prop

structure FractureEvidence (F : FracturePackage) where
  crackPropagationCriterionClosed : F.crackPropagationCriterion
  energyReleaseRateClosed : F.energyReleaseRate
  criticalStressIntensityClosed : F.criticalStressIntensity
  fractureInitiationPredictedClosed : F.fractureInitiationPredicted

def FractureClosed (F : FracturePackage) : Prop :=
  F.crackPropagationCriterion ∧ F.energyReleaseRate ∧
  F.criticalStressIntensity ∧ F.fractureInitiationPredicted

theorem fracture_closed_from_evidence (F : FracturePackage)
    (E : FractureEvidence F) : FractureClosed F := by
  exact And.intro E.crackPropagationCriterionClosed
    (And.intro E.energyReleaseRateClosed
      (And.intro E.criticalStressIntensityClosed E.fractureInitiationPredictedClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
