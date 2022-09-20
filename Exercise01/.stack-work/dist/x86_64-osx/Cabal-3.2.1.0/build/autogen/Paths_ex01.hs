{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ex01 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/butrfeld/REPOS/CSU34016-materials/exercises/Exercise01/.stack-work/install/x86_64-osx/31beacb5b4bb985e6d7cfcb460e98d69c28254c0f0471b1485dda31be141a7df/8.10.7/bin"
libdir     = "/Users/butrfeld/REPOS/CSU34016-materials/exercises/Exercise01/.stack-work/install/x86_64-osx/31beacb5b4bb985e6d7cfcb460e98d69c28254c0f0471b1485dda31be141a7df/8.10.7/lib/x86_64-osx-ghc-8.10.7/ex01-0.1.0.0-LmKArrmIkh31Ll6hy9RVTs"
dynlibdir  = "/Users/butrfeld/REPOS/CSU34016-materials/exercises/Exercise01/.stack-work/install/x86_64-osx/31beacb5b4bb985e6d7cfcb460e98d69c28254c0f0471b1485dda31be141a7df/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/butrfeld/REPOS/CSU34016-materials/exercises/Exercise01/.stack-work/install/x86_64-osx/31beacb5b4bb985e6d7cfcb460e98d69c28254c0f0471b1485dda31be141a7df/8.10.7/share/x86_64-osx-ghc-8.10.7/ex01-0.1.0.0"
libexecdir = "/Users/butrfeld/REPOS/CSU34016-materials/exercises/Exercise01/.stack-work/install/x86_64-osx/31beacb5b4bb985e6d7cfcb460e98d69c28254c0f0471b1485dda31be141a7df/8.10.7/libexec/x86_64-osx-ghc-8.10.7/ex01-0.1.0.0"
sysconfdir = "/Users/butrfeld/REPOS/CSU34016-materials/exercises/Exercise01/.stack-work/install/x86_64-osx/31beacb5b4bb985e6d7cfcb460e98d69c28254c0f0471b1485dda31be141a7df/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ex01_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ex01_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ex01_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ex01_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ex01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ex01_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
