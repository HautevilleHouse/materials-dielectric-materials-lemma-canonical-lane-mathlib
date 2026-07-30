import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsDielectricMaterialsLemmaCanonicalLaneLean

structure ClausiusMossottiPackage where
  polarizability : Type u
  localField : Type v
  dielectricConstant : Type w
  microscopicMacroscopicRelation : Prop
  localFieldCorrection : Prop
  diluteLimitAgreement : Prop

structure ClausiusMossottiEvidence (C : ClausiusMossottiPackage) where
  microscopicMacroscopicRelationClosed : C.microscopicMacroscopicRelation
  localFieldCorrectionClosed : C.localFieldCorrection
  diluteLimitAgreementClosed : C.diluteLimitAgreement

def ClausiusMossottiClosed (C : ClausiusMossottiPackage) : Prop :=
  C.microscopicMacroscopicRelation ∧ C.localFieldCorrection ∧ C.diluteLimitAgreement

theorem clausius_mossotti_closed_from_evidence (C : ClausiusMossottiPackage)
    (E : ClausiusMossottiEvidence C) : ClausiusMossottiClosed C := by
  exact And.intro E.microscopicMacroscopicRelationClosed
    (And.intro E.localFieldCorrectionClosed E.diluteLimitAgreementClosed)

end MaterialsDielectricMaterialsLemmaCanonicalLaneLean
end HautevilleHouse