module Match where

open import Data.Maybe
open import Data.Unit using (⊤; tt)

open import Comb
open import DepPattern

data Match : DepPattern → Comb → Set where
  match-var : ∀ {x n} → Match (dp-var x) (base n)
  match-app : ∀ {p₁ p₂ t₁ t₂} →
              Match p₁ t₁ →
              Match p₂ t₂ →
              Match (dp-app p₁ p₂) (t₁ ⟨ t₂ ⟩)

match : DepPattern → Comb → Maybe ⊤
match (dp-var _) (base _) = just tt
match (dp-app p q) (t ⟨ u ⟩) with match p t | match q u
... | just _ | just _ = just tt
... | _ | _ = nothing
match _ _ = nothing
