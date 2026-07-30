import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsDielectricMaterialsLemmaCanonicalLaneLean.DielectricBreakdown
import HautevilleHouse.MaterialsDielectricMaterialsLemmaCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.MaterialsDielectricMaterialsLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

def ConstrainedDielectricMaterialsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dielectric_materials_endgame (A : AdmissibleClass) :
    ConstrainedDielectricMaterialsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse