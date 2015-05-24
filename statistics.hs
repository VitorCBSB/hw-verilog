import System.Process
import System.Directory
import Data.Function
import Data.List
import Data.Maybe

maybemiza_input (-1) = Nothing
maybemiza_input x = Just x

chamar_n_vezes :: Integer -> Integer -> IO [Maybe Integer]
chamar_n_vezes n input =
	if n == 0 then
		return []
	else
		do 
			output <- readProcess "/home/vitor/hw-verilog/C++/Debug/hw-verilog" [show input] ""
			let list_output = map read (words output) :: [Integer]
			recursive_call <- chamar_n_vezes (n - 1) input
			return $ (maybemiza_input (sum list_output)) : recursive_call

media [] = Nothing
media lista = Just $ (foldl (+) 0 lista) / (fromIntegral (length lista))

desvio_padrao [] = Nothing
desvio_padrao [_] = Nothing
desvio_padrao lista = let
	media_lista = fromJust (media lista)
	in
		Just $ sqrt $ (sum (map (\x -> (x - media_lista)^2) lista)) / fromIntegral ((length lista) - 1)

minimum_ [] = Nothing
minimum_ lista = Just (minimum lista)

maximum_ [] = Nothing
maximum_ lista = Just (maximum lista)

formatar_maybe (Just x) = show x
formatar_maybe Nothing = "N/A"

printar_estatisticas :: Integer -> [Maybe Float] -> IO ()
printar_estatisticas max_geracoes lista_amostras = let 
	respostas_corretas = catMaybes lista_amostras
	taxa_sucesso = (fromIntegral (length respostas_corretas)) / (fromIntegral (length lista_amostras))
	output = [Just (fromInteger max_geracoes), media respostas_corretas, 
			minimum_ respostas_corretas, maximum_ respostas_corretas, 
			desvio_padrao respostas_corretas, Just taxa_sucesso]
	in
			putStr $ formatar (map formatar_maybe output) ++ "\n"

formatar lista = 
	concat $ intersperse " | " lista

linhas = "-------------------------------------------"

main = do
	putStr $ formatar ["Max ger.", "Media", "Menor", "Maior", "Desvio Padrao", "Taxa sucesso"] ++ "\n"
	putStr $ linhas ++ "\n"
	setCurrentDirectory "/home/vitor/hw-verilog/C++"
	let max_geracoes = [10, 100, 2000]
	let amostras = 10
	multiple_outputs <- mapM (chamar_n_vezes amostras) max_geracoes
	mapM_ (\(max_g, mul_o) -> printar_estatisticas max_g (map (fmap fromInteger) mul_o)) (zip max_geracoes multiple_outputs)

