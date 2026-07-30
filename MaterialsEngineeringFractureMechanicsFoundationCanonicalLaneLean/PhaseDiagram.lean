import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  components : Type u
  phases : Type v
  equilibriumCondition : Prop
  phaseBoundaries : Prop
  leverRule : Prop
  gibbsFreeEnergy : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  componentsClosed : P.components
  phasesClosed : P.phases
  equilibriumConditionClosed : P.equilibriumCondition
  phaseBoundariesClosed : P.phaseBoundaries
  leverRuleClosed : P.leverRule
  gibbsFreeEnergyClosed : P.gibbsFreeEnergy

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.components ∧ P.phases ∧ P.equilibriumCondition ∧ P.phaseBoundaries ∧ P.leverRule ∧ P.gibbsFreeEnergy

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.componentsClosed
    (And.intro E.phasesClosed
      (And.intro E.equilibriumConditionClosed
        (And.intro E.phaseBoundariesClosed
          (And.intro E.leverRuleClosed E.gibbsFreeEnergyClosed))))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse