{-# LANGUAGE ForeignFunctionInterface, TypeFamilies,
  MultiParamTypeClasses, FlexibleInstances, TypeSynonymInstances,
  EmptyDataDecls, ExistentialQuantification, ScopedTypeVariables #-}
module MySample.A.RawType where
import Foreign.Ptr
import FFICXX.Runtime.Cast

data RawA

newtype A = A (Ptr RawA)
              deriving (Eq, Ord, Show)

instance () => FPtr (A) where
        type Raw A = RawA
        get_fptr (A ptr) = ptr
        cast_fptr_to_obj = A
