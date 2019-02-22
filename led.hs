{-# LANGUAGE ForeignFunctionInterface #-}
import Foreign
import Foreign.C.Types
import Control.Concurrent
foreign import ccall "wiringPi.h wiringPiSetup"
    c_wiringPiSetup :: CInt

foreign import ccall "wiringPi.h pinMode"
    c_pinMode :: CInt -> CInt -> ()

foreign import ccall "wiringPi.h digitalWrite"
    c_digitalWrite :: CInt -> CInt -> ()

readyPins :: CInt -> Bool
readyPins  ready
    | ready == -1 = error "setup wiringPi failed !\n"
    | otherwise = True

main :: IO ()
main = do
	print $ readyPins c_wiringPiSetup
	-- INPUT = 0, OUTPUT = 1
	print $ c_pinMode 0 1
	print $ c_digitalWrite 0 0
	line1 <- getLine
	print $ c_digitalWrite 0 1
	line2 <- getLine
	print $ c_digitalWrite 0 0
	line3 <- getLine
	print $ c_digitalWrite 0 1
	line4 <- getLine
	print $ c_digitalWrite 0 0
	line5 <- getLine
	print $ c_digitalWrite 0 1

