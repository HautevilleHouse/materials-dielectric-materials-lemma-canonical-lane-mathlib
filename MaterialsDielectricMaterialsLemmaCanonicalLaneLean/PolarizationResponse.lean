import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure PolarizationResponsePackage where
  material : Type u
  electricField : Type v
  polarizationField : Type w
  linearPolarization : Prop
  nonlinearSusceptibility : Prop
  harmonicGeneration : Prop
  saturationEffect : Prop

structure PolarizationResponseEvidence (P : PolarizationResponsePackage) where
  linearPolarizationClosed : P.linearPolarization
  nonlinearSusceptibilityClosed : P.nonlinearSusceptibility
  harmonicGenerationClosed : P.harmonicGeneration
  saturationEffectClosed : P.saturationEffect

def PolarizationResponseClosed (P : PolarizationResponsePackage) : Prop :=
  P.linearPolarization ∧ P.nonlinearSusceptibility ∧ P.harmonicGeneration ∧ P.saturationEffect

theorem polarization_response_closed_from_evidence (P : PolarizationResponsePackage)
    (E : PolarizationResponseEvidence P) : PolarizationResponseClosed P := by
  exact And.intro E.linearPolarizationClosed
    (And.intro E.nonlinearSusceptibilityClosed
      (And.intro E.harmonicGenerationClosed E.saturationEffectClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
