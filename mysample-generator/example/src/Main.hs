{-# LANGUAGE ScopedTypeVariables #-}

import           Data.HashMap.Strict (singleton)

import           FFICXX.Generate.Builder (simpleBuilder)
import           FFICXX.Generate.Code.Primitive (void_, cppclass_, cppclass)
import           FFICXX.Generate.Type.Cabal (Cabal(..), CabalName(..), AddCInc(..), AddCSrc(..))
import           FFICXX.Generate.Type.Class (Class(..), Function(Virtual, Constructor))
import           FFICXX.Generate.Type.Config (ModuleUnit(MU_TopLevel), emptyModuleUnitImports, ModuleUnitMap(..))

incs = [ AddCInc "test.h" "//test ok?" ]

srcs = [ AddCSrc "test.cpp" "//test ok??" ]


mycabal = Cabal { cabal_pkgname = CabalName "MySample"
                , cabal_version = "2.4.0.0"
                , cabal_cheaderprefix = "MySample"
                , cabal_moduleprefix = "MySample"
                , cabal_additional_c_incs = incs
                , cabal_additional_c_srcs = srcs
                , cabal_additional_pkgdeps = []
                , cabal_license = Just "BSD3"
                , cabal_licensefile = Just "LICENSE"
                , cabal_extraincludedirs = []
                , cabal_extralibdirs = []
                , cabal_extrafiles = []
                , cabal_pkg_config_depends = []
                }


myclass = Class mycabal

a :: Class
a = myclass "A" [] mempty Nothing
    [ Constructor [] Nothing
    , Virtual void_ "method1" [ ] Nothing
    ] [] []

b :: Class
b = myclass "B" [a] mempty Nothing
    [ Constructor [] Nothing
    , Virtual (cppclass_ a) "method2" [ cppclass a "x" ] Nothing
    ] [] []

myclasses = [ a, b]

toplevelfunctions = [ ]


main :: IO ()
main = do 
  simpleBuilder "MySample" (ModuleUnitMap $ singleton MU_TopLevel emptyModuleUnitImports) (mycabal,myclasses,toplevelfunctions,[]) [ ] []

