import System.Process
import System.Directory
import System.Environment
import Data.List
import Data.Maybe
import Data.Time.Clock
import Control.Monad
import System.IO
import Text.PrettyPrint.Boxes

chamarPrograma :: Integer -> IO [Double]
chamarPrograma input =
	do
		output <- readProcess "C:/Users/VITOR/hw-verilog/C++/bin/hw-verilog" [show input] ""
		return (map read (words output) :: [Double])

chamarProgramaNVezes :: Integer -> Integer -> IO [[Double]]
chamarProgramaNVezes n input =
	if n == 0 then
		return []
	else
		do 
                        print n
			tempoInicial <- getCurrentTime
			listOutput <- chamarPrograma input
			tempoFinal <- getCurrentTime
			let tempoExecucao = realToFrac $ tempoFinal `diffUTCTime` tempoInicial
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

separacaoTabela :: [[Double]] -> ([[Double]], [[Double]])
separacaoTabela tabela = let
	linhasSeparadas = map separarProgressoEEstatisticas tabela
	in
		(map fst linhasSeparadas, map snd linhasSeparadas)
		
separarProgressoEEstatisticas :: [Double] -> ([Double], [Double])
separarProgressoEEstatisticas (conv:ppre:cpre:tpre:resto) = (progresso, estatisticas)
	where
		progresso = (iterate init resto) !! 4
		estatisticas = [conv,ppre,cpre,tpre] ++ (reverse . take 4 . reverse $ resto)

separarProgressoEEstatisticas _ = ([],[])

calcularEstatisticas :: [[Double]] -> [Double]
calcularEstatisticas listaAmostras = let 
	tabMedia = tabelaMedia listaAmostras
	taxaMelhoraNumPortas = (tabMedia !! 1) / (tabMedia !! 4)
	taxaMelhoraNivelGate = (tabMedia !! 2) / (tabMedia !! 5)
	taxaMelhoraNumTrans = (tabMedia !! 3) / (tabMedia !! 6)
	in
	tabMedia ++ [taxaMelhoraNumPortas, taxaMelhoraNivelGate, taxaMelhoraNumTrans]

renderTabela :: [[String]] -> String
renderTabela linhas = render $ hsep 2 left (map (vcat left . map text) (transpose linhas))

tabelaMedia :: [[Double]] -> [Double]
tabelaMedia linhas = catMaybes $ map media $ transpose linhas

cabecalhoProgresso :: Integer -> [String]
cabecalhoProgresso maxGeracoes = map (\idx -> show $ idx * (maxGeracoes `div` 10)) [0..10]

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
	setCurrentDirectory "C:/Users/VITOR/hw-verilog/C++"

	hPutStrLn arquivoResultado $ renderTabela [informacoesGerais, [geracoesArg, amostrasArg]]
	hPutStrLn arquivoResultado ""

	let maxGeracoes = read geracoesArg
	let amostras = read amostrasArg
	resultados <- chamarProgramaNVezes amostras maxGeracoes

	let (progresso, amostras) = separacaoTabela resultados
	hPutStrLn arquivoResultado $ renderTabela $ cabecalho : (map . map) show (zipWith (:) [1..] amostras)
	hPutStrLn arquivoResultado ""

	let estatisticas = calcularEstatisticas amostras
	hPutStrLn arquivoResultado $ renderTabela [cabecalhoSumario, map show estatisticas]
	hPutStrLn arquivoResultado ""
	
	hPutStrLn arquivoResultado $ renderTabela $ cabecalhoProgresso maxGeracoes : (map . map) show progresso
	hPutStrLn arquivoResultado ""
	
	hPutStrLn arquivoResultado $ renderTabela $ [cabecalhoProgresso maxGeracoes, map show $ tabelaMedia progresso]
	hPutStrLn arquivoResultado ""

	hClose arquivoResultado

realMain _ = do
	nome <- getProgName
	putStrLn $ "uso: " ++ nome ++ " <geracoes> <amostras>"

main :: IO ()
main = getArgs >>= realMain

