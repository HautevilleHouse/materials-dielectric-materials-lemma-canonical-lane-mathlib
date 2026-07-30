import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure CrystalStructure where
  latticeVectors : Type u
  symmetryGroup : Type v
  bravaisLatticeType : String
  unitCellVolume : Float
  coordinationNumber : Nat

structure CrystalStructureEvidence (C : CrystalStructure) where
  latticeVectorsDefined : Prop
  symmetryGroupClosed : Prop
  bravaisLatticeTypeIdentified : Prop
  unitCellVolumeComputed : C.unitCellVolume > 0
  coordinationNumberComputed : C.coordinationNumber > 0

def CrystalStructureClosed (C : CrystalStructure) : Prop :=
  C.unitCellVolume > 0 ∧ C.coordinationNumber > 0

theorem crystal_structure_closed_from_evidence (C : CrystalStructure)
    (E : CrystalStructureEvidence C) : CrystalStructureClosed C := by
  exact And.intro E.unitCellVolumeComputed E.coordinationNumberComputed

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse