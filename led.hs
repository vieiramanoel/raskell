{-# LANGUAGE ForeignFunctionInterface #-}
import Foreign
import Foreign.C.Types

foreign import ccall "wiringPi.h wiringPiSetup"
    c_wiringPiSetup :: CInt