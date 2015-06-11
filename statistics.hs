import System.Process
import System.Directory
import System.Environment
import Data.List
import Data.Maybe
import Data.Time.Clock
import Control.Monad
import System.IO

chamarPrograma :: Integer -> IO [Integer]
chamarPrograma input =
	do
		output <- readProcess "/home/vitor/hw-verilog/C++/Debug/hw-verilog" [show input] ""
		return (map read (words output) :: [Integer])

chamarProgramaNVezes :: Integer -> Integer -> IO [(Integer, [Integer])]
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
					return $ (tempoExecucao, listOutput) : recursiveCall

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
	taxaMelhoraNumPortas = liftM2 (/) mediaNumPortasPre mediaNumPortasPos
	taxaMelhoraNivelGate = liftM2 (/) mediaNivelGatePre mediaNivelGatePos
	taxaMelhoraNumTrans = liftM2 (/) mediaNumTransPre mediaNumTransPos
	in
	[mediaConvergencia, 
			mediaNumPortasPre, mediaNivelGatePre, mediaNumTransPre, 
			mediaNumPortasPos, mediaNivelGatePos, mediaNumTransPos,
			taxaMelhoraNumPortas, taxaMelhoraNivelGate]

formatar = intercalate " | "

linhas n = replicate n '-'

realMain :: [String] -> IO ()
realMain [geracoesArg, amostrasArg] = do
	let informacoesGerais = formatar ["Geracoes", "Amostras"]
	let cabecalho = formatar $ ["Amostra", "Geracoes conv."]
		++ ["N. portas (pre)", "G. path (pre)", "N. trans (pre)"]
		++ ["N. portas (pos)", "G. path (pos)", "N. trans (pos)"]
		++ ["Tempo (s)"]
	let cabecalhoSumario = formatar $ ["Media convergencia"] 
		++ ["Media n. portas (pre)", "Media g. path (pre)", "Media n. trans (pre)"] 
		++ ["Media n. portas (pos)", "Media g. path (pos)", "Media n. trans (pos)"]
		++ ["% n. portas", "% gate", "% trans"]
	arquivoResultado <- openFile "resultado.txt" WriteMode
	setCurrentDirectory "/home/vitor/hw-verilog/C++"

	hPutStrLn arquivoResultado informacoesGerais
	hPutStrLn arquivoResultado $ linhas (length informacoesGerais)
	hPutStrLn arquivoResultado $ formatar [geracoesArg, amostrasArg]
	hPutStrLn arquivoResultado ""

	let maxGeracoes = read geracoesArg
	let amostras = read amostrasArg
	resultados <- chamarProgramaNVezes amostras maxGeracoes

	hPutStrLn arquivoResultado cabecalho
	hPutStrLn arquivoResultado $ linhas (length cabecalho)
	mapM_ 
		(\(amostra, (tempo, amostras)) -> hPutStrLn arquivoResultado $ formatar $ map show $ [amostra] ++ amostras ++ [tempo]) 
		(zip [1..] resultados)
	hPutStrLn arquivoResultado ""

	let estatisticas = calcularEstatisticas (map (map fromInteger . snd) resultados)
	hPutStrLn arquivoResultado cabecalhoSumario
	hPutStrLn arquivoResultado $ linhas (length cabecalhoSumario)
	hPutStrLn arquivoResultado $ formatar $ map formatarMaybe estatisticas
	hClose arquivoResultado

realMain _ = do
	nome <- getProgName
	putStrLn $ "uso: " ++ nome ++ " <geracoes> <amostras>"

main :: IO ()
main = getArgs >>= realMain

