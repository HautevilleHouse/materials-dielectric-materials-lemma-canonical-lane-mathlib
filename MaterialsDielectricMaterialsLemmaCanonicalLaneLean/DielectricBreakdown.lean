import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricBreakdownPackage where
  material : Type u
  electricFieldStrength : Type v
  breakdownThreshold : Prop
  avalancheMechanism : Prop
  thermalRunaway : Prop
  defectInduced : Prop

structure DielectricBreakdownEvidence (D : DielectricBreakdownPackage) where
  breakdownThresholdClosed : D.breakdownThreshold
  avalancheMechanismClosed : D.avalancheMechanism
  thermalRunawayClosed : D.thermalRunaway
  defectInducedClosed : D.defectInduced

def DielectricBreakdownClosed (D : DielectricBreakdownPackage) : Prop :=
  D.breakdownThreshold ∧ D.avalancheMechanism ∧ D.thermalRunaway ∧ D.defectInduced

theorem dielectric_breakdown_closed_from_evidence (D : DielectricBreakdownPackage)
    (E : DielectricBreakdownEvidence D) : DielectricBreakdownClosed D := by
  exact And.intro E.breakdownThresholdClosed
    (And.intro E.avalancheMechanismClosed
      (And.intro E.thermalRunawayClosed E.defectInducedClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
