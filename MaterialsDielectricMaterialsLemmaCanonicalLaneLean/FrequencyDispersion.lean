import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure FrequencyDispersionPackage where
  material : Type u
  permittivityFunction : Type v
  drudeModel : Prop
  lorentzOscillator : Prop
  debyeRelaxation : Prop
  bandGapEffect : Prop

structure FrequencyDispersionEvidence (F : FrequencyDispersionPackage) where
  drudeModelClosed : F.drudeModel
  lorentzOscillatorClosed : F.lorentzOscillator
  debyeRelaxationClosed : F.debyeRelaxation
  bandGapEffectClosed : F.bandGapEffect

def FrequencyDispersionClosed (F : FrequencyDispersionPackage) : Prop :=
  F.drudeModel ∧ F.lorentzOscillator ∧ F.debyeRelaxation ∧ F.bandGapEffect

theorem frequency_dispersion_closed_from_evidence (F : FrequencyDispersionPackage)
    (E : FrequencyDispersionEvidence F) : FrequencyDispersionClosed F := by
  exact And.intro E.drudeModelClosed
    (And.intro E.lorentzOscillatorClosed
      (And.intro E.debyeRelaxationClosed E.bandGapEffectClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
