import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure ElasticConstants where
  youngModulus : Float
  poissonRatio : Float
  shearModulus : Float
  bulkModulus : Float
  lameLambda : Float
  cubicC11 : Float
  cubicC12 : Float
  cubicC44 : Float
  anisotropicRatio : Float

structure ElasticConstantsEvidence (E : ElasticConstants) where
  youngModulusClosed : E.youngModulus > 0
  poissonRatioClosed : E.poissonRatio > -1 ∧ E.poissonRatio < 0.5
  shearModulusClosed : E.shearModulus > 0
  bulkModulusClosed : E.bulkModulus > 0
  anisotropicRatioClosed : E.anisotropicRatio > 0

def ElasticConstantsClosed (E : ElasticConstants) : Prop :=
  E.youngModulus > 0 ∧
  E.poissonRatio > -1 ∧ E.poissonRatio < 0.5 ∧
  E.shearModulus > 0 ∧
  E.bulkModulus > 0 ∧
  E.anisotropicRatio > 0

theorem elastic_constants_closed_from_evidence (E : ElasticConstants) (Ev : ElasticConstantsEvidence E) :
    ElasticConstantsClosed E := by
  refine And.intro Ev.youngModulusClosed (And.intro Ev.poissonRatioClosed.1 (And.intro Ev.poissonRatioClosed.2 (And.intro Ev.shearModulusClosed (And.intro Ev.bulkModulusClosed Ev.anisotropicRatioClosed))))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse
