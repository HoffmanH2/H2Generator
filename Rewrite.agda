module Rewrite where

open import Data.Maybe
open import Comb
open import DepPattern
open import Match

rewrite : DepPattern → Comb → Maybe Comb
rewrite p t with match p t
... | just _ = just t
... | nothing = nothing
