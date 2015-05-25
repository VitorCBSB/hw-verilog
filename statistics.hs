import System.Process
import System.Directory
import Data.Function
import Data.List
import Data.Maybe

maybemizaInput (-1) = Nothing
maybemizaInput x = Just x

chamarNVezes :: Integer -> Integer -> IO [Maybe Integer]
chamarNVezes n input =
	if n == 0 then
		return []
	else
		do 
			output <- readProcess "/home/vitor/hw-verilog/C++/Debug/hw-verilog" [show input] ""
			let listOutput = map read (words output) :: [Integer]
			recursiveCall <- chamarNVezes (n - 1) input
			return $ maybemizaInput (sum listOutput) : recursiveCall

media [] = Nothing
media lista = Just $ sum lista / fromIntegral (length lista)

desvioPadrao [] = Nothing
desvioPadrao [_] = Nothing
desvioPadrao lista = let
	mediaLista = fromJust (media lista)
	in
		Just $ sqrt $ sum (map (\x -> (x - mediaLista)^2) lista) / fromIntegral (length lista - 1)

minimum_ [] = Nothing
minimum_ lista = Just (minimum lista)

maximum_ [] = Nothing
maximum_ lista = Just (maximum lista)

formatarMaybe (Just x) = show x
formatarMaybe Nothing = "N/A"

printarEstatisticas :: Integer -> [Maybe Float] -> IO ()
printarEstatisticas max_geracoes lista_amostras = let 
	respostasCorretas = catMaybes lista_amostras
	taxaSucesso = fromIntegral (length respostasCorretas) / fromIntegral (length lista_amostras)
	output = [Just (fromInteger max_geracoes), media respostasCorretas, 
			minimum_ respostasCorretas, maximum_ respostasCorretas, 
			desvioPadrao respostasCorretas, Just taxaSucesso]
	in
			putStr $ formatar (map formatarMaybe output) ++ "\n"

formatar = 
	intercalate " | "

linhas = "-------------------------------------------"

main = do
	putStr $ formatar ["Max ger.", "Media", "Menor", "Maior", "Desvio Padrao", "Taxa sucesso"] ++ "\n"
	putStr $ linhas ++ "\n"
	setCurrentDirectory "/home/vitor/hw-verilog/C++"
	let maxGeracoes = [2000, 5000, 10000]
	let amostras = 20
	multipleOutputs <- mapM (chamarNVezes amostras) maxGeracoes
	mapM_ (\(max_g, mul_o) -> printarEstatisticas max_g (map (fmap fromInteger) mul_o)) (zip maxGeracoes multipleOutputs)

