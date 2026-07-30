import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure PhaseDiagramStructure where
  phases : Type
  phaseBoundaries : Type
  gibbsFreeEnergy : Type
  eutecticPoint : Prop
  peritecticPoint : Prop
  solvusLine : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramStructure) where
  eutecticPointClosed : P.eutecticPoint
  peritecticPointClosed : P.peritecticPoint
  solvusLineClosed : P.solvusLine

def PhaseDiagramClosed (P : PhaseDiagramStructure) : Prop :=
  P.eutecticPoint ∧ P.peritecticPoint ∧ P.solvusLine

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramStructure) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.eutecticPointClosed (And.intro E.peritecticPointClosed E.solvusLineClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse