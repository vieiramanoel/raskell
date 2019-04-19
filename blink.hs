{-# LANGUAGE ForeignFunctionInterface #-}
import Foreign
import Foreign.C.Types
import Control.Concurrent

foreign import ccall safe "prototypes.h"
    c_wiringPiSetup :: IO Int

foreign import ccall safe "prototypes.h"
    c_pinMode :: Int -> Int -> IO ()

foreign import ccall safe "prototypes.h"
    c_digitalWrite :: Int -> Int -> IO ()

main :: IO ()
main = do 
    pin <- c_wiringPiSetup
    case pin of
        -1 -> error "Pins are not available"
        0 -> do 
                c_pinMode 0 1
                c_digitalWrite 0 1
                n <- getLine
                c_digitalWrite 0 0
                n <- getLine
                c_digitalWrite 0 1
                n <- getLine
                c_digitalWrite 0 0
                n <- getLine
                c_digitalWrite 0 1


            

