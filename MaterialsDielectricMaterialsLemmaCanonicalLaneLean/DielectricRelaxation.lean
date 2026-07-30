import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsDielectricMaterialsLemmaCanonicalLaneLean.PermittivityModel

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricRelaxationPackage {M : DielectricMaterialPackage}
    {P : PermittivityModelPackage M} where
  relaxation_mechanism : Prop
  time_domain_response : Prop
  frequency_domain_response : Prop
  cole_cole_parameters : Prop
  havrilak_negami_parameters : Prop
  distribution_of_relaxation_times : Prop
  temperature_dependence : Prop

def DielectricRelaxationEvidence {M : DielectricMaterialPackage} {P : PermittivityModelPackage M}
    (R : DielectricRelaxationPackage P) : Prop :=
  R.relaxation_mechanism ∧ R.time_domain_response ∧ R.frequency_domain_response ∧
  R.cole_cole_parameters ∧ R.havrilak_negami_parameters ∧ R.distribution_of_relaxation_times ∧
  R.temperature_dependence

structure DielectricRelaxationEvidenceCl {M : DielectricMaterialPackage} {P : PermittivityModelPackage M}
    (R : DielectricRelaxationPackage P) where
  relaxation_mechanism_closed : R.relaxation_mechanism
  time_domain_response_closed : R.time_domain_response
  frequency_domain_response_closed : R.frequency_domain_response
  cole_cole_parameters_closed : R.cole_cole_parameters
  havrilak_negami_parameters_closed : R.havrilak_negami_parameters
  distribution_of_relaxation_times_closed : R.distribution_of_relaxation_times
  temperature_dependence_closed : R.temperature_dependence

theorem dielectric_relaxation_closed_from_evidence {M : DielectricMaterialPackage} {P : PermittivityModelPackage M}
    (R : DielectricRelaxationPackage P) (E : DielectricRelaxationEvidenceCl R) :
    DielectricRelaxationEvidence R := by
  exact And.intro E.relaxation_mechanism_closed
    (And.intro E.time_domain_response_closed
      (And.intro E.frequency_domain_response_closed
        (And.intro E.cole_cole_parameters_closed
          (And.intro E.havrilak_negami_parameters_closed
            (And.intro E.distribution_of_relaxation_times_closed
              E.temperature_dependence_closed)))))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse