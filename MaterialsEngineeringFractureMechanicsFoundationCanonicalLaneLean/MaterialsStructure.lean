import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure LatticeStructure where
  latticeType : Type
  unitCell : Type
  bravaisLattice : Type
  primitiveVectors : Type
  symmetryGroup : Type
  latticeConstant : Float
  bravaisClassified : Prop
  latticeConstantDefined : Prop

structure MaterialsPhase where
  phaseName : String
  crystalSystem : String
  spaceGroup : Int
  latticeParams : LatticeStructure
  stoichiometry : String
  stableAtConditions : Prop

structure LatticeEvidence (L : LatticeStructure) where
  bravaisClassifiedClosed : L.bravaisClassified
  latticeConstantDefinedClosed : L.latticeConstantDefined

def LatticeClosed (L : LatticeStructure) : Prop :=
  L.bravaisClassified ∧ L.latticeConstantDefined

theorem lattice_closed_from_evidence (L : LatticeStructure) (E : LatticeEvidence L) : LatticeClosed L :=
  And.intro E.bravaisClassifiedClosed E.latticeConstantDefinedClosed

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse