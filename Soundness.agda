module Soundness where

open import Relation.Binary.PropositionalEquality as Eq using (_≡_; refl; cong)

open import Comb
open import DepPattern
open import Match
open import Rewrite

lemma-sound :
  ∀ {p t r} →
  rewrite p t ≡ just r →
  ∃ λ _ → Match p t
lemma-sound {p} {t} {r} eq =
  let m = match p t in
  Eq.begin rewrite p t
    Eq.≡⟨ Eq.refl ⟩
    m >>= λ _ → just t
    Eq.≡⟨ eq ⟩
    just r
  in {!!}  -- dowód zależny od szczegółów ≡ i >>=

