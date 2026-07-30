import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FatigueCycleModelPackage where
  stressCycleType : Type u
  fatigueLife : Type v
  SNCurveDefined : Prop
  parisLawRegion : Prop
  endurancelimit : Prop
  SNCurveDefinedTerm : SNCurveDefined
  parisLawRegionTerm : parisLawRegion
  endurancelimitTerm : endurancelimit

structure FatigueCycleModelEvidence (F : FatigueCycleModelPackage) where
  SNCurveDefinedClosed : F.SNCurveDefined
  parisLawRegionClosed : F.parisLawRegion
  endurancelimitClosed : F.endurancelimit

def FatigueCycleModelClosed (F : FatigueCycleModelPackage) : Prop :=
  F.SNCurveDefined ∧ F.parisLawRegion ∧ F.endurancelimit

theorem fatigue_cycle_model_closed_from_evidence (F : FatigueCycleModelPackage)
    (E : FatigueCycleModelEvidence F) : FatigueCycleModelClosed F := by
  exact And.intro E.SNCurveDefinedClosed
    (And.intro E.parisLawRegionClosed E.endurancelimitClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse