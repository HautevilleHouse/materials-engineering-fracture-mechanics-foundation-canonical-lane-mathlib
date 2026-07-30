import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure CrystalStructure where
  latticeType : String
  unitCellVolume : Float
  coordinations : List Nat
  symmetryGroup : String
  bravaisLattice : String
  primitiveVectors : List (Float × Float × Float)
  basisAtoms : List String
  bondAngles : List Float
  stackingFaultEnergy : Float

structure CrystalStructureEvidence (C : CrystalStructure) where
  latticeTypeClosed : C.latticeType = "FCC" ∨ C.latticeType = "BCC" ∨ C.latticeType = "HCP"
  unitCellVolumeClosed : C.unitCellVolume > 0
  coordinationClosed : all (fun n => n ≥ 1) C.coordinations
  symmetryGroupClosed : ¬ (C.symmetryGroup = "")

structure CrystalStructureAdmissibleClass where
  object : CrystalStructure
  evidence : CrystalStructureEvidence object

def CrystalStructureClosed (C : CrystalStructure) : Prop :=
  C.latticeType ∈ ["FCC", "BCC", "HCP"] ∧ C.unitCellVolume > 0 ∧
  (∀ n ∈ C.coordinations, n ≥ 1) ∧ C.symmetryGroup ≠ ""

theorem crystal_structure_closed_from_evidence (C : CrystalStructure) (E : CrystalStructureEvidence C) :
    CrystalStructureClosed C := by
  refine And.intro E.latticeTypeClosed (And.intro E.unitCellVolumeClosed ?_)
  refine And.intro ?_ E.symmetryGroupClosed
  intro n hn
  exact E.coordinationClosed hn

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse
