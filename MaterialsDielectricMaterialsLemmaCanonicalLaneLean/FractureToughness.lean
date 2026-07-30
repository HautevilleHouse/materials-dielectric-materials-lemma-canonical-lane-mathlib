import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure FractureToughness where
  criticalStressIntensity : Float
  crackLength : Float
  geometryFactor : Float
  fractureMode : String

structure FractureToughnessEvidence (F : FractureToughness) where
  criticalStressIntensityPositive : F.criticalStressIntensity > 0
  crackLengthPositive : F.crackLength > 0
  geometryFactorPositive : F.geometryFactor > 0
  fractureModeRecognized : F.fractureMode ∈ ["I", "II", "III"]

def FractureToughnessClosed (F : FractureToughness) : Prop :=
  F.criticalStressIntensity > 0 ∧ F.crackLength > 0 ∧ F.fractureMode ∈ ["I", "II", "III"]

theorem fracture_toughness_closed_from_evidence (F : FractureToughness)
    (E : FractureToughnessEvidence F) : FractureToughnessClosed F := by
  exact And.intro E.criticalStressIntensityPositive
    (And.intro E.crackLengthPositive E.fractureModeRecognized)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse