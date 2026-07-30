import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure MaterialsConstitutiveLaw where
  stressStrainRelation : Type
  yieldCriterion : Type
  hardeningRule : Type
  flowRule : Type
  plasticityModel : Prop
  damageModel : Prop
  viscoelasticModel : Prop

structure ConstitutiveEvidence (M : MaterialsConstitutiveLaw) where
  plasticityModelClosed : M.plasticityModel
  damageModelClosed : M.damageModel
  viscoelasticModelClosed : M.viscoelasticModel

def ConstitutiveClosed (M : MaterialsConstitutiveLaw) : Prop :=
  M.plasticityModel ∧ M.damageModel ∧ M.viscoelasticModel

theorem constitutive_closed_from_evidence (M : MaterialsConstitutiveLaw) (E : ConstitutiveEvidence M) : ConstitutiveClosed M := by
  exact And.intro E.plasticityModelClosed (And.intro E.damageModelClosed E.viscoelasticModelClosed)

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse