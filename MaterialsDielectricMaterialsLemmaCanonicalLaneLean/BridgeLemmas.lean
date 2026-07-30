import MaterialsDielectricMaterialsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.admittanceClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.admittanceClosed

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
