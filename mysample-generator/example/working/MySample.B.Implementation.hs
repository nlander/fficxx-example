{-# LANGUAGE EmptyDataDecls, FlexibleContexts, FlexibleInstances,
  ForeignFunctionInterface, IncoherentInstances,
  MultiParamTypeClasses, OverlappingInstances, TemplateHaskell,
  TypeFamilies, TypeSynonymInstances #-}
module MySample.B.Implementation where
import Data.Monoid
import Data.Word
import Foreign.C
import Foreign.Ptr
import Language.Haskell.TH
import Language.Haskell.TH.Syntax
import System.IO.Unsafe
import FFICXX.Runtime.Cast
import FFICXX.Runtime.TH
import MySample.B.RawType
import MySample.B.FFI
import MySample.B.Interface
import MySample.B.Cast
import MySample.A.RawType
import MySample.A.Cast
import MySample.A.Interface

instance () => IB (B) where
        method2 = xform1 c_b_method2

instance () => IA (B) where
        method1 = xform0 c_b_method1

newB :: () => IO B
newB = xformnull c_b_newb
