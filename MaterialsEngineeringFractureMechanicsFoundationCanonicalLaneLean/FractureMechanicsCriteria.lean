import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FractureCriteria where
  stressIntensityFactor : Float
  fractureToughness : Float
  energyReleaseRate : Float
  jIntegral : Float
  ctod : Float
  crackLength : Float
  appliedStress : Float
  geometryFactor : Float
  stressIntensityFactorCalculated : Prop
  fractureToughnessMeasured : Prop
  energyReleaseRateComputed : Prop
  jIntegralComputed : Prop
  ctodComputed : Prop
  kIcCriteriaSatisfied : Prop
  energyCriteriaSatisfied : Prop

structure FractureCriteriaEvidence (F : FractureCriteria) where
  stressIntensityFactorCalculatedClosed : F.stressIntensityFactorCalculated
  fractureToughnessMeasuredClosed : F.fractureToughnessMeasured
  energyReleaseRateComputedClosed : F.energyReleaseRateComputed
  jIntegralComputedClosed : F.jIntegralComputed
  ctodComputedClosed : F.ctodComputed
  kIcCriteriaSatisfiedClosed : F.kIcCriteriaSatisfied
  energyCriteriaSatisfiedClosed : F.energyCriteriaSatisfied

def FractureCriteriaClosed (F : FractureCriteria) : Prop :=
  F.stressIntensityFactorCalculated ∧ F.fractureToughnessMeasured ∧
  F.energyReleaseRateComputed ∧ F.jIntegralComputed ∧ F.ctodComputed ∧
  F.kIcCriteriaSatisfied ∧ F.energyCriteriaSatisfied

theorem fracture_criteria_closed_from_evidence (F : FractureCriteria) (E : FractureCriteriaEvidence F) : FractureCriteriaClosed F :=
  And.intro E.stressIntensityFactorCalculatedClosed (
    And.intro E.fractureToughnessMeasuredClosed (
      And.intro E.energyReleaseRateComputedClosed (
        And.intro E.jIntegralComputedClosed (
          And.intro E.ctodComputedClosed (
            And.intro E.kIcCriteriaSatisfiedClosed E.energyCriteriaSatisfiedClosed)))))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse