#! /usr/bin/env nix-shell
#! nix-shell -i runghc -p "haskellPackages.ghcWithPackages (p: with p; [text])"

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (putStrLn)
import System.Environment (getArgs)
import Data.Text
import Data.Text.IO as TextIO
import qualified Data.Map.Strict as Map hiding (singleton)
import Data.Maybe (listToMaybe)

-- Replace all these strings with chars
-- replace needle replacement haystack
searchAndReplace :: Text -> Map.Map Text Char -> Text
searchAndReplace =
  Map.foldrWithKey (\key val accum -> replace key (singleton val) accum)

main :: IO ()
main = do
  args <- getArgs
  content <-
    case listToMaybe args of
      Just arg -> TextIO.readFile arg
      Nothing  -> TextIO.getContents
  TextIO.putStrLn $ searchAndReplace content latexToUnicode

latexToUnicode :: Map.Map Text Char
latexToUnicode =
  [("\\upAlpha", 'Α')
  , ("\\upBeta", 'Β')
  , ("\\Gamma", 'Γ')
  , ("\\Delta", 'Δ')
  , ("\\upEpsilon", 'Ε')
  , ("\\upZeta", 'Ζ')
  , ("\\upEta", 'Η')
  , ("\\Theta", 'Θ')
  , ("\\upIota", 'Ι')
  , ("\\upKappa", 'Κ')
  , ("\\Lambda", 'Λ')
  , ("\\upMu", 'Μ')
  , ("\\upNu", 'Ν')
  , ("\\Xi", 'Ξ')
  , ("\\upOmicron", 'Ο')
  , ("\\Pi", 'Π')
  , ("\\upRho", 'Ρ')
  , ("\\Sigma", 'Σ')
  , ("\\upTau", 'Τ')
  , ("\\Upsilon", 'Υ')
  , ("\\Phi", 'Φ')
  , ("\\upChi", 'Χ')
  , ("\\Psi", 'Ψ')
  , ("\\Omega", 'Ω')
  , ("\\alpha", 'α')
  , ("\\beta", 'β')
  , ("\\gamma", 'γ')
  , ("\\delta", 'δ')
  , ("\\varepsilon", 'ε')
  , ("\\zeta", 'ζ')
  , ("\\eta", 'η')
  , ("\\theta", 'θ')
  , ("\\iota", 'ι')
  , ("\\kappa", 'κ')
  , ("\\lambda", 'λ')
  , ("\\mu", 'μ')
  , ("\\nu", 'ν')
  , ("\\xi", 'ξ')
  , ("\\upomicron", 'ο')
  , ("\\pi", 'π')
  , ("\\rho", 'ρ')
  , ("\\varsigma", 'ς')
  , ("\\sigma", 'σ')
  , ("\\tau", 'τ')
  , ("\\upsilon", 'υ')
  , ("\\varphi", 'φ')
  , ("\\chi", 'χ')
  , ("\\psi", 'ψ')
  , ("\\omega", 'ω')
  , ("\\varbeta", 'ϐ')
  , ("\\vartheta", 'ϑ')
  , ("\\upUpsilon", 'ϒ')
  , ("\\phi", 'ϕ')
  , ("\\varpi", 'ϖ')
  , ("\\Qoppa", 'Ϙ')
  , ("\\qoppa", 'ϙ')
  , ("\\Stigma", 'Ϛ')
  , ("\\stigma", 'ϛ')
  , ("\\Digamma", 'Ϝ')
  , ("\\digamma", 'ϝ')
  , ("\\Koppa", 'Ϟ')
  , ("\\koppa", 'ϟ')
  , ("\\Sampi", 'Ϡ')
  , ("\\sampi", 'ϡ')
  , ("\\varkappa", 'ϰ')
  , ("\\varrho", 'ϱ')
  , ("\\upvarTheta", 'ϴ')
  , ("\\epsilon", 'ϵ')
  , ("\\backepsilon", '϶'), ("\\quad", ' '), ("\\horizbar", '―')
  , ("\\leftarrow", '←')
  , ("\\uparrow", '↑')
  , ("\\rightarrow", '→')
  , ("\\downarrow", '↓')
  , ("\\leftrightarrow", '↔')
  , ("\\updownarrow", '↕')
  , ("\\nwarrow", '↖')
  , ("\\nearrow", '↗')
  , ("\\searrow", '↘')
  , ("\\swarrow", '↙')
  , ("\\nleftarrow", '↚')
  , ("\\nrightarrow", '↛')
  , ("\\leftwavearrow", '↜')
  , ("\\rightwavearrow", '↝')
  , ("\\twoheadleftarrow", '↞')
  , ("\\twoheaduparrow", '↟')
  , ("\\twoheadrightarrow", '↠')
  , ("\\twoheaddownarrow", '↡')
  , ("\\leftarrowtail", '↢')
  , ("\\rightarrowtail", '↣')
  , ("\\mapsfrom", '↤')
  , ("\\MapsUp", '↥')
  , ("\\mapsto", '↦')
  , ("\\MapsDown", '↧')
  , ("\\updownarrowbar", '↨')
  , ("\\hookleftarrow", '↩')
  , ("\\hookrightarrow", '↪')
  , ("\\looparrowleft", '↫')
  , ("\\looparrowright", '↬')
  , ("\\leftrightsquigarrow", '↭')
  , ("\\nleftrightarrow", '↮')
  , ("\\lightning", '↯')
  , ("\\carriagereturn", '↵')
  , ("\\curvearrowleft", '↶')
  , ("\\curvearrowright", '↷')
  , ("\\barovernorthwestarrow", '↸')
  , ("\\barleftarrowrightarrowba", '↹')
  , ("\\circlearrowleft", '↺')
  , ("\\circlearrowright", '↻')
  , ("\\leftharpoonup", '↼')
  , ("\\leftharpoondown", '↽')
  , ("\\upharpoonright", '↾')
  , ("\\upharpoonleft", '↿')
  , ("\\rightharpoonup", '⇀')
  , ("\\rightharpoondown", '⇁')
  , ("\\downharpoonright", '⇂')
  , ("\\downharpoonleft", '⇃')
  , ("\\rightleftarrows", '⇄')
  , ("\\updownarrows", '⇅')
  , ("\\leftrightarrows", '⇆')
  , ("\\leftleftarrows", '⇇')
  , ("\\upuparrows", '⇈')
  , ("\\rightrightarrows", '⇉')
  , ("\\downdownarrows", '⇊')
  , ("\\leftrightharpoons", '⇋')
  , ("\\rightleftharpoons", '⇌')
  , ("\\nLeftarrow", '⇍')
  , ("\\nLeftrightarrow", '⇎')
  , ("\\nRightarrow", '⇏')
  , ("\\Leftarrow", '⇐')
  , ("\\Uparrow", '⇑')
  , ("\\Rightarrow", '⇒')
  , ("\\Downarrow", '⇓')
  , ("\\Leftrightarrow", '⇔')
  , ("\\Updownarrow", '⇕')
  , ("\\Nwarrow", '⇖')
  , ("\\Nearrow", '⇗')
  , ("\\Searrow", '⇘')
  , ("\\Swarrow", '⇙')
  , ("\\Lleftarrow", '⇚')
  , ("\\Rrightarrow", '⇛')
  , ("\\leftsquigarrow", '⇜')
  , ("\\rightsquigarrow", '⇝')
  , ("\\nHuparrow", '⇞')
  , ("\\nHdownarrow", '⇟')
  , ("\\dashleftarrow", '⇠')
  , ("\\updasharrow", '⇡')
  , ("\\dashrightarrow", '⇢')
  , ("\\downdasharrow", '⇣')
  , ("\\LeftArrowBar", '⇤')
  , ("\\RightArrowBar", '⇥')
  , ("\\leftwhitearrow", '⇦')
  , ("\\upwhitearrow", '⇧')
  , ("\\rightwhitearrow", '⇨')
  , ("\\downwhitearrow", '⇩')
  , ("\\whitearrowupfrombar", '⇪'), ("\\circleonrightarrow", '⇴')
  , ("\\downuparrows", '⇵')
  , ("\\rightthreearrows", '⇶')
  , ("\\nvleftarrow", '⇷')
  , ("\\pfun", '⇸')
  , ("\\nvleftrightarrow", '⇹')
  , ("\\nVleftarrow", '⇺')
  , ("\\ffun", '⇻')
  , ("\\nVleftrightarrow", '⇼')
  , ("\\leftarrowtriangle", '⇽')
  , ("\\rightarrowtriangle", '⇾')
  , ("\\leftrightarrowtriangle", '⇿')
  , ("\\forall", '∀')
  , ("\\complement", '∁')
  , ("\\partial", '∂')
  , ("\\exists", '∃')
  , ("\\nexists", '∄')
  , ("\\varnothing", '∅')
  , ("\\increment", '∆')
  , ("\\nabla", '∇')
  , ("\\notin", '∉')
  , ("\\smallin", '∊')
  , ("\\prod", '∏')
  , ("\\coprod", '∐')
  , ("\\sum", '∑')
  , ("\\dotplus", '∔')
  , ("\\ast", '∗')
  , ("\\circ", '∘')
  , ("\\bullet", '∙')
  , ("\\vdash", '⊢')
  , ("\\dashv", '⊣')
  , ("\\top", '⊤')
  , ("\\bot", '⊥')
  , ("\\assert", '⊦')
  , ("\\models", '⊧')
  , ("\\vDash", '⊨')
  , ("\\Vdash", '⊩')
  , ("\\Vvdash", '⊪')
  , ("\\VDash", '⊫')
  , ("\\nvdash", '⊬')
  , ("\\nvDash", '⊭')
  , ("\\nVdash", '⊮')
  , ("\\nVDash", '⊯')
  , ("\\UUparrow", '⟰')
  , ("\\DDownarrow", '⟱')
  , ("\\acwgapcirclearrow", '⟲')
  , ("\\cwgapcirclearrow", '⟳')
  , ("\\rightarrowonoplus", '⟴')
  , ("\\longleftarrow", '⟵')
  , ("\\longrightarrow", '⟶')
  , ("\\longleftrightarrow", '⟷')
  , ("\\Longleftarrow", '⟸')
  , ("\\Longrightarrow", '⟹')
  , ("\\Longleftrightarrow", '⟺')
  , ("\\longmapsfrom", '⟻')
  , ("\\longmapsto", '⟼')
  , ("\\Longmapsfrom", '⟽')
  , ("\\Longmapsto", '⟾')
  , ("\\longrightsquigarrow", '⟿')
  , ("\\nVtwoheadrightarrow", '⤁')
  , ("\\nvLeftarrow", '⤂')
  , ("\\nvRightarrow", '⤃')
  , ("\\nvLeftrightarrow", '⤄')
  , ("\\twoheadmapsto", '⤅')
  , ("\\Mapsfrom", '⤆')
  , ("\\Mapsto", '⤇')
  , ("\\downarrowbarred", '⤈')
  , ("\\mathbf{B}", '𝐁')
  , ("\\mathbf{C}", '𝐂')
  , ("\\mathbf{D}", '𝐃')
  , ("\\mathbf{E}", '𝐄')
  , ("\\mathbf{F}", '𝐅')
  , ("\\mathbf{G}", '𝐆')
  , ("\\mathbf{H}", '𝐇')
  , ("\\mathbf{I}", '𝐈')
  , ("\\mathbf{J}", '𝐉')
  , ("\\mathbf{K}", '𝐊')
  , ("\\mathbf{L}", '𝐋')
  , ("\\mathbf{M}", '𝐌')
  , ("\\mathbf{N}", '𝐍')
  , ("\\mathbf{O}", '𝐎')
  , ("\\mathbf{P}", '𝐏')
  , ("\\mathbf{Q}", '𝐐')
  , ("\\mathbf{R}", '𝐑')
  , ("\\mathbf{S}", '𝐒')
  , ("\\mathbf{T}", '𝐓')
  , ("\\mathbf{U}", '𝐔')
  , ("\\mathbf{V}", '𝐕')
  , ("\\mathbf{W}", '𝐖')
  , ("\\mathbf{X}", '𝐗')
  , ("\\mathbf{Y}", '𝐘')
  , ("\\mathbf{Z}", '𝐙')
  , ("\\mathbf{a}", '𝐚')
  , ("\\mathbf{b}", '𝐛')
  , ("\\mathbf{c}", '𝐜')
  , ("\\mathbf{d}", '𝐝')
  , ("\\mathbf{e}", '𝐞')
  , ("\\mathbf{f}", '𝐟')
  , ("\\mathbf{g}", '𝐠')
  , ("\\mathbf{h}", '𝐡')
  , ("\\mathbf{i}", '𝐢')
  , ("\\mathbf{j}", '𝐣')
  , ("\\mathbf{k}", '𝐤')
  , ("\\mathbf{l}", '𝐥')
  , ("\\mathbf{m}", '𝐦')
  , ("\\mathbf{n}", '𝐧')
  , ("\\mathbf{o}", '𝐨')
  , ("\\mathbf{p}", '𝐩')
  , ("\\mathbf{q}", '𝐪')
  , ("\\mathbf{r}", '𝐫')
  , ("\\mathbf{s}", '𝐬')
  , ("\\mathbf{t}", '𝐭')
  , ("\\mathbf{u}", '𝐮')
  , ("\\mathbf{v}", '𝐯')
  , ("\\mathbf{w}", '𝐰')
  , ("\\mathbf{x}", '𝐱')
  , ("\\mathbf{y}", '𝐲')
  , ("\\mathbf{z}", '𝐳')
  , ("\\mathbfit{A}", '𝑨')
  , ("\\mathbfit{B}", '𝑩')
  , ("\\mathbfit{C}", '𝑪')
  , ("\\mathbfit{D}", '𝑫')
  , ("\\mathbfit{E}", '𝑬')
  , ("\\mathbfit{F}", '𝑭')
  , ("\\mathbfit{G}", '𝑮')
  , ("\\mathbfit{H}", '𝑯')
  , ("\\mathbfit{I}", '𝑰')
  , ("\\mathbfit{J}", '𝑱')
  , ("\\mathbfit{K}", '𝑲')
  , ("\\mathbfit{L}", '𝑳')
  , ("\\mathbfit{M}", '𝑴')
  , ("\\mathbfit{N}", '𝑵')
  , ("\\mathbfit{O}", '𝑶')
  , ("\\mathbfit{P}", '𝑷')
  , ("\\mathbfit{Q}", '𝑸')
  , ("\\mathbfit{R}", '𝑹')
  , ("\\mathbfit{S}", '𝑺')
  , ("\\mathbfit{T}", '𝑻')
  , ("\\mathbfit{U}", '𝑼')
  , ("\\mathbfit{V}", '𝑽')
  , ("\\mathbfit{W}", '𝑾')
  , ("\\mathbfit{X}", '𝑿')
  , ("\\mathbfit{Y}", '𝒀')
  , ("\\mathbfit{Z}", '𝒁')
  , ("\\mathbfit{a}", '𝒂')
  , ("\\mathbfit{b}", '𝒃')
  , ("\\mathbfit{c}", '𝒄')
  , ("\\mathbfit{d}", '𝒅')
  , ("\\mathbfit{e}", '𝒆')
  , ("\\mathbfit{f}", '𝒇')
  , ("\\mathbfit{g}", '𝒈')
  , ("\\mathbfit{h}", '𝒉')
  , ("\\mathbfit{i}", '𝒊')
  , ("\\mathbfit{j}", '𝒋')
  , ("\\mathbfit{k}", '𝒌')
  , ("\\mathbfit{l}", '𝒍')
  , ("\\mathbfit{m}", '𝒎')
  , ("\\mathbfit{n}", '𝒏')
  , ("\\mathbfit{o}", '𝒐')
  , ("\\mathbfit{p}", '𝒑')
  , ("\\mathbfit{q}", '𝒒')
  , ("\\mathbfit{r}", '𝒓')
  , ("\\mathbfit{s}", '𝒔')
  , ("\\mathbfit{t}", '𝒕')
  , ("\\mathbfit{u}", '𝒖')
  , ("\\mathbfit{v}", '𝒗')
  , ("\\mathbfit{w}", '𝒘')
  , ("\\mathbfit{x}", '𝒙')
  , ("\\mathbfit{y}", '𝒚')
  , ("\\mathbfit{z}", '𝒛')
  , ("\\mathcal{A}", '𝒜')
  , ("\\mathcal{C}", '𝒞')
  , ("\\mathcal{D}", '𝒟')
  , ("\\mathcal{G}", '𝒢')
  , ("\\mathcal{J}", '𝒥')
  , ("\\mathcal{K}", '𝒦')
  , ("\\mathcal{N}", '𝒩')
  , ("\\mathcal{O}", '𝒪')
  , ("\\mathcal{P}", '𝒫')
  , ("\\mathcal{Q}", '𝒬')
  , ("\\mathcal{S}", '𝒮')
  , ("\\mathcal{T}", '𝒯')
  , ("\\mathcal{U}", '𝒰')
  , ("\\mathcal{V}", '𝒱')
  , ("\\mathcal{W}", '𝒲')
  , ("\\mathcal{X}", '𝒳')
  , ("\\mathcal{Y}", '𝒴')
  , ("\\mathcal{Z}", '𝒵')
  , ("\\mathcal{a}", '𝒶')
  , ("\\mathcal{b}", '𝒷')
  , ("\\mathcal{c}", '𝒸')
  , ("\\mathcal{d}", '𝒹')
  , ("\\mathcal{f}", '𝒻')
  , ("\\mathcal{h}", '𝒽')
  , ("\\mathcal{i}", '𝒾')
  , ("\\mathcal{j}", '𝒿')
  , ("\\mathcal{k}", '𝓀')
  , ("\\mathcal{l}", '𝓁')
  , ("\\mathcal{m}", '𝓂')
  , ("\\mathcal{n}", '𝓃')
  , ("\\mathcal{p}", '𝓅')
  , ("\\mathcal{q}", '𝓆')
  , ("\\mathcal{r}", '𝓇')
  , ("\\mathcal{s}", '𝓈')
  , ("\\mathcal{t}", '𝓉')
  , ("\\mathcal{u}", '𝓊')
  , ("\\mathcal{v}", '𝓋')
  , ("\\mathcal{w}", '𝓌')
  , ("\\mathcal{x}", '𝓍')
  , ("\\mathcal{y}", '𝓎')
  , ("\\mathcal{z}", '𝓏')
  , ("\\mbfscrA", '𝓐')
  , ("\\mbfscrB", '𝓑')
  , ("\\mbfscrC", '𝓒')
  , ("\\mbfscrD", '𝓓')
  , ("\\mbfscrE", '𝓔')
  , ("\\mbfscrF", '𝓕')
  , ("\\mbfscrG", '𝓖')
  , ("\\mbfscrH", '𝓗')
  , ("\\mbfscrI", '𝓘')
  , ("\\mbfscrJ", '𝓙')
  , ("\\mbfscrK", '𝓚')
  , ("\\mbfscrL", '𝓛')
  , ("\\mbfscrM", '𝓜')
  , ("\\mbfscrN", '𝓝')
  , ("\\mbfscrO", '𝓞')
  , ("\\mbfscrP", '𝓟')
  , ("\\mbfscrQ", '𝓠')
  , ("\\mbfscrR", '𝓡')
  , ("\\mbfscrS", '𝓢')
  , ("\\mbfscrT", '𝓣')
  , ("\\mbfscrU", '𝓤')
  , ("\\mbfscrV", '𝓥')
  , ("\\mbfscrW", '𝓦')
  , ("\\mbfscrX", '𝓧')
  , ("\\mbfscrY", '𝓨')
  , ("\\mbfscrZ", '𝓩')
  , ("\\mbfscra", '𝓪')
  , ("\\mbfscrb", '𝓫')
  , ("\\mbfscrc", '𝓬')
  , ("\\mbfscrd", '𝓭')
  , ("\\mbfscre", '𝓮')
  , ("\\mbfscrf", '𝓯')
  , ("\\mbfscrg", '𝓰')
  , ("\\mbfscrh", '𝓱')
  , ("\\mbfscri", '𝓲')
  , ("\\mbfscrj", '𝓳')
  , ("\\mbfscrk", '𝓴')
  , ("\\mbfscrl", '𝓵')
  , ("\\mbfscrm", '𝓶')
  , ("\\mbfscrn", '𝓷')
  , ("\\mbfscro", '𝓸')
  , ("\\mbfscrp", '𝓹')
  , ("\\mbfscrq", '𝓺')
  , ("\\mbfscrr", '𝓻')
  , ("\\mbfscrs", '𝓼')
  , ("\\mbfscrt", '𝓽')
  , ("\\mbfscru", '𝓾')
  , ("\\mbfscrv", '𝓿')
  , ("\\mbfscrw", '𝔀')
  , ("\\mbfscrx", '𝔁')
  , ("\\mbfscry", '𝔂')
  , ("\\mbfscrz", '𝔃')
  , ("\\mathfrak{A}", '𝔄')
  , ("\\mathfrak{B}", '𝔅')
  , ("\\mathfrak{D}", '𝔇')
  , ("\\mathfrak{E}", '𝔈')
  , ("\\mathfrak{F}", '𝔉')
  , ("\\mathfrak{G}", '𝔊')
  , ("\\mathfrak{J}", '𝔍')
  , ("\\mathfrak{K}", '𝔎')
  , ("\\mathfrak{L}", '𝔏')
  , ("\\mathfrak{M}", '𝔐')
  , ("\\mathfrak{N}", '𝔑')
  , ("\\mathfrak{O}", '𝔒')
  , ("\\mathfrak{P}", '𝔓')
  , ("\\mathfrak{Q}", '𝔔')
  , ("\\mathfrak{S}", '𝔖')
  , ("\\mathfrak{T}", '𝔗')
  , ("\\mathfrak{U}", '𝔘')
  , ("\\mathfrak{V}", '𝔙')
  , ("\\mathfrak{W}", '𝔚')
  , ("\\mathfrak{X}", '𝔛')
  , ("\\mathfrak{Y}", '𝔜')
  , ("\\mathfrak{a}", '𝔞')
  , ("\\mathfrak{b}", '𝔟')
  , ("\\mathfrak{c}", '𝔠')
  , ("\\mathfrak{d}", '𝔡')
  , ("\\mathfrak{e}", '𝔢')
  , ("\\mathfrak{f}", '𝔣')
  , ("\\mathfrak{g}", '𝔤')
  , ("\\mathfrak{h}", '𝔥')
  , ("\\mathfrak{i}", '𝔦')
  , ("\\mathfrak{j}", '𝔧')
  , ("\\mathfrak{k}", '𝔨')
  , ("\\mathfrak{l}", '𝔩')
  , ("\\mathfrak{m}", '𝔪')
  , ("\\mathfrak{n}", '𝔫')
  , ("\\mathfrak{o}", '𝔬')
  , ("\\mathfrak{p}", '𝔭')
  , ("\\mathfrak{q}", '𝔮')
  , ("\\mathfrak{r}", '𝔯')
  , ("\\mathfrak{s}", '𝔰')
  , ("\\mathfrak{t}", '𝔱')
  , ("\\mathfrak{u}", '𝔲')
  , ("\\mathfrak{v}", '𝔳')
  , ("\\mathfrak{w}", '𝔴')
  , ("\\mathfrak{x}", '𝔵')
  , ("\\mathfrak{y}", '𝔶')
  , ("\\mathfrak{z}", '𝔷')
  , ("\\mathbb{A}", '𝔸')
  , ("\\mathbb{B}", '𝔹')
  , ("\\mathbb{D}", '𝔻')
  , ("\\mathbb{E}", '𝔼')
  , ("\\mathbb{F}", '𝔽')
  , ("\\mathbb{G}", '𝔾')
  , ("\\mathbb{I}", '𝕀')
  , ("\\mathbb{J}", '𝕁')
  , ("\\mathbb{K}", '𝕂')
  , ("\\mathbb{L}", '𝕃')
  , ("\\mathbb{M}", '𝕄')
  , ("\\mathbb{O}", '𝕆')
  , ("\\mathbb{S}", '𝕊')
  , ("\\mathbb{T}", '𝕋')
  , ("\\mathbb{U}", '𝕌')
  , ("\\mathbb{V}", '𝕍')
  , ("\\mathbb{W}", '𝕎')
  , ("\\mathbb{X}", '𝕏')
  , ("\\mathbb{Y}", '𝕐')
  , ("\\mathbb{a}", '𝕒')
  , ("\\mathbb{b}", '𝕓')
  , ("\\mathbb{c}", '𝕔')
  , ("\\mathbb{d}", '𝕕')
  , ("\\mathbb{e}", '𝕖')
  , ("\\mathbb{f}", '𝕗')
  , ("\\mathbb{g}", '𝕘')
  , ("\\mathbb{h}", '𝕙')
  , ("\\mathbb{i}", '𝕚')
  , ("\\mathbb{j}", '𝕛')
  , ("\\mathbb{k}", '𝕜')
  , ("\\mathbb{l}", '𝕝')
  , ("\\mathbb{m}", '𝕞')
  , ("\\mathbb{n}", '𝕟')
  , ("\\mathbb{o}", '𝕠')
  , ("\\mathbb{p}", '𝕡')
  , ("\\mathbb{q}", '𝕢')
  , ("\\mathbb{r}", '𝕣')
  , ("\\mathbb{s}", '𝕤')
  , ("\\mathbb{t}", '𝕥')
  , ("\\mathbb{u}", '𝕦')
  , ("\\mathbb{v}", '𝕧')
  , ("\\mathbb{w}", '𝕨')
  , ("\\mathbb{x}", '𝕩')
  , ("\\mathbb{y}", '𝕪')
  , ("\\mathbb{z}", '𝕫')
  , ("\\mbffrakA", '𝕬')
  , ("\\mbffrakB", '𝕭')
  , ("\\mbffrakC", '𝕮')
  , ("\\mbffrakD", '𝕯')
  , ("\\mbffrakE", '𝕰')
  , ("\\mbffrakF", '𝕱')
  , ("\\mbffrakG", '𝕲')
  , ("\\mbffrakH", '𝕳')
  , ("\\mbffrakI", '𝕴')
  , ("\\mbffrakJ", '𝕵')
  , ("\\mbffrakK", '𝕶')
  , ("\\mbffrakL", '𝕷')
  , ("\\mbffrakM", '𝕸')
  , ("\\mbffrakN", '𝕹')
  , ("\\mbffrakO", '𝕺')
  , ("\\mbffrakP", '𝕻')
  , ("\\mbffrakQ", '𝕼')
  , ("\\mbffrakR", '𝕽')
  , ("\\mbffrakS", '𝕾')
  , ("\\mbffrakT", '𝕿')
  , ("\\mbffrakU", '𝖀')
  , ("\\mbffrakV", '𝖁')
  , ("\\mbffrakW", '𝖂')
  , ("\\mbffrakX", '𝖃')
  , ("\\mbffrakY", '𝖄')
  , ("\\mbffrakZ", '𝖅')
  , ("\\mbffraka", '𝖆')
  , ("\\mbffrakb", '𝖇')
  , ("\\mbffrakc", '𝖈')
  , ("\\mbffrakd", '𝖉')
  , ("\\mbffrake", '𝖊')
  , ("\\mbffrakf", '𝖋')
  , ("\\mbffrakg", '𝖌')
  , ("\\mbffrakh", '𝖍')
  , ("\\mbffraki", '𝖎')
  , ("\\mbffrakj", '𝖏')
  , ("\\mbffrakk", '𝖐')
  , ("\\mbffrakl", '𝖑')
  , ("\\mbffrakm", '𝖒')
  , ("\\mbffrakn", '𝖓')
  , ("\\mbffrako", '𝖔')
  , ("\\mbffrakp", '𝖕')
  , ("\\mbffrakq", '𝖖')
  , ("\\mbffrakr", '𝖗')
  , ("\\mbffraks", '𝖘')
  , ("\\mbffrakt", '𝖙')
  , ("\\mbffraku", '𝖚')
  , ("\\mbffrakv", '𝖛')
  , ("\\mbffrakw", '𝖜')
  , ("\\mbffrakx", '𝖝')
  , ("\\mbffraky", '𝖞')
  , ("\\mbffrakz", '𝖟')
  , ("\\mathsf{A}", '𝖠')
  , ("\\mathsf{B}", '𝖡')
  , ("\\mathsf{C}", '𝖢')
  , ("\\mathsf{D}", '𝖣')
  , ("\\mathsf{E}", '𝖤')
  , ("\\mathsf{F}", '𝖥')
  , ("\\mathsf{G}", '𝖦')
  , ("\\mathsf{H}", '𝖧')
  , ("\\mathsf{I}", '𝖨')
  , ("\\mathsf{J}", '𝖩')
  , ("\\mathsf{K}", '𝖪')
  , ("\\mathsf{L}", '𝖫')
  , ("\\mathsf{M}", '𝖬')
  , ("\\mathsf{N}", '𝖭')
  , ("\\mathsf{O}", '𝖮')
  , ("\\mathsf{P}", '𝖯')
  , ("\\mathsf{Q}", '𝖰')
  , ("\\mathsf{R}", '𝖱')
  , ("\\mathsf{S}", '𝖲')
  , ("\\mathsf{T}", '𝖳')
  , ("\\mathsf{U}", '𝖴')
  , ("\\mathsf{V}", '𝖵')
  , ("\\mathsf{W}", '𝖶')
  , ("\\mathsf{X}", '𝖷')
  , ("\\mathsf{Y}", '𝖸')
  , ("\\mathsf{Z}", '𝖹')
  , ("\\mathsf{a}", '𝖺')
  , ("\\mathsf{b}", '𝖻')
  , ("\\mathsf{c}", '𝖼')
  , ("\\mathsf{d}", '𝖽')
  , ("\\mathsf{e}", '𝖾')
  , ("\\mathsf{f}", '𝖿')
  , ("\\mathsf{g}", '𝗀')
  , ("\\mathsf{h}", '𝗁')
  , ("\\mathsf{i}", '𝗂')
  , ("\\mathsf{j}", '𝗃')
  , ("\\mathsf{k}", '𝗄')
  , ("\\mathsf{l}", '𝗅')
  , ("\\mathsf{m}", '𝗆')
  , ("\\mathsf{n}", '𝗇')
  , ("\\mathsf{o}", '𝗈')
  , ("\\mathsf{p}", '𝗉')
  , ("\\mathsf{q}", '𝗊')
  , ("\\mathsf{r}", '𝗋')
  , ("\\mathsf{s}", '𝗌')
  , ("\\mathsf{t}", '𝗍')
  , ("\\mathsf{u}", '𝗎')
  , ("\\mathsf{v}", '𝗏')
  , ("\\mathsf{w}", '𝗐')
  , ("\\mathsf{x}", '𝗑')
  , ("\\mathsf{y}", '𝗒')
  , ("\\mathsf{z}", '𝗓')
  , ("\\mathsfbf{A}", '𝗔')
  , ("\\mathsfbf{B}", '𝗕')
  , ("\\mathsfbf{C}", '𝗖')
  , ("\\mathsfbf{D}", '𝗗')
  , ("\\mathsfbf{E}", '𝗘')
  , ("\\mathsfbf{F}", '𝗙')
  , ("\\mathsfbf{G}", '𝗚')
  , ("\\mathsfbf{H}", '𝗛')
  , ("\\mathsfbf{I}", '𝗜')
  , ("\\mathsfbf{J}", '𝗝')
  , ("\\mathsfbf{K}", '𝗞')
  , ("\\mathsfbf{L}", '𝗟')
  , ("\\mathsfbf{M}", '𝗠')
  , ("\\mathsfbf{N}", '𝗡')
  , ("\\mathsfbf{O}", '𝗢')
  , ("\\mathsfbf{P}", '𝗣')
  , ("\\mathsfbf{Q}", '𝗤')
  , ("\\mathsfbf{R}", '𝗥')
  , ("\\mathsfbf{S}", '𝗦')
  , ("\\mathsfbf{T}", '𝗧')
  , ("\\mathsfbf{U}", '𝗨')
  , ("\\mathsfbf{V}", '𝗩')
  , ("\\mathsfbf{W}", '𝗪')
  , ("\\mathsfbf{X}", '𝗫')
  , ("\\mathsfbf{Y}", '𝗬')
  , ("\\mathsfbf{Z}", '𝗭')
  , ("\\mathsfbf{a}", '𝗮')
  , ("\\mathsfbf{b}", '𝗯')
  , ("\\mathsfbf{c}", '𝗰')
  , ("\\mathsfbf{d}", '𝗱')
  , ("\\mathsfbf{e}", '𝗲')
  , ("\\mathsfbf{f}", '𝗳')
  , ("\\mathsfbf{g}", '𝗴')
  , ("\\mathsfbf{h}", '𝗵')
  , ("\\mathsfbf{i}", '𝗶')
  , ("\\mathsfbf{j}", '𝗷')
  , ("\\mathsfbf{k}", '𝗸')
  , ("\\mathsfbf{l}", '𝗹')
  , ("\\mathsfbf{m}", '𝗺')
  , ("\\mathsfbf{n}", '𝗻')
  , ("\\mathsfbf{o}", '𝗼')
  , ("\\mathsfbf{p}", '𝗽')
  , ("\\mathsfbf{q}", '𝗾')
  , ("\\mathsfbf{r}", '𝗿')
  , ("\\mathsfbf{s}", '𝘀')
  , ("\\mathsfbf{t}", '𝘁')
  , ("\\mathsfbf{u}", '𝘂')
  , ("\\mathsfbf{v}", '𝘃')
  , ("\\mathsfbf{w}", '𝘄')
  , ("\\mathsfbf{x}", '𝘅')
  , ("\\mathsfbf{y}", '𝘆')
  , ("\\mathsfbf{z}", '𝘇')
  , ("\\mathsfit{A}", '𝘈')
  , ("\\mathsfit{B}", '𝘉')
  , ("\\mathsfit{C}", '𝘊')
  , ("\\mathsfit{D}", '𝘋')
  , ("\\mathsfit{E}", '𝘌')
  , ("\\mathsfit{F}", '𝘍')
  , ("\\mathsfit{G}", '𝘎')
  , ("\\mathsfit{H}", '𝘏')
  , ("\\mathsfit{I}", '𝘐')
  , ("\\mathsfit{J}", '𝘑')
  , ("\\mathsfit{K}", '𝘒')
  , ("\\mathsfit{L}", '𝘓')
  , ("\\mathsfit{M}", '𝘔')
  , ("\\mathsfit{N}", '𝘕')
  , ("\\mathsfit{O}", '𝘖')
  , ("\\mathsfit{P}", '𝘗')
  , ("\\mathsfit{Q}", '𝘘')
  , ("\\mathsfit{R}", '𝘙')
  , ("\\mathsfit{S}", '𝘚')
  , ("\\mathsfit{T}", '𝘛')
  , ("\\mathsfit{U}", '𝘜')
  , ("\\mathsfit{V}", '𝘝')
  , ("\\mathsfit{W}", '𝘞')
  , ("\\mathsfit{X}", '𝘟')
  , ("\\mathsfit{Y}", '𝘠')
  , ("\\mathsfit{Z}", '𝘡')
  , ("\\mathsfit{a}", '𝘢')
  , ("\\mathsfit{b}", '𝘣')
  , ("\\mathsfit{c}", '𝘤')
  , ("\\mathsfit{d}", '𝘥')
  , ("\\mathsfit{e}", '𝘦')
  , ("\\mathsfit{f}", '𝘧')
  , ("\\mathsfit{g}", '𝘨')
  , ("\\mathsfit{h}", '𝘩')
  , ("\\mathsfit{i}", '𝘪')
  , ("\\mathsfit{j}", '𝘫')
  , ("\\mathsfit{k}", '𝘬')
  , ("\\mathsfit{l}", '𝘭')
  , ("\\mathsfit{m}", '𝘮')
  , ("\\mathsfit{n}", '𝘯')
  , ("\\mathsfit{o}", '𝘰')
  , ("\\mathsfit{p}", '𝘱')
  , ("\\mathsfit{q}", '𝘲')
  , ("\\mathsfit{r}", '𝘳')
  , ("\\mathsfit{s}", '𝘴')
  , ("\\mathsfit{t}", '𝘵')
  , ("\\mathsfit{u}", '𝘶')
  , ("\\mathsfit{v}", '𝘷')
  , ("\\mathsfit{w}", '𝘸')
  , ("\\mathsfit{x}", '𝘹')
  , ("\\mathsfit{y}", '𝘺')
  , ("\\mathsfit{z}", '𝘻')
  , ("\\mathsfbfit{A}", '𝘼')
  , ("\\mathsfbfit{B}", '𝘽')
  , ("\\mathsfbfit{C}", '𝘾')
  , ("\\mathsfbfit{D}", '𝘿')
  , ("\\mathsfbfit{E}", '𝙀')
  , ("\\mathsfbfit{F}", '𝙁')
  , ("\\mathsfbfit{G}", '𝙂')
  , ("\\mathsfbfit{H}", '𝙃')
  , ("\\mathsfbfit{I}", '𝙄')
  , ("\\mathsfbfit{J}", '𝙅')
  , ("\\mathsfbfit{K}", '𝙆')
  , ("\\mathsfbfit{L}", '𝙇')
  , ("\\mathsfbfit{M}", '𝙈')
  , ("\\mathsfbfit{N}", '𝙉')
  , ("\\mathsfbfit{O}", '𝙊')
  , ("\\mathsfbfit{P}", '𝙋')
  , ("\\mathsfbfit{Q}", '𝙌')
  , ("\\mathsfbfit{R}", '𝙍')
  , ("\\mathsfbfit{S}", '𝙎')
  , ("\\mathsfbfit{T}", '𝙏')
  , ("\\mathsfbfit{U}", '𝙐')
  , ("\\mathsfbfit{V}", '𝙑')
  , ("\\mathsfbfit{W}", '𝙒')
  , ("\\mathsfbfit{X}", '𝙓')
  , ("\\mathsfbfit{Y}", '𝙔')
  , ("\\mathsfbfit{Z}", '𝙕')
  , ("\\mathsfbfit{a}", '𝙖')
  , ("\\mathsfbfit{b}", '𝙗')
  , ("\\mathsfbfit{c}", '𝙘')
  , ("\\mathsfbfit{d}", '𝙙')
  , ("\\mathsfbfit{e}", '𝙚')
  , ("\\mathsfbfit{f}", '𝙛')
  , ("\\mathsfbfit{g}", '𝙜')
  , ("\\mathsfbfit{h}", '𝙝')
  , ("\\mathsfbfit{i}", '𝙞')
  , ("\\mathsfbfit{j}", '𝙟')
  , ("\\mathsfbfit{k}", '𝙠')
  , ("\\mathsfbfit{l}", '𝙡')
  , ("\\mathsfbfit{m}", '𝙢')
  , ("\\mathsfbfit{n}", '𝙣')
  , ("\\mathsfbfit{o}", '𝙤')
  , ("\\mathsfbfit{p}", '𝙥')
  , ("\\mathsfbfit{q}", '𝙦')
  , ("\\mathsfbfit{r}", '𝙧')
  , ("\\mathsfbfit{s}", '𝙨')
  , ("\\mathsfbfit{t}", '𝙩')
  , ("\\mathsfbfit{u}", '𝙪')
  , ("\\mathsfbfit{v}", '𝙫')
  , ("\\mathsfbfit{w}", '𝙬')
  , ("\\mathsfbfit{x}", '𝙭')
  , ("\\mathsfbfit{y}", '𝙮')
  , ("\\mathsfbfit{z}", '𝙯')
  , ("\\mathtt{A}", '𝙰')
  , ("\\mathtt{B}", '𝙱')
  , ("\\mathtt{C}", '𝙲')
  , ("\\mathtt{D}", '𝙳')
  , ("\\mathtt{E}", '𝙴')
  , ("\\mathtt{F}", '𝙵')
  , ("\\mathtt{G}", '𝙶')
  , ("\\mathtt{H}", '𝙷')
  , ("\\mathtt{I}", '𝙸')
  , ("\\mathtt{J}", '𝙹')
  , ("\\mathtt{K}", '𝙺')
  , ("\\mathtt{L}", '𝙻')
  , ("\\mathtt{M}", '𝙼')
  , ("\\mathtt{N}", '𝙽')
  , ("\\mathtt{O}", '𝙾')
  , ("\\mathtt{P}", '𝙿')
  , ("\\mathtt{Q}", '𝚀')
  , ("\\mathtt{R}", '𝚁')
  , ("\\mathtt{S}", '𝚂')
  , ("\\mathtt{T}", '𝚃')
  , ("\\mathtt{U}", '𝚄')
  , ("\\mathtt{V}", '𝚅')
  , ("\\mathtt{W}", '𝚆')
  , ("\\mathtt{X}", '𝚇')
  , ("\\mathtt{Y}", '𝚈')
  , ("\\mathtt{Z}", '𝚉')
  , ("\\mathtt{a}", '𝚊')
  , ("\\mathtt{b}", '𝚋')
  , ("\\mathtt{c}", '𝚌')
  , ("\\mathtt{d}", '𝚍')
  , ("\\mathtt{e}", '𝚎')
  , ("\\mathtt{f}", '𝚏')
  , ("\\mathtt{g}", '𝚐')
  , ("\\mathtt{h}", '𝚑')
  , ("\\mathtt{i}", '𝚒')
  , ("\\mathtt{j}", '𝚓')
  , ("\\mathtt{k}", '𝚔')
  , ("\\mathtt{l}", '𝚕')
  , ("\\mathtt{m}", '𝚖')
  , ("\\mathtt{n}", '𝚗')
  , ("\\mathtt{o}", '𝚘')
  , ("\\mathtt{p}", '𝚙')
  , ("\\mathtt{q}", '𝚚')
  , ("\\mathtt{r}", '𝚛')
  , ("\\mathtt{s}", '𝚜')
  , ("\\mathtt{t}", '𝚝')
  , ("\\mathtt{u}", '𝚞')
  , ("\\mathtt{v}", '𝚟')
  , ("\\mathtt{w}", '𝚠')
  , ("\\mathtt{x}", '𝚡')
  , ("\\mathtt{y}", '𝚢')
  , ("\\mathtt{z}", '𝚣')
  , ("\\imath", '𝚤')
  , ("\\jmath", '𝚥')
  , ("\\mbfAlpha", '𝚨')
  , ("\\mbfBeta", '𝚩')
  , ("\\mathbf{\\Gamma}", '𝚪')
  , ("\\mathbf{\\Delta}", '𝚫')
  , ("\\mbfEpsilon", '𝚬')
  , ("\\mbfZeta", '𝚭')
  , ("\\mbfEta", '𝚮')
  , ("\\mathbf{\\Theta}", '𝚯')
  , ("\\mbfIota", '𝚰')
  , ("\\mbfKappa", '𝚱')
  , ("\\mathbf{\\Lambda}", '𝚲')
  , ("\\mbfMu", '𝚳')
  , ("\\mbfNu", '𝚴')
  , ("\\mathbf{\\Xi}", '𝚵')
  , ("\\mbfOmicron", '𝚶')
  , ("\\mathbf{\\Pi}", '𝚷')
  , ("\\mbfRho", '𝚸')
  , ("\\mbfvarTheta", '𝚹')
  , ("\\mathbf{\\Sigma}", '𝚺')
  , ("\\mbfTau", '𝚻')
  , ("\\mathbf{\\Upsilon}", '𝚼')
  , ("\\mathbf{\\Phi}", '𝚽')
  , ("\\mbfChi", '𝚾')
  , ("\\mathbf{\\Psi}", '𝚿')
  , ("\\mathbf{\\Omega}", '𝛀')
  , ("\\mbfnabla", '𝛁')
  , ("\\mathbf{\\alpha}", '𝛂')
  , ("\\mathbf{\\beta}", '𝛃')
  , ("\\mathbf{\\gamma}", '𝛄')
  , ("\\mathbf{\\delta}", '𝛅')
  , ("\\mathbf{\\varepsilon}", '𝛆')
  , ("\\mathbf{\\zeta}", '𝛇')
  , ("\\mathbf{\\eta}", '𝛈')
  , ("\\mathbf{\\theta}", '𝛉')
  , ("\\mathbf{\\iota}", '𝛊')
  , ("\\mathbf{\\kappa}", '𝛋')
  , ("\\mathbf{\\lambda}", '𝛌')
  , ("\\mathbf{\\mu}", '𝛍')
  , ("\\mathbf{\\nu}", '𝛎')
  , ("\\mathbf{\\xi}", '𝛏')
  , ("\\mbfomicron", '𝛐')
  , ("\\mathbf{\\pi}", '𝛑')
  , ("\\mathbf{\\rho}", '𝛒')
  , ("\\mathbf{\\varsigma}", '𝛓')
  , ("\\mathbf{\\sigma}", '𝛔')
  , ("\\mathbf{\\tau}", '𝛕')
  , ("\\mathbf{\\upsilon}", '𝛖')
  , ("\\mathbf{\\varphi}", '𝛗')
  , ("\\mathbf{\\chi}", '𝛘')
  , ("\\mathbf{\\psi}", '𝛙')
  , ("\\mathbf{\\omega}", '𝛚')
  , ("\\mbfpartial", '𝛛')
  , ("\\mathbf{\\epsilon}", '𝛜')
  , ("\\mathbf{\\vartheta}", '𝛝')
  , ("\\mbfvarkappa", '𝛞')
  , ("\\mathbf{\\phi}", '𝛟')
  , ("\\mathbf{\\varrho}", '𝛠')
  , ("\\mathbf{\\varpi}", '𝛡')
  , ("\\mbfitAlpha", '𝜜')
  , ("\\mbfitBeta", '𝜝')
  , ("\\mathbfit{\\Gamma}", '𝜞')
  , ("\\mathbfit{\\Delta}", '𝜟')
  , ("\\mbfitEpsilon", '𝜠')
  , ("\\mbfitZeta", '𝜡')
  , ("\\mbfitEta", '𝜢')
  , ("\\mathbfit{\\Theta}", '𝜣')
  , ("\\mbfitIota", '𝜤')
  , ("\\mbfitKappa", '𝜥')
  , ("\\mathbfit{\\Lambda}", '𝜦')
  , ("\\mbfitMu", '𝜧')
  , ("\\mbfitNu", '𝜨')
  , ("\\mathbfit{\\Xi}", '𝜩')
  , ("\\mbfitOmicron", '𝜪')
  , ("\\mathbfit{\\Pi}", '𝜫')
  , ("\\mbfitRho", '𝜬')
  , ("\\mbfitvarTheta", '𝜭')
  , ("\\mathbfit{\\Sigma}", '𝜮')
  , ("\\mbfitTau", '𝜯')
  , ("\\mathbfit{\\Upsilon}", '𝜰')
  , ("\\mathbfit{\\Phi}", '𝜱')
  , ("\\mbfitChi", '𝜲')
  , ("\\mathbfit{\\Psi}", '𝜳')
  , ("\\mathbfit{\\Omega}", '𝜴')
  , ("\\mbfitnabla", '𝜵')
  , ("\\mathbfit{\\alpha}", '𝜶')
  , ("\\mathbfit{\\beta}", '𝜷')
  , ("\\mathbfit{\\gamma}", '𝜸')
  , ("\\mathbfit{\\delta}", '𝜹')
  , ("\\mathbfit{\\varepsilon}", '𝜺')
  , ("\\mathbfit{\\zeta}", '𝜻')
  , ("\\mathbfit{\\eta}", '𝜼')
  , ("\\mathbfit{\\theta}", '𝜽')
  , ("\\mathbfit{\\iota}", '𝜾')
  , ("\\mathbfit{\\kappa}", '𝜿')
  , ("\\mathbfit{\\lambda}", '𝝀')
  , ("\\mathbfit{\\mu}", '𝝁')
  , ("\\mathbfit{\\nu}", '𝝂')
  , ("\\mathbfit{\\xi}", '𝝃')
  , ("\\mbfitomicron", '𝝄')
  , ("\\mathbfit{\\pi}", '𝝅')
  , ("\\mathbfit{\\rho}", '𝝆')
  , ("\\mathbfit{\\varsigma}", '𝝇')
  , ("\\mathbfit{\\sigma}", '𝝈')
  , ("\\mathbfit{\\tau}", '𝝉')
  , ("\\mathbfit{\\upsilon}", '𝝊')
  , ("\\mathbfit{\\varphi}", '𝝋')
  , ("\\mathbfit{\\chi}", '𝝌')
  , ("\\mathbfit{\\psi}", '𝝍')
  , ("\\mathbfit{\\omega}", '𝝎')
  , ("\\mbfitpartial", '𝝏')
  , ("\\mathbfit{\\epsilon}", '𝝐')
  , ("\\mathbfit{\\vartheta}", '𝝑')
  , ("\\mbfitvarkappa", '𝝒')
  , ("\\mathbfit{\\phi}", '𝝓')
  , ("\\mathbfit{\\varrho}", '𝝔')
  , ("\\mathbfit{\\varpi}", '𝝕')
  , ("\\mbfsansAlpha", '𝝖')
  , ("\\mbfsansBeta", '𝝗')
  , ("\\mathsfbf{\\Gamma}", '𝝘')
  , ("\\mathsfbf{\\Delta}", '𝝙')
  , ("\\mbfsansEpsilon", '𝝚')
  , ("\\mbfsansZeta", '𝝛')
  , ("\\mbfsansEta", '𝝜')
  , ("\\mathsfbf{\\Theta}", '𝝝')
  , ("\\mbfsansIota", '𝝞')
  , ("\\mbfsansKappa", '𝝟')
  , ("\\mathsfbf{\\Lambda}", '𝝠')
  , ("\\mbfsansMu", '𝝡')
  , ("\\mbfsansNu", '𝝢')
  , ("\\mathsfbf{\\Xi}", '𝝣')
  , ("\\mbfsansOmicron", '𝝤')
  , ("\\mathsfbf{\\Pi}", '𝝥')
  , ("\\mbfsansRho", '𝝦')
  , ("\\mbfsansvarTheta", '𝝧')
  , ("\\mathsfbf{\\Sigma}", '𝝨')
  , ("\\mbfsansTau", '𝝩')
  , ("\\mathsfbf{\\Upsilon}", '𝝪')
  , ("\\mathsfbf{\\Phi}", '𝝫')
  , ("\\mbfsansChi", '𝝬')
  , ("\\mathsfbf{\\Psi}", '𝝭')
  , ("\\mathsfbf{\\Omega}", '𝝮')
  , ("\\mbfsansnabla", '𝝯')
  , ("\\mathsfbf{\\alpha}", '𝝰')
  , ("\\mathsfbf{\\beta}", '𝝱')
  , ("\\mathsfbf{\\gamma}", '𝝲')
  , ("\\mathsfbf{\\delta}", '𝝳')
  , ("\\mathsfbf{\\varepsilon}", '𝝴')
  , ("\\mathsfbf{\\zeta}", '𝝵')
  , ("\\mathsfbf{\\eta}", '𝝶')
  , ("\\mathsfbf{\\theta}", '𝝷')
  , ("\\mathsfbf{\\iota}", '𝝸')
  , ("\\mathsfbf{\\kappa}", '𝝹')
  , ("\\mathsfbf{\\lambda}", '𝝺')
  , ("\\mathsfbf{\\mu}", '𝝻')
  , ("\\mathsfbf{\\nu}", '𝝼')
  , ("\\mathsfbf{\\xi}", '𝝽')
  , ("\\mbfsansomicron", '𝝾')
  , ("\\mathsfbf{\\pi}", '𝝿')
  , ("\\mathsfbf{\\rho}", '𝞀')
  , ("\\mathsfbf{\\varsigma}", '𝞁')
  , ("\\mathsfbf{\\sigma}", '𝞂')
  , ("\\mathsfbf{\\tau}", '𝞃')
  , ("\\mathsfbf{\\upsilon}", '𝞄')
  , ("\\mathsfbf{\\varphi}", '𝞅')
  , ("\\mathsfbf{\\chi}", '𝞆')
  , ("\\mathsfbf{\\psi}", '𝞇')
  , ("\\mathsfbf{\\omega}", '𝞈')
  , ("\\mbfsanspartial", '𝞉')
  , ("\\mathsfbf{\\epsilon}", '𝞊')
  , ("\\mathsfbf{\\vartheta}", '𝞋')
  , ("\\mbfsansvarkappa", '𝞌')
  , ("\\mathsfbf{\\phi}", '𝞍')
  , ("\\mathsfbf{\\varrho}", '𝞎')
  , ("\\mathsfbf{\\varpi}", '𝞏')
  , ("\\mbfitsansAlpha", '𝞐')
  , ("\\mbfitsansBeta", '𝞑')
  , ("\\mathsfbfit{\\Gamma}", '𝞒')
  , ("\\mathsfbfit{\\Delta}", '𝞓')
  , ("\\mbfitsansEpsilon", '𝞔')
  , ("\\mbfitsansZeta", '𝞕')
  , ("\\mbfitsansEta", '𝞖')
  , ("\\mathsfbfit{\\Theta}", '𝞗')
  , ("\\mbfitsansIota", '𝞘')
  , ("\\mbfitsansKappa", '𝞙')
  , ("\\mathsfbfit{\\Lambda}", '𝞚')
  , ("\\mbfitsansMu", '𝞛')
  , ("\\mbfitsansNu", '𝞜')
  , ("\\mathsfbfit{\\Xi}", '𝞝')
  , ("\\mbfitsansOmicron", '𝞞')
  , ("\\mathsfbfit{\\Pi}", '𝞟')
  , ("\\mbfitsansRho", '𝞠')
  , ("\\mbfitsansvarTheta", '𝞡')
  , ("\\mathsfbfit{\\Sigma}", '𝞢')
  , ("\\mbfitsansTau", '𝞣')
  , ("\\mathsfbfit{\\Upsilon}", '𝞤')
  , ("\\mathsfbfit{\\Phi}", '𝞥')
  , ("\\mbfitsansChi", '𝞦')
  , ("\\mathsfbfit{\\Psi}", '𝞧')
  , ("\\mathsfbfit{\\Omega}", '𝞨')
  , ("\\mbfitsansnabla", '𝞩')
  , ("\\mathsfbfit{\\alpha}", '𝞪')
  , ("\\mathsfbfit{\\beta}", '𝞫')
  , ("\\mathsfbfit{\\gamma}", '𝞬')
  , ("\\mathsfbfit{\\delta}", '𝞭')
  , ("\\mathsfbfit{\\varepsilon}", '𝞮')
  , ("\\mathsfbfit{\\zeta}", '𝞯')
  , ("\\mathsfbfit{\\eta}", '𝞰')
  , ("\\mathsfbfit{\\theta}", '𝞱')
  , ("\\mathsfbfit{\\iota}", '𝞲')
  , ("\\mathsfbfit{\\kappa}", '𝞳')
  , ("\\mathsfbfit{\\lambda}", '𝞴')
  , ("\\mathsfbfit{\\mu}", '𝞵')
  , ("\\mathsfbfit{\\nu}", '𝞶')
  , ("\\mathsfbfit{\\xi}", '𝞷')
  , ("\\mbfitsansomicron", '𝞸')
  , ("\\mathsfbfit{\\pi}", '𝞹')
  , ("\\mathsfbfit{\\rho}", '𝞺')
  , ("\\mathsfbfit{\\varsigma}", '𝞻')
  , ("\\mathsfbfit{\\sigma}", '𝞼')
  , ("\\mathsfbfit{\\tau}", '𝞽')
  , ("\\mathsfbfit{\\upsilon}", '𝞾')
  , ("\\mathsfbfit{\\varphi}", '𝞿')
  , ("\\mathsfbfit{\\chi}", '𝟀')
  , ("\\mathsfbfit{\\psi}", '𝟁')
  , ("\\mathsfbfit{\\omega}", '𝟂')
  , ("\\mbfitsanspartial", '𝟃')
  , ("\\mathsfbfit{\\epsilon}", '𝟄')
  , ("\\mathsfbfit{\\vartheta}", '𝟅')
  , ("\\mbfitsansvarkappa", '𝟆')
  , ("\\mathsfbfit{\\phi}", '𝟇')
  , ("\\mathsfbfit{\\varrho}", '𝟈')
  , ("\\mathsfbfit{\\varpi}", '𝟉')
  , ("\\mbfDigamma", '𝟊')
  , ("\\mbfdigamma", '𝟋')
  , ("\\mathbf{0}", '𝟎')
  , ("\\mathbf{1}", '𝟏')
  , ("\\mathbf{2}", '𝟐')
  , ("\\mathbf{3}", '𝟑')
  , ("\\mathbf{4}", '𝟒')
  , ("\\mathbf{5}", '𝟓')
  , ("\\mathbf{6}", '𝟔')
  , ("\\mathbf{7}", '𝟕')
  , ("\\mathbf{8}", '𝟖')
  , ("\\mathbf{9}", '𝟗')
  , ("\\mathbb{0}", '𝟘')
  , ("\\mathbb{1}", '𝟙')
  , ("\\mathbb{2}", '𝟚')
  , ("\\mathbb{3}", '𝟛')
  , ("\\mathbb{4}", '𝟜')
  , ("\\mathbb{5}", '𝟝')
  , ("\\mathbb{6}", '𝟞')
  , ("\\mathbb{7}", '𝟟')
  , ("\\mathbb{8}", '𝟠')
  , ("\\mathbb{9}", '𝟡')
  , ("\\mathsf{0}", '𝟢')
  , ("\\mathsf{1}", '𝟣')
  , ("\\mathsf{2}", '𝟤')
  , ("\\mathsf{3}", '𝟥')
  , ("\\mathsf{4}", '𝟦')
  , ("\\mathsf{5}", '𝟧')
  , ("\\mathsf{6}", '𝟨')
  , ("\\mathsf{7}", '𝟩')
  , ("\\mathsf{8}", '𝟪')
  , ("\\mathsf{9}", '𝟫')
  , ("\\mathsfbf{0}", '𝟬')
  , ("\\mathsfbf{1}", '𝟭')
  , ("\\mathsfbf{2}", '𝟮')
  , ("\\mathsfbf{3}", '𝟯')
  , ("\\mathsfbf{4}", '𝟰')
  , ("\\mathsfbf{5}", '𝟱')
  , ("\\mathsfbf{6}", '𝟲')
  , ("\\mathsfbf{7}", '𝟳')
  , ("\\mathsfbf{8}", '𝟴')
  , ("\\mathsfbf{9}", '𝟵')
  , ("\\mathtt{0}", '𝟶')
  , ("\\mathtt{1}", '𝟷')
  , ("\\mathtt{2}", '𝟸')
  , ("\\mathtt{3}", '𝟹')
  , ("\\mathtt{4}", '𝟺')
  , ("\\mathtt{5}", '𝟻')
  , ("\\mathtt{6}", '𝟼')
  , ("\\mathtt{7}", '𝟽')
  , ("\\mathtt{8}", '𝟾')
  , ("\\mathtt{9}", '𝟿')
  ]
