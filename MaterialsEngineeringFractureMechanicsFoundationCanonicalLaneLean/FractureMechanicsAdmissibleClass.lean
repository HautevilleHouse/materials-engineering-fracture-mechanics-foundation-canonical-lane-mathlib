import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean.CrystalStructure
import MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean.PhaseDiagram
import MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean.ElasticConstants
import MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean.FractureToughness
import MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean.FatigueCrackGrowth

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure FractureMechanicsAdmissibleObject where
  crystal : CrystalStructure
  phaseDiagram : PhaseDiagram
  elasticConstants : ElasticConstants
  fractureToughness : FractureToughness
  fatigue : FatigueCrackGrowth
  allEvidence : CrystalStructureEvidence crystal ∧ PhaseDiagramEvidence phaseDiagram ∧
                ElasticConstantsEvidence elasticConstants ∧ FractureToughnessEvidence fractureToughness ∧
                FatigueCrackGrowthEvidence fatigue

def fractureMechanicsWitnessClosed (O : FractureMechanicsAdmissibleObject) : Prop :=
  CrystalStructureClosed O.crystal ∧ PhaseDiagramClosed O.phaseDiagram ∧
  ElasticConstantsClosed O.elasticConstants ∧ FractureToughnessClosed O.fractureToughness ∧
  FatigueCrackGrowthClosed O.fatigue

theorem fracture_mechanics_witness_closed_from_evidence (O : FractureMechanicsAdmissibleObject) :
    fractureMechanicsWitnessClosed O := by
  rcases O.allEvidence with ⟨hc, hp, he, hf, hfa⟩
  refine And.intro (crystal_structure_closed_from_evidence O.crystal hc) (And.intro (phase_diagram_closed_from_evidence O.phaseDiagram hp) (And.intro (elastic_constants_closed_from_evidence O.elasticConstants he) (And.intro (fracture_toughness_closed_from_evidence O.fractureToughness hf) (fatigue_crack_growth_closed_from_evidence O.fatigue hfa))))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse
