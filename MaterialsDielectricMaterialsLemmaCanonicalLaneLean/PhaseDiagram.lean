import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure PhaseDiagram where
  temperatureRange : Float × Float
  pressureRange : Float × Float
  phases : List String
  transitionBoundaries : Type u

structure PhaseDiagramEvidence (P : PhaseDiagram) where
  temperatureRangeValid : P.temperatureRange.1 < P.temperatureRange.2
  pressureRangeValid : P.pressureRange.1 < P.pressureRange.2
  phasesNonempty : P.phases ≠ []
  transitionBoundariesDefined : Prop

def PhaseDiagramClosed (P : PhaseDiagram) : Prop :=
  P.temperatureRange.1 < P.temperatureRange.2 ∧
  P.pressureRange.1 < P.pressureRange.2 ∧
  P.phases ≠ []

theorem phase_diagram_closed_from_evidence (P : PhaseDiagram)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeValid
    (And.intro E.pressureRangeValid E.phasesNonempty)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse