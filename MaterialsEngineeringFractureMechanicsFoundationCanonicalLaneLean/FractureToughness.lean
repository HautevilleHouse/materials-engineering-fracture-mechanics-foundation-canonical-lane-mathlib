import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FractureToughness where
  stressIntensityFactorKIC : Float
  JIntegralJIC : Float
  crackTipOpeningDisplacement : Float
  fractureMode : String
  sampleThickness : Float
  yieldStrength : Float
  constraintFactor : Float
  criticalEnergyReleaseRate : Float
  plasticZoneSize : Float
  crackLength : Float
  appliedStress : Float

structure FractureToughnessEvidence (F : FractureToughness) where
  KICClosed : F.stressIntensityFactorKIC > 0
  JICClosed : F.JIntegralJIC > 0
  CTODClosed : F.crackTipOpeningDisplacement > 0
  fractureModeClosed : F.fractureMode ∈ ["ModeI", "ModeII", "ModeIII"]
  thicknessClosed : F.sampleThickness > 0

def FractureToughnessClosed (F : FractureToughness) : Prop :=
  F.stressIntensityFactorKIC > 0 ∧
  F.JIntegralJIC > 0 ∧
  F.crackTipOpeningDisplacement > 0 ∧
  F.fractureMode ∈ ["ModeI", "ModeII", "ModeIII"] ∧
  F.sampleThickness > 0

theorem fracture_toughness_closed_from_evidence (F : FractureToughness) (E : FractureToughnessEvidence F) :
    FractureToughnessClosed F := by
  refine And.intro E.KICClosed (And.intro E.JICClosed (And.intro E.CTODClosed (And.intro E.fractureModeClosed E.thicknessClosed)))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse
