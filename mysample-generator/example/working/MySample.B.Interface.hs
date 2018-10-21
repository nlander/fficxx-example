{-# LANGUAGE EmptyDataDecls, ExistentialQuantification,
  FlexibleContexts, FlexibleInstances, ForeignFunctionInterface,
  MultiParamTypeClasses, ScopedTypeVariables, TypeFamilies,
  TypeSynonymInstances #-}
module MySample.B.Interface where
import Data.Word
import Foreign.C
import Foreign.Ptr
import FFICXX.Runtime.Cast
import MySample.B.RawType
import MySample.A.RawType
import MySample.A.Interface

class (IA a) => IB a where
        method2 :: (IA c0, FPtr c0) => a -> c0 -> IO A

upcastB :: forall a . (FPtr a, IB a) => a -> B
upcastB h
  = let fh = get_fptr h
        fh2 :: Ptr RawB = castPtr fh
      in cast_fptr_to_obj fh2

downcastB :: forall a . (FPtr a, IB a) => B -> a
downcastB h
  = let fh = get_fptr h
        fh2 = castPtr fh
      in cast_fptr_to_obj fh2
