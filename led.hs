{-# LANGUAGE ForeignFunctionInterface #-}
import Foreign
import Foreign.C.Types

foreign import ccall "wiringPi.h wiringPiSetup"
    c_wiringPiSetup :: CInt

foreign import ccall "wiringPi.h pinMode"
    c_pinMode :: CInt -> CInt -> CVoid

foreign import ccall "wiringPi.h digitalWrite"
    c_digitalWrite :: CInt -> CInt -> ()

readyPins :: CInt -> Bool
readyPins  ready
    | ready == -1 = error "setup wiringPi failed !\n"
    | otherWise = True

changeLedState :: ([Int] -> Int) -> ()
changeLedState (x:xs) y = c_digitalWrite (x `mod` 2) y

main :: IO ()
wiringSetup = c_wiringPiSetup
isPinsReady = readyPins wiringSetup
-- INPUT = 0, OUTPUT = 1
pinMode 0, 1
loop = [0..]
c_digitalWrite 0 0
c_digitalWrite 0 1
c_digitalWrite 0 1


