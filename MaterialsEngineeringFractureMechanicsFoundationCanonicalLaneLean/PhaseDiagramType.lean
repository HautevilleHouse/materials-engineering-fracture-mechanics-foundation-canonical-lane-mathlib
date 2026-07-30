import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure PhaseDiagramTypePackage where
  phaseRegion : Type u
  boundary : Type v
  equilibriumTransition : Prop
  phaseRuleConsistent : Prop
  gibbsPhaseRuleApplied : Prop
  equilibriumTransitionTerm : equilibriumTransition
  phaseRuleConsistentTerm : phaseRuleConsistent
  gibbsPhaseRuleAppliedTerm : gibbsPhaseRuleApplied

structure PhaseDiagramTypeEvidence (P : PhaseDiagramTypePackage) where
  equilibriumTransitionClosed : P.equilibriumTransition
  phaseRuleConsistentClosed : P.phaseRuleConsistent
  gibbsPhaseRuleAppliedClosed : P.gibbsPhaseRuleApplied

def PhaseDiagramTypeClosed (P : PhaseDiagramTypePackage) : Prop :=
  P.equilibriumTransition ∧ P.phaseRuleConsistent ∧ P.gibbsPhaseRuleApplied

theorem phase_diagram_type_closed_from_evidence (P : PhaseDiagramTypePackage)
    (E : PhaseDiagramTypeEvidence P) : PhaseDiagramTypeClosed P := by
  exact And.intro E.equilibriumTransitionClosed
    (And.intro E.phaseRuleConsistentClosed E.gibbsPhaseRuleAppliedClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse