import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FractureMechanicsPackage where
  stressIntensityFactor : Type u
  crackTipField : Type v
  fractureToughness : Prop
  griffithCriterion : Prop
  energyReleaseRate : Prop
  parisLaw : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  stressIntensityFactorClosed : F.stressIntensityFactor
  crackTipFieldClosed : F.crackTipField
  fractureToughnessClosed : F.fractureToughness
  griffithCriterionClosed : F.griffithCriterion
  energyReleaseRateClosed : F.energyReleaseRate
  parisLawClosed : F.parisLaw

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.stressIntensityFactor ∧ F.crackTipField ∧ F.fractureToughness ∧ F.griffithCriterion ∧ F.energyReleaseRate ∧ F.parisLaw

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.stressIntensityFactorClosed
    (And.intro E.crackTipFieldClosed
      (And.intro E.fractureToughnessClosed
        (And.intro E.griffithCriterionClosed
          (And.intro E.energyReleaseRateClosed E.parisLawClosed))))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse