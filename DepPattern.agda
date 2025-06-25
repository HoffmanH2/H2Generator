module DepPattern where

open import Data.Nat using (ℕ)
open import Data.Unit using (⊤)

infixl 5 dp-app

data DepPattern : Set where
  dp-var : ℕ → DepPattern
  dp-app : DepPattern → DepPattern → DepPattern
