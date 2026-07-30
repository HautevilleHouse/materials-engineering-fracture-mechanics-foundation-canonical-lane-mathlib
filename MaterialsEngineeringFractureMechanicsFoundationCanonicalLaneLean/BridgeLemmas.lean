import MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FractureWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MaterialsEngineeringFractureMechanicsFoundationCanonicalLaneLean
end HautevilleHouse
