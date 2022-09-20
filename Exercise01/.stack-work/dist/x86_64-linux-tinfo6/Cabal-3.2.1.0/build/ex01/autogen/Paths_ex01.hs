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

bindir     = "/home/sauvagen/TR033/CS34016/Exercise01/.stack-work/install/x86_64-linux-tinfo6/3c68f6377a3187d2f8c1475b9b6fab501756f8d123a6e1be6d551a7060561537/8.10.7/bin"
libdir     = "/home/sauvagen/TR033/CS34016/Exercise01/.stack-work/install/x86_64-linux-tinfo6/3c68f6377a3187d2f8c1475b9b6fab501756f8d123a6e1be6d551a7060561537/8.10.7/lib/x86_64-linux-ghc-8.10.7/ex01-0.1.0.0-1EJzuwZCEhFA2HR1x76Rws-ex01"
dynlibdir  = "/home/sauvagen/TR033/CS34016/Exercise01/.stack-work/install/x86_64-linux-tinfo6/3c68f6377a3187d2f8c1475b9b6fab501756f8d123a6e1be6d551a7060561537/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/sauvagen/TR033/CS34016/Exercise01/.stack-work/install/x86_64-linux-tinfo6/3c68f6377a3187d2f8c1475b9b6fab501756f8d123a6e1be6d551a7060561537/8.10.7/share/x86_64-linux-ghc-8.10.7/ex01-0.1.0.0"
libexecdir = "/home/sauvagen/TR033/CS34016/Exercise01/.stack-work/install/x86_64-linux-tinfo6/3c68f6377a3187d2f8c1475b9b6fab501756f8d123a6e1be6d551a7060561537/8.10.7/libexec/x86_64-linux-ghc-8.10.7/ex01-0.1.0.0"
sysconfdir = "/home/sauvagen/TR033/CS34016/Exercise01/.stack-work/install/x86_64-linux-tinfo6/3c68f6377a3187d2f8c1475b9b6fab501756f8d123a6e1be6d551a7060561537/8.10.7/etc"

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
