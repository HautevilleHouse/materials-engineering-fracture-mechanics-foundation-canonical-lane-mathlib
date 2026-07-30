import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure LinearElasticityTheoryPackage where
  stressTensor : Type u
  strainTensor : Type v
  constitutiveLaw : Type w
  hookesLawFormulated : Prop
  equilibriumEquations : Prop
  compatibilityConditions : Prop
  hookesLawFormulatedTerm : hookesLawFormulated
  equilibriumEquationsTerm : equilibriumEquations
  compatibilityConditionsTerm : compatibilityConditions

structure LinearElasticityTheoryEvidence (E : LinearElasticityTheoryPackage) where
  hookesLawFormulatedClosed : E.hookesLawFormulated
  equilibriumEquationsClosed : E.equilibriumEquations
  compatibilityConditionsClosed : E.compatibilityConditions

def LinearElasticityTheoryClosed (E : LinearElasticityTheoryPackage) : Prop :=
  E.hookesLawFormulated ∧ E.equilibriumEquations ∧ E.compatibilityConditions

theorem linear_elasticity_theory_closed_from_evidence (E : LinearElasticityTheoryPackage)
    (Ev : LinearElasticityTheoryEvidence E) : LinearElasticityTheoryClosed E := by
  exact And.intro Ev.hookesLawFormulatedClosed
    (And.intro Ev.equilibriumEquationsClosed Ev.compatibilityConditionsClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse