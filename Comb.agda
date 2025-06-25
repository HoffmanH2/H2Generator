module Comb where

infixl 5 _⟨_⟩

data Comb : Set where
  base : ℕ → Comb
  _⟨_⟩ : Comb → Comb → Comb
