import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsDielectricMaterialsLemmaCanonicalLaneLean.DielectricMaterialsPackage

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure PermittivityModelPackage {M : DielectricMaterialPackage} where
  complex_permittivity : Type u
  real_part : M.permittivity.M -> Type v
  imaginary_part : M.permittivity.M -> Type w
  frequency_dispersion : Prop
  temperature_dependence : Prop
  anisotropy : Prop
  nonlinearity : Prop
  conductivity : Type x
  relaxation_time : Type y
  polarization_model : Type z

structure PermittivityModelEvidence {M : DielectricMaterialPackage} (P : PermittivityModelPackage M) where
  frequency_dispersion_closed : P.frequency_dispersion
  temperature_dependence_closed : P.temperature_dependence
  anisotropy_closed : P.anisotropy
  nonlinearity_closed : P.nonlinearity

def PermittivityModelClosed {M : DielectricMaterialPackage} (P : PermittivityModelPackage M) : Prop :=
  P.frequency_dispersion ∧ P.temperature_dependence ∧ P.anisotropy ∧ P.nonlinearity

theorem permittivity_model_closed_from_evidence {M : DielectricMaterialPackage} (P : PermittivityModelPackage M)
    (E : PermittivityModelEvidence P) : PermittivityModelClosed P := by
  exact And.intro E.frequency_dispersion_closed
    (And.intro E.temperature_dependence_closed
      (And.intro E.anisotropy_closed E.nonlinearity_closed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse