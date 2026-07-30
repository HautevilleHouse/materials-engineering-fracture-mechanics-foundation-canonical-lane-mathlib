import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FatiguePackage where
  cyclicLoading : Prop
  SNCurve : Prop
  enduranceLimit : Prop
  fatigueLife : Prop
  parisLaw : Prop
  cyclicLoadingDefined : cyclicLoading
  SNCurveDefined : SNCurve
  enduranceLimitDefined : enduranceLimit
  fatigueLifePredicted : fatigueLife
  parisLawApplicable : parisLaw

structure FatigueEvidence (P : FatiguePackage) where
  cyclicLoadingClosed : P.cyclicLoadingDefined
  SNCurveClosed : P.SNCurveDefined
  enduranceLimitClosed : P.enduranceLimitDefined
  fatigueLifeClosed : P.fatigueLifePredicted
  parisLawClosed : P.parisLawApplicable

def FatigueClosed (P : FatiguePackage) : Prop :=
  P.cyclicLoading ∧ P.SNCurve ∧ P.enduranceLimit ∧ P.fatigueLife ∧ P.parisLaw

theorem fatigue_closed_from_evidence (P : FatiguePackage) (E : FatigueEvidence P) : FatigueClosed P := by
  exact And.intro E.cyclicLoadingClosed (And.intro E.SNCurveClosed (And.intro E.enduranceLimitClosed (And.intro E.fatigueLifeClosed E.parisLawClosed)))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse