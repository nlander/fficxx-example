{-# LANGUAGE EmptyDataDecls, ExistentialQuantification,
  FlexibleContexts, FlexibleInstances, ForeignFunctionInterface,
  MultiParamTypeClasses, ScopedTypeVariables, TypeFamilies,
  TypeSynonymInstances #-}
module MySample.A.Interface where
import Data.Word
import Foreign.C
import Foreign.Ptr
import FFICXX.Runtime.Cast
import MySample.A.RawType

class () => IA a where
        method1 :: () => a -> IO ()

upcastA :: forall a . (FPtr a, IA a) => a -> A
upcastA h
  = let fh = get_fptr h
        fh2 :: Ptr RawA = castPtr fh
      in cast_fptr_to_obj fh2

downcastA :: forall a . (FPtr a, IA a) => A -> a
downcastA h
  = let fh = get_fptr h
        fh2 = castPtr fh
      in cast_fptr_to_obj fh2
