{-# LANGUAGE ForeignFunctionInterface #-}
import Foreign
import Foreign.C.Types
import Control.Concurrent


foreign import ccall safe "prototypes.h"
    c_wiringPiSetup :: IO Int

foreign import ccall safe "prototypes.h"
    c_pinMode :: Int -> Int -> IO ()

foreign import ccall safe "prototypes.h"
    c_pwmWrite :: Int -> Int -> IO ()

pwmf :: [Int] -> IO ()
pwmf [] = return ()
pwmf (x:xs) = do 
                c_pwmWrite 1 x
                threadDelay 3000
                pwmf xs
                

main :: IO ()
main = do
        pin <- c_wiringPiSetup
        case pin of
            -1 -> error "Pins are not available"
            0 -> do 
                    c_pinMode 0 2
                    let rangeHigh = [0, 4..1024]
                    let rangeLow = reverse rangeHigh
                    let loop = do 
                        pwmf rangeHigh
                        pwmf rangeLow
                        loop
                    loop