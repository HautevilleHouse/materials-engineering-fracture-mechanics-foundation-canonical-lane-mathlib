import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  phaseField : Type
  temperatureComposition : Type
  phaseBoundaries : Prop
  eutecticPoint : Prop
  phaseRule : Prop
  leverRule : Prop
  phaseBoundariesDefined : phaseBoundaries
  eutecticPointExists : eutecticPoint
  phaseRuleSatisfied : phaseRule
  leverRuleApplicable : leverRule

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundariesClosed : P.phaseBoundariesDefined
  eutecticPointClosed : P.eutecticPointExists
  phaseRuleClosed : P.phaseRuleSatisfied
  leverRuleClosed : P.leverRuleApplicable

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundaries ∧ P.eutecticPoint ∧ P.phaseRule ∧ P.leverRule

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundariesClosed (And.intro E.eutecticPointClosed (And.intro E.phaseRuleClosed E.leverRuleClosed))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse