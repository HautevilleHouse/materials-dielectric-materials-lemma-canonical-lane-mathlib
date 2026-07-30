import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  componentSet : Type u
  temperatureRange : Type v
  pressureRange : Type w
  phaseRegions : Prop
  phaseBoundaries : Prop
  gibbsFreeEnergy : Prop
  phaseTransitionsCharacterized : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseRegionsClosed : P.phaseRegions
  phaseBoundariesClosed : P.phaseBoundaries
  gibbsFreeEnergyClosed : P.gibbsFreeEnergy
  phaseTransitionsCharacterizedClosed : P.phaseTransitionsCharacterized

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseRegions ∧ P.phaseBoundaries ∧
  P.gibbsFreeEnergy ∧ P.phaseTransitionsCharacterized

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.phaseRegionsClosed
    (And.intro E.phaseBoundariesClosed
      (And.intro E.gibbsFreeEnergyClosed E.phaseTransitionsCharacterizedClosed))

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse
