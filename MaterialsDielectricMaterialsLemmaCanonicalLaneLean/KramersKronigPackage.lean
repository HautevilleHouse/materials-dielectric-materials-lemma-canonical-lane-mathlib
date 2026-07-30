import MaterialsDielectricMaterialsLemmaCanonicalLaneLean.DielectricFunctionPackage

/-!
# Kramers-Kronig Package
-/

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure KramersKronigPackage {D : DielectricFunctionPackage} (H : D.drudeModel) where
  causality : Prop
  analyticity : Prop
  dispersionRelation : Prop
  causalityClosed : causality
  analyticityClosed : analyticity
  dispersionRelationClosed : dispersionRelation

structure KramersKronigEvidence {D : DielectricFunctionPackage} {H : D.drudeModel}
    (K : KramersKronigPackage H) where
  causalityClosed : K.causality
  analyticityClosed : K.analyticity
  dispersionRelationClosed : K.dispersionRelation

def KramersKronigClosed {D : DielectricFunctionPackage} {H : D.drudeModel}
    (K : KramersKronigPackage H) : Prop :=
  K.causality ∧ K.analyticity ∧ K.dispersionRelation

theorem kramers_kronig_closed_from_evidence {D : DielectricFunctionPackage}
    {H : D.drudeModel} (K : KramersKronigPackage H)
    (E : KramersKronigEvidence K) : KramersKronigClosed K := by
  exact And.intro E.causalityClosed
    (And.intro E.analyticityClosed E.dispersionRelationClosed)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
