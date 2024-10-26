# （非官方）國科會專題計劃 ＣＭ03 的 LaTeX 文件格式

## 範例

* LaTex 編譯結果 [proposal.pdf](https://github.com/user-attachments/files/17530096/proposal.pdf)

* XeLaTex 編譯結果 [proposal-xetex.pdf](https://github.com/user-attachments/files/17530101/proposal-xetex.pdf)

* LaTeX + `libertine` 編譯結果 [proposal-libertine.pdf](https://github.com/user-attachments/files/17530100/proposal-libertine.pdf)

* XeLaTeX + `libertine` 編譯結果
[proposal-libertine-xetex.pdf](https://github.com/user-attachments/files/17530099/proposal-libertine-xetex.pdf)
## 使用方式

1. 文件格式改為 `cm03` 亦即 `\documentclass{cm03}`。
2. 可用 XeTeX 或 LaTeX （實驗中）編譯。

## 範本
```latex
\documentclass{cm03}
\begin{document}

\section{研究計畫之背景}{請詳述本研究計畫所要探討或解決的問題、研究原創性、重要性、預期影響性及國內外有關本計畫之研究情況、重要參考文獻之評述等。如為連續性計畫應說明上年度研究進度。}

\section{研究方法、進行步驟及執行進度}{請分年列述：1.本計畫採用之研究方法與原因及其創新性。2.預計可能遭遇之困難及解決途徑。3.重要儀器之配合使用情形。4.如為須赴國外或大陸地區研究，請詳述其必要性以及預期效益等。}

\section{預期完成之工作項目及成果}{請分年列述：1.預期完成之工作項目。2.對於參與之工作人員，預期可獲之訓練。3.預期完成之研究成果（如實務應用績效、期刊論文、研討會論文、專書、技術報告、專利或技術移轉等質與量之預期成果）。4.學術研究、國家發展及其他應用方面預期之貢獻。}

\section{整合型研究計畫說明}{如為整合型研究計畫請就以上各點分別說明與其他子計畫之相關性。}

\end{document}
```

## 基本設定

中文字型：標楷體

英文字型： 使用近似 New Times Roman 的 TeXGyre Termes （套件[連結](https://ctan.org/pkg/newtx?lang=en)）

## 預載套件

* 共通套件：`babel`, `geometry`, `iftex`, `xifthen`, `amsmath`, `amsthm`, `setspace`, `zhnumber`, `titlesec`, `lastpage`, `fancyhdr`, `natbib`, `hyperref`, `doi`, `enumitem`
* 用 LaTeX 編譯時額外載入 `CJKutf8`
* 用 XeTeX 編譯時額外載入 `fontspec`, `unicode-math`

若需要對預載套件設定選項， 可在 `\documentclass{cm03}` 之前用指令 `\PassOptionsToPackage{<選項>}{<套件名稱>}` 傳入。

## 選項

* `libertine`: 英文字型改用 Libertine 字型（[連結](https://ctan.org/pkg/libertine)）
* `kaiti`: 中文字型改用 macOS 內建的「楷體-繁」