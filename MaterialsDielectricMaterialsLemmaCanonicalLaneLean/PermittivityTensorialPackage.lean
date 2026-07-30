import MaterialsDielectricMaterialsLemmaCanonicalLaneLean.KramersKronigPackage

/-!
# Permittivity Tensorial Package
-/

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure PermittivityTensorialPackage {D : DielectricFunctionPackage}
    {H : D.drudeModel} (K : KramersKronigPackage H) where
  tensorOrder : ℕ
  diagonalizable : Prop
  principalAxes : Prop
  diagonalizableClosed : diagonalizable
  principalAxesClosed : principalAxes

structure PermittivityTensorialEvidence {D : DielectricFunctionPackage}
    {H : D.drudeModel} {K : KramersKronigPackage H}
    (P : PermittivityTensorialPackage K) where
  diagonalizableClosed : P.diagonalizable
  principalAxesClosed : P.principalAxes

def PermittivityTensorialClosed {D : DielectricFunctionPackage}
    {H : D.drudeModel} {K : KramersKronigPackage H}
    (P : PermittivityTensorialPackage K) : Prop :=
  P.diagonalizable ∧ P.principalAxes

theorem permittivity_tensorial_closed_from_evidence {D : DielectricFunctionPackage}
    {H : D.drudeModel} {K : KramersKronigPackage H}
    (P : PermittivityTensorialPackage K) (E : PermittivityTensorialEvidence P) :
    PermittivityTensorialClosed P := by
  exact And.intro E.diagonalizableClosed E.principalAxesClosed

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
