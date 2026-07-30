import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure CrystallographyGroupPackage where
  latticeBravais : Type u
  unitCell : Type v
  symmetryGroup : Type w
  bravaisLatticeClassified : Prop
  symmetryGroupFinite : Prop
  bravaisLatticeClassifiedTerm : bravaisLatticeClassified
  symmetryGroupFiniteTerm : symmetryGroupFinite

structure CrystallographyGroupEvidence (G : CrystallographyGroupPackage) where
  bravaisLatticeClassifiedClosed : G.bravaisLatticeClassified
  symmetryGroupFiniteClosed : G.symmetryGroupFinite

def CrystallographyGroupClosed (G : CrystallographyGroupPackage) : Prop :=
  G.bravaisLatticeClassified ∧ G.symmetryGroupFinite

theorem crystallography_group_closed_from_evidence (G : CrystallographyGroupPackage)
    (E : CrystallographyGroupEvidence G) : CrystallographyGroupClosed G := by
  exact And.intro E.bravaisLatticeClassifiedClosed E.symmetryGroupFiniteClosed

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse