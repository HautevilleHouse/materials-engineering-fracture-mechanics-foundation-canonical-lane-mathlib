import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

structure ElasticityTensorPackage where
  stiffnessMatrix : Float → Float → Float → Float → Float → Float → Float
  complianceMatrix : Float → Float → Float → Float → Float → Float → Float
  orthotropic : Prop
  isotropic : Prop
  cubicSymmetry : Prop
  positiveDefinite : Prop
  majorSymmetry : Prop
  minorSymmetry : Prop

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  orthotropicClosed : E.orthotropic
  isotropicClosed : E.isotropic
  cubicSymmetryClosed : E.cubicSymmetry
  positiveDefiniteClosed : E.positiveDefinite
  majorSymmetryClosed : E.majorSymmetry
  minorSymmetryClosed : E.minorSymmetry

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.orthotropic ∧ E.isotropic ∧ E.cubicSymmetry ∧
  E.positiveDefinite ∧ E.majorSymmetry ∧ E.minorSymmetry

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensorPackage) (Ev : ElasticityTensorEvidence E) : ElasticityTensorClosed E :=
  And.intro Ev.orthotropicClosed (
    And.intro Ev.isotropicClosed (
      And.intro Ev.cubicSymmetryClosed (
        And.intro Ev.positiveDefiniteClosed (
          And.intro Ev.majorSymmetryClosed Ev.minorSymmetryClosed))))

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse