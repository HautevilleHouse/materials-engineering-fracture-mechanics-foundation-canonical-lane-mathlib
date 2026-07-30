import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure CrystallographyLattice where
  bravaisLattice : Type
  latticeParameters : Type
  symmetryGroup : Type
  unitCellVolume : Prop
  coordinationNumber : Prop
  bondAngles : Prop

structure LatticeEvidence (L : CrystallographyLattice) where
  unitCellVolumeClosed : L.unitCellVolume
  coordinationNumberClosed : L.coordinationNumber
  bondAnglesClosed : L.bondAngles

def LatticeClosed (L : CrystallographyLattice) : Prop :=
  L.unitCellVolume ∧ L.coordinationNumber ∧ L.bondAngles

theorem lattice_closed_from_evidence (L : CrystallographyLattice) (E : LatticeEvidence L) : LatticeClosed L := by
  exact And.intro E.unitCellVolumeClosed (And.intro E.coordinationNumberClosed E.bondAnglesClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse