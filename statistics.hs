import System.Process
import System.Directory
import Data.Function
import Data.List
import Data.Maybe
import Control.Monad

chamarPrograma :: Integer -> IO [Integer]
chamarPrograma input =
	do
		output <- readProcess "/home/vitor/hw-verilog/C++/Debug/hw-verilog" [show input] ""
		return (map read (words output) :: [Integer])

chamarProgramaNVezes :: Integer -> Integer -> IO [[Integer]]
chamarProgramaNVezes n input =
	if n == 0 then
		return []
	else
		do 
			listOutput <- chamarPrograma input
			case listOutput of
				[-1] -> chamarProgramaNVezes n input
				_ -> do
					recursiveCall <- chamarProgramaNVezes (n - 1) input
					return $ listOutput : recursiveCall

media [] = Nothing
media lista = Just $ sum lista / fromIntegral (length lista)

desvioPadrao [] = Nothing
desvioPadrao [_] = Nothing
desvioPadrao lista = let
	mediaLista = fromJust (media lista)
	in
		Just $ sqrt $ sum (map (\x -> (x - mediaLista)^2) lista) / fromIntegral (length lista - 1)

formatarMaybe (Just x) = show x
formatarMaybe Nothing = "N/A"

printarEstatisticas :: Integer -> Integer -> [[Float]] -> IO ()
printarEstatisticas amostras max_geracoes listaAmostras = let 
	mediaConvergencia = media $ map (!! 0) listaAmostras
	mediaNumPortasPre = media $ map (!! 1) listaAmostras
	mediaNivelGatePre = media $ map (!! 2) listaAmostras
	mediaNumPortasPos = media $ map (!! 3) listaAmostras
	mediaNivelGatePos = media $ map (!! 4) listaAmostras
	taxaMelhoraNumPortas = liftM2 (/) mediaNumPortasPre mediaNumPortasPos
	taxaMelhoraNivelGate = liftM2 (/) mediaNivelGatePre mediaNivelGatePos
	output = [Just (fromInteger amostras), Just (fromInteger max_geracoes), mediaConvergencia, 
			mediaNumPortasPre, mediaNivelGatePre, mediaNumPortasPos, mediaNivelGatePos,
			taxaMelhoraNumPortas, taxaMelhoraNivelGate]
	in
			putStrLn $ formatar (map formatarMaybe output)

formatar = 
	intercalate " | "

linhas = "------------------------------------------------------------------------"

main = do
	putStrLn $ formatar $ ["Amostras", "Max ger. otimizicao", "Media convergencia"] 
		++ ["Media n. portas (pre)", "Media gate path (pre)", "Media n. portas (pos)", "Media gate path (pos)"] 
		++ ["% n. portas", "% gate"]
	putStr $ linhas ++ "\n"
	setCurrentDirectory "/home/vitor/hw-verilog/C++"
	let maxGeracoes = 30000
	let amostras = 50
	resultados <- chamarProgramaNVezes amostras maxGeracoes
	printarEstatisticas amostras maxGeracoes ((map . map) fromInteger resultados)

