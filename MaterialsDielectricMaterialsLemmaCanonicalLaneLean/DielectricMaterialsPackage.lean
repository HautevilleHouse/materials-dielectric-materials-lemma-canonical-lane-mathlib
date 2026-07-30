import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure DielectricMaterialPackage where
  material_type : Type u
  permittivity : material_type -> Type v
  dielectric_function : material_type -> Type w
  loss_tangent : material_type -> Type x
  bandwidth : material_type -> Type y
  polarization_mechanism : Prop
  frequency_response : Prop
  thermal_effects : Prop
  structural_phase : Prop
  composition_gradient : Prop

def DielectricMaterialEvidence (P : DielectricMaterialPackage) : Prop :=
  P.polarization_mechanism ∧ P.frequency_response ∧ P.thermal_effects ∧ P.structural_phase ∧ P.composition_gradient

structure DielectricMaterialsEvidence (P : DielectricMaterialPackage) where
  polarization_mechanism_closed : P.polarization_mechanism
  frequency_response_closed : P.frequency_response
  thermal_effects_closed : P.thermal_effects
  structural_phase_closed : P.structural_phase
  composition_gradient_closed : P.composition_gradient

theorem dielectric_materials_evidence_closed (P : DielectricMaterialPackage) (E : DielectricMaterialsEvidence P) :
    DielectricMaterialEvidence P := by
  exact And.intro E.polarization_mechanism_closed
    (And.intro E.frequency_response_closed
      (And.intro E.thermal_effects_closed
        (And.intro E.structural_phase_closed E.composition_gradient_closed)))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse