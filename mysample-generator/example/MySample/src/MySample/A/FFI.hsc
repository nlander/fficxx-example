{-# LANGUAGE ForeignFunctionInterface #-}
module MySample.A.FFI where
import Foreign.C
import Foreign.Ptr
import MySample.A.RawType

foreign import ccall safe "MySampleA.h A_newA" c_a_newa ::
               IO (Ptr RawA)

foreign import ccall safe "MySampleA.h A_method1" c_a_method1 ::
               Ptr RawA -> IO ()
