# （非官方）國科會專題計劃中文 CM03 的 LaTeX 文件格式

## 使用

中文專題計劃但是 CM03 內容為英文時適用。

1. 文件格式改為 `cm03` 亦即 `\documentclass{cm03}`。
2. 可用 LaTeX 或 XeTeX 編譯。

若用 `XeTeX` 編譯可中英文混合或是使用其他 UTF8 及字型支援的字元；若用 `LaTeX` 編譯則只限中英文，且中文除節標題外，需在 `\begin{kai}` 與 `\end{kai}` 環境內輸入。

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

## 文件格式設定

國科會規定頁面尺寸 A4 ，行距字型大小 12 點，以及頁面邊界 2 公分，其他如字型並無特別規定。

### 中文字型

* 若用 TeX 編譯，字型則為「文鼎楷體」（由 [`arphic`](https://ctan.org/pkg/arphic) 提供）

* 若用 XeTeX 編譯，字型選用順序如下：

  1. 標楷體（Windows 以及 macOS 13.2 以前內建）
  2. 標楷體-繁（macOS 13.3 以後內建）
  3. 文鼎楷體（由 [`arphic-ttf`](https://ctan.org/pkg/arphic-ttf?lang=en) 提供）

### 英文字型

Times 家族（如 Times New Roman）的 TeXGyre Termes

## 範例

以 LaTeX 或 XeTeX 配合 [`microtype`](https://ctan.org/pkg/microtype) 套件編譯加上選項 `libertine` 四種結果如下

|           | LaTeX | XeTeX |
|-----------|-------|-------|
| default   |[proposal.pdf](https://github.com/user-attachments/files/17532662/proposal.pdf)  |  [proposal-xetex.pdf](https://github.com/user-attachments/files/17532661/proposal-xetex.pdf)      |
| libertine | [proposal-libertine.pdf](https://github.com/user-attachments/files/17532660/proposal-libertine.pdf) |[proposal-libertine-xetex.pdf](https://github.com/user-attachments/files/17532659/proposal-libertine-xetex.pdf)|
 
## 選項

文件格式繼承自 `article` 但關閉與 CM03 格式不相容的選項（如：`a5paper`, `10pt`, `titlepage`, `twocolumn`）。額外提供以下兩選項：

* `libertine`: 英文字型改用 Libertine 字型（[連結](https://ctan.org/pkg/libertine)）
* `kaiti`: 中文字型改用「楷體-繁」（作業系統須有此字型且使用 `xetex` 編譯）

## 預載套件

* 文件格式 `cm03` 內預載以下套件：
  * 數學相關 `amsmath`, `amsthm`
  * 排版相關 `babel`, `geometry`, `hyperref`, `setspace`, `lastpage`,
  * 引用格式 `natbib`
  * 樣式調整 `enumitem`, `fancyhdr`, `titlesec`, `zhnumber`
  * 其他 `doi`, `iftex`, `xifthen`
* 字型相關套件
  * 用 LaTeX 編譯時額外載入 `CJKutf8`
  * 用 XeTeX 編譯時額外載入 `fontspec`. `unicode-math`, `xeCJK`

若需要對預載套件設定選項， 可在 `\documentclass{cm03}` 之前用指令 `\PassOptionsToPackage{<選項>}{<套件名稱>}` 傳入。

例如，欲更改 `babel` 的語言為英式英文（選項 `british`）並將中英文字型分別改為「楷體-繁」與 Libertine，則檔案開頭改為
```latex
\PassOptionsToPackage{british}{babel}
\documentclass[libertine,kaiti]{cm03}
...
```

## 設計說明

理工領域學者學術寫作習慣使用英文，但專題研究的申請書則仍是中文順眼，且 CM03 文件的節的標題為中文，因此試圖在兩者間取得平衡，並有以下幾個原則要求：

1. 產生之 PDF 檔有相對應的目錄
2. 中英文排版包括字型且與申請書其他頁面一致和諧
3. 需相容 pdfLaTeX

因此節（`\section`）假設為中文標題並採用中文數字（一、二、三），由此可產生相對應的 PDF 目錄標題。而子節（`\subsection`）則假設為英文段落，標題後的文字沒有空行隔開，而是間隔一小空白後直接開始，與中文標題一致。然而原始 CM03 說明檔案中的文字並不要求保留，除「三、研究計畫內容（以中文或英文撰寫）：」外，其他節的標題文字可由使用者自行跟改。其他版面設定則繼承自 LaTeX 的 `article` 文件格式。

中文字型選擇配合計畫文件其他頁面採用標楷體。然而標楷體並無設計粗體，加粗僅為軟體模擬，部分留白處太少。而 macOS 上內建的「楷體-繁」字型相近且有設計相對應的粗體，較為美觀清楚。因此針對 macOS 使用者，提供選項 `kaiti` 改採用「楷體-繁」。

至於英文字型，國內研究所論文常搭配同是襯線字體的 Times New Roman，依循慣例以 TeX 的同家族字型 TeXGyre Termes 作為預設字型。然而 Times 家族收尾較爲尖銳，相較之下，同是襯線字的 Linux Libertine 收尾處較圓潤與楷體的搭配較為和諧，因此提供選項 `libertine` 可改為 Linux Libertine 字型搭配。

最後因為 `pdfLaTeX` 仍有編譯快速以及 `microtype` 套件支援完整等優點，因此相容 `pdfLaTeX` 不要求使用 `XeTeX` 編譯中文。但中文選擇受限於 TeX 的 T1 字型，標楷體因版權無法製成 T1 字型，改採用開放授權的文鼎楷體取代。


[https://github.com/user-attachments/files/17532659/proposal-libertine-xetex.pdf]: https://github.com/user-attachments/files/17530099/proposal-libertine-xetex.pdf
[def]: https://github.com/user-attachments/files/17530100/proposal-libertine.pdf