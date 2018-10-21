{-# LANGUAGE ForeignFunctionInterface #-}
module MySample.B.FFI where
import Foreign.C
import Foreign.Ptr
import MySample.B.RawType
import MySample.A.RawType

foreign import ccall safe "MySampleB.h B_method1" c_b_method1 ::
               Ptr RawB -> IO ()

foreign import ccall safe "MySampleB.h B_newB" c_b_newb ::
               IO (Ptr RawB)

foreign import ccall safe "MySampleB.h B_method2" c_b_method2 ::
               Ptr RawB -> Ptr RawA -> IO (Ptr RawA)
