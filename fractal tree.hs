-- Crea las coordenadas de un arborl fractal para despues dibujarlo en python, toma el angulo de las ramas como argumento del programa.

import System.Environment
data Linea = Linea Int Int Int Int

showLinea :: Linea -> String
showLinea (Linea x1 y1 x2 y2) = show x1 ++ "," ++ show y1 ++ "," ++ show x2 ++ "," ++ show y2 ++ "\n"

getDato :: Int -> Linea -> Int
getDato index (Linea x1 y1 x2 y2) | index == 0 = x1 | index == 1 = y1 | index == 2 = x2 | index == 3 = y2 |  otherwise = error "Index fuera del limite"

rotarLinea :: Double -> Linea -> Linea
rotarLinea angulo (Linea x1 y1 x2 y2) = (Linea x1 y1  (round (( fromIntegral (x2 - x1) * cos angulo - fromIntegral (y2 - y1) * sin angulo) + fromIntegral x1))  (round (( fromIntegral (y2 - y1) * cos angulo + fromIntegral (x2 - x1) * sin angulo) + fromIntegral y1)))

branch :: Double -> Int -> Int -> Double -> Double -> String
branch angulo x1 y1 len da = if len < 1 then "" else let linea = (rotarLinea angulo (Linea x1 y1 x1 (round ((fromIntegral y1)+len)))) in showLinea linea ++ branch (angulo+da)  (getDato 2 linea) (getDato 3 linea) (len*0.65) da ++ showLinea linea ++ branch (angulo-da)  (getDato 2 linea) (getDato 3 linea) (len*0.65) da


main :: IO ()
main = do
     d <- getArgs
     -- putStr (branch 0.0 (-300) 0  100 (pi/3))
     let degrees = read (d!!0)::Double
     putStr (branch 0.0 0 0 300 (degrees * (pi/180)))
     -- putStr (branch 0.0 300 0 100 (pi/3))
     -- putStr (branch (-45) (-600) 400 100 (pi/3))
