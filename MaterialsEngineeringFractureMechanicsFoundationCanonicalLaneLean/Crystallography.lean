import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure CrystallographyPackage where
  latticeVectors : Type u
  bravaisLattice : Prop
  unitCellVolume : Prop
  symmetryGroup : Prop
  millerIndices : Prop
  crystalSystem : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeVectorsClosed : C.latticeVectors
  bravaisLatticeClosed : C.bravaisLattice
  unitCellVolumeClosed : C.unitCellVolume
  symmetryGroupClosed : C.symmetryGroup
  millerIndicesClosed : C.millerIndices
  crystalSystemClosed : C.crystalSystem

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeVectors ∧ C.bravaisLattice ∧ C.unitCellVolume ∧ C.symmetryGroup ∧ C.millerIndices ∧ C.crystalSystem

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.latticeVectorsClosed
    (And.intro E.bravaisLatticeClosed
      (And.intro E.unitCellVolumeClosed
        (And.intro E.symmetryGroupClosed
          (And.intro E.millerIndicesClosed E.crystalSystemClosed))))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse