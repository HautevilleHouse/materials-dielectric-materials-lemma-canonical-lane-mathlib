import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure CrystalSymmetryPackage where
  pointGroup : Type u
  spaceGroup : Type v
  bravaisLattice : Type w
  pointGroupOperations : Prop
  spaceGroupSymmetries : Prop
  latticePeriodicity : Prop
  symmetryCompatibility : Prop

structure CrystalSymmetryEvidence (C : CrystalSymmetryPackage) where
  pointGroupOperationsClosed : C.pointGroupOperations
  spaceGroupSymmetriesClosed : C.spaceGroupSymmetries
  latticePeriodicityClosed : C.latticePeriodicity
  symmetryCompatibilityClosed : C.symmetryCompatibility

def CrystalSymmetryClosed (C : CrystalSymmetryPackage) : Prop :=
  C.pointGroupOperations ∧ C.spaceGroupSymmetries ∧
  C.latticePeriodicity ∧ C.symmetryCompatibility

theorem crystal_symmetry_closed_from_evidence (C : CrystalSymmetryPackage)
    (E : CrystalSymmetryEvidence C) : CrystalSymmetryClosed C := by
  exact And.intro E.pointGroupOperationsClosed
    (And.intro E.spaceGroupSymmetriesClosed
      (And.intro E.latticePeriodicityClosed E.symmetryCompatibilityClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
