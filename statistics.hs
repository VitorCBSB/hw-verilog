import System.Process
import System.Directory
import System.Environment
import Data.List
import Data.Maybe
import Data.Time.Clock
import Control.Monad
import System.IO
import Text.PrettyPrint.Boxes

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
                        print n
			tempoInicial <- getCurrentTime
			listOutput <- chamarPrograma input
			tempoFinal <- getCurrentTime
			let tempoExecucao = floor $ realToFrac $ tempoFinal `diffUTCTime` tempoInicial
			case listOutput of
				[-1] -> chamarProgramaNVezes n input
				_ -> do
					recursiveCall <- chamarProgramaNVezes (n - 1) input
					return $ (listOutput ++ [tempoExecucao]) : recursiveCall

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

calcularEstatisticas :: [[Float]] -> [Maybe Float]
calcularEstatisticas listaAmostras = let 
	mediaConvergencia = media $ map (!! 0) listaAmostras
	mediaNumPortasPre = media $ map (!! 1) listaAmostras
	mediaNivelGatePre = media $ map (!! 2) listaAmostras
	mediaNumTransPre = media $ map (!! 3) listaAmostras
	mediaNumPortasPos = media $ map (!! 4) listaAmostras
	mediaNivelGatePos = media $ map (!! 5) listaAmostras
	mediaNumTransPos = media $ map (!! 6) listaAmostras
	mediaTempo = media $ map (!! 7) listaAmostras
	taxaMelhoraNumPortas = liftM2 (/) mediaNumPortasPre mediaNumPortasPos
	taxaMelhoraNivelGate = liftM2 (/) mediaNivelGatePre mediaNivelGatePos
	taxaMelhoraNumTrans = liftM2 (/) mediaNumTransPre mediaNumTransPos
	in
	[mediaConvergencia, mediaNumPortasPre, mediaNivelGatePre, mediaNumTransPre, 
			mediaNumPortasPos, mediaNivelGatePos, mediaNumTransPos, mediaTempo,
			taxaMelhoraNumPortas, taxaMelhoraNivelGate, taxaMelhoraNumTrans]

renderTabela :: [[String]] -> String
renderTabela linhas = render $ hsep 2 left (map (vcat left . map text) (transpose linhas))

realMain :: [String] -> IO ()
realMain [geracoesArg, amostrasArg] = do
	let informacoesGerais = ["Geracoes", "Amostras"]
	let cabecalho = ["Amostra", "Geracoes conv."]
		++ ["N. portas (pre)", "G. path (pre)", "N. trans (pre)"]
		++ ["N. portas (pos)", "G. path (pos)", "N. trans (pos)"]
		++ ["Tempo (s)"]
	let cabecalhoSumario = ["Media convergencia"] 
		++ ["Media n. portas (pre)", "Media g. path (pre)", "Media n. trans (pre)"] 
		++ ["Media n. portas (pos)", "Media g. path (pos)", "Media n. trans (pos)"]
		++ ["Media tempo", "% n. portas", "% gate", "% trans"]
	arquivoResultado <- openFile "resultado.txt" WriteMode
	setCurrentDirectory "/home/vitor/hw-verilog/C++"

	hPutStrLn arquivoResultado $ renderTabela [informacoesGerais, [geracoesArg, amostrasArg]]
	hPutStrLn arquivoResultado ""

	let maxGeracoes = read geracoesArg
	let amostras = read amostrasArg
	resultados <- chamarProgramaNVezes amostras maxGeracoes

	hPutStrLn arquivoResultado $ renderTabela $ cabecalho : (map . map) show (zipWith (:) [1..] resultados)
	hPutStrLn arquivoResultado ""

	let estatisticas = calcularEstatisticas ((map . map) fromInteger resultados)
	hPutStrLn arquivoResultado $ renderTabela [cabecalhoSumario, map formatarMaybe estatisticas]

	hClose arquivoResultado

realMain _ = do
	nome <- getProgName
	putStrLn $ "uso: " ++ nome ++ " <geracoes> <amostras>"

main :: IO ()
main = getArgs >>= realMain

