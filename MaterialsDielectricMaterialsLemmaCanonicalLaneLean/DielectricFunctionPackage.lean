import MaterialsDielectricMaterialsLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Dielectric Function Package
-/

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricFunctionPackage where
  permittivityVar : ℝ → ℝ
  frequencyVar : ℝ
  drudeModel : Prop
  relaxationTime : ℝ
  plasmaFrequency : ℝ
  drudeModelClosed : drudeModel

structure DielectricFunctionEvidence (D : DielectricFunctionPackage) where
  drudeModelClosed : D.drudeModel
  relaxationTimeClosed : D.relaxationTime > 0
  plasmaFrequencyClosed : D.plasmaFrequency > 0

def DielectricFunctionClosed (D : DielectricFunctionPackage) : Prop :=
  D.drudeModel ∧ D.relaxationTime > 0 ∧ D.plasmaFrequency > 0

theorem dielectric_function_closed_from_evidence (D : DielectricFunctionPackage)
    (E : DielectricFunctionEvidence D) : DielectricFunctionClosed D := by
  exact And.intro E.drudeModelClosed
    (And.intro E.relaxationTimeClosed E.plasmaFrequencyClosed)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
