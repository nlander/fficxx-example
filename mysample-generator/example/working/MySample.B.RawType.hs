{-# LANGUAGE ForeignFunctionInterface, TypeFamilies,
  MultiParamTypeClasses, FlexibleInstances, TypeSynonymInstances,
  EmptyDataDecls, ExistentialQuantification, ScopedTypeVariables #-}
module MySample.B.RawType where
import Foreign.Ptr
import FFICXX.Runtime.Cast

data RawB

newtype B = B (Ptr RawB)
              deriving (Eq, Ord, Show)

instance () => FPtr (B) where
        type Raw B = RawB
        get_fptr (B ptr) = ptr
        cast_fptr_to_obj = B
