import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure DislocationPlasticity where
  burgersVector : Type
  dislocationDensity : Type
  slipSystem : Type
  criticalResolvedShearStress : Prop
  workHardening : Prop
  creepRate : Prop

structure DislocationEvidence (D : DislocationPlasticity) where
  criticalResolvedShearStressClosed : D.criticalResolvedShearStress
  workHardeningClosed : D.workHardening
  creepRateClosed : D.creepRate

def DislocationClosed (D : DislocationPlasticity) : Prop :=
  D.criticalResolvedShearStress ∧ D.workHardening ∧ D.creepRate

theorem dislocation_closed_from_evidence (D : DislocationPlasticity) (E : DislocationEvidence D) : DislocationClosed D := by
  exact And.intro E.criticalResolvedShearStressClosed (And.intro E.workHardeningClosed E.creepRateClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse