import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FractureModesStructurePackage where
  modeI : Prop
  modeII : Prop
  modeIII : Prop
  stressIntensityFactorDefined : Prop
  crackTipFieldAsymptotics : Prop
  modeITerm : modeI
  modeIITerm : modeII
  modeIIITerm : modeIII
  stressIntensityFactorDefinedTerm : stressIntensityFactorDefined
  crackTipFieldAsymptoticsTerm : crackTipFieldAsymptotics

structure FractureModesStructureEvidence (F : FractureModesStructurePackage) where
  modeIClosed : F.modeI
  modeIIClosed : F.modeII
  modeIIIClosed : F.modeIII
  stressIntensityFactorDefinedClosed : F.stressIntensityFactorDefined
  crackTipFieldAsymptoticsClosed : F.crackTipFieldAsymptotics

def FractureModesStructureClosed (F : FractureModesStructurePackage) : Prop :=
  F.modeI ∧ F.modeII ∧ F.modeIII ∧
  F.stressIntensityFactorDefined ∧ F.crackTipFieldAsymptotics

theorem fracture_modes_structure_closed_from_evidence (F : FractureModesStructurePackage)
    (Ev : FractureModesStructureEvidence F) : FractureModesStructureClosed F := by
  exact And.intro Ev.modeIClosed
    (And.intro Ev.modeIIClosed
      (And.intro Ev.modeIIIClosed
        (And.intro Ev.stressIntensityFactorDefinedClosed Ev.crackTipFieldAsymptoticsClosed)))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse