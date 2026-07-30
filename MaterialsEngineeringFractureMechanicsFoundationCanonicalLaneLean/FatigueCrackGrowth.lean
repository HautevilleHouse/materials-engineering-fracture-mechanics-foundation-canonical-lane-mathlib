import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FatigueCrackGrowthModel where
  parisLawCoefficient : Float
  parisLawExponent : Float
  thresholdStressIntensity : Float
  deltaK : Float
  crackGrowthRate : Float
  cyclesToFailure : Float
  initialCrackLength : Float
  criticalCrackLength : Float
  parisLawApplicable : Prop
  thresholdCrossed : Prop
  cyclesComputed : Prop

structure FatigueCrackGrowthEvidence (F : FatigueCrackGrowthModel) where
  parisLawApplicableClosed : F.parisLawApplicable
  thresholdCrossedClosed : F.thresholdCrossed
  cyclesComputedClosed : F.cyclesComputed

def FatigueCrackGrowthClosed (F : FatigueCrackGrowthModel) : Prop :=
  F.parisLawApplicable ∧ F.thresholdCrossed ∧ F.cyclesComputed

theorem fatigue_crack_growth_closed_from_evidence (F : FatigueCrackGrowthModel) (E : FatigueCrackGrowthEvidence F) : FatigueCrackGrowthClosed F :=
  And.intro E.parisLawApplicableClosed (
    And.intro E.thresholdCrossedClosed E.cyclesComputedClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse