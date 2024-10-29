# 國科會專題研究計畫申請書表：CM03 研究計畫 LaTeX 文件格式

## 使用說明

### 情境

中文專題計劃 CM03 內容為英文時適用。自然、工程、人文、生科處（理應）皆適用。

### 使用方式

* 文件格式改為 `cm03` 亦即 `\documentclass{cm03}` 即可。
* 可用 LaTeX 或 XeTeX 編譯

### 文件選項

文件格式繼承自 `article`，排除不相容 CM03 格式的選項後，共有以下可用：

* `draft`
* `oneside`
* `twoside`
* `fleqn`
* `leqno`

額外提供以下選項改變字型：

* `libertine`: 英文字型改用 Linux Libertine（來自 [libertine](https://ctan.org/pkg/libertine) 套件）。
* `kaiti` （需用 XeTeX 編譯）: 中文字型改用 macOS 內建的常州華文「楷體-繁」。

### 文件定義之指令

以下指令可產生 CM03 的章節名稱與說明：

* `\ProposalBackground`: 研究計畫之背景
* `\ProposalMethod`: 研究方法、進行步驟及執行進度
* `\ProposalPlan`: 預期完成之工作項目及成果
* `\ProposalIntegration`: 整合型研究計畫說明

若是編輯軟體會根據 `\section` 判斷原始碼格式，支援程式碼摺疊或目錄之類的功能，則建議直接使用 `\section` 指令輸入章節名稱，最後加入 `\vskip1em` 保留足夠的留白。例如：

```latex
\section{研究計畫之背景}
請詳述本研究計畫所要探討或解決的問題、研究原創性、重要性、預期影響性及國內外有關本計畫之研究情況、重要參考文獻之評述等。如為連續性計畫應說明上年度研究進度。
\vskip1em
```

### 範例

```latex
\documentclass{cm03}
\usepackage{microtype}

\begin{document}

\ProposalBackground
\ProposalMethod
\ProposalPlan
\ProposalIntegration

\nocite{*}

\bibliographystyle{plain}
\bibliography{sample}
\end{document}
```

以 LaTeX 或 XeTeX 編譯或加上選項 `libertine` 的四種結果如下

|           | LaTeX | XeTeX |
|-----------|-------|-------|
| （預設無選項）  |[proposal.pdf](https://github.com/user-attachments/files/17560415/proposal.pdf)  |  [proposal-xetex.pdf](https://github.com/user-attachments/files/17560554/proposal-xetex.pdf)      |
| `libertine` | [proposal-libertine.pdf](https://github.com/user-attachments/files/17560517/proposal-libertine.pdf) |[proposal-libertine-xetex.pdf](https://github.com/user-attachments/files/17560558/proposal-xetex-libertine.pdf)|

## 設計

### 文件格式設定

國科會規定頁面尺寸 A4，一倍行距[^1]，字型大小 12 點，以及頁面邊界 2 公分，其他如字型並無特別規定。

### 預載套件

文件格式預載的套件盡可能精簡，即便常用也留給使用者自行決定。因此只載入設定格式必要的套件：

* 文件格式 `cm03` 內預載以下套件：
  * 數學相關 `amsmath`, `amsthm`
  * 排版相關 `geometry`, `setspace`, `lastpage`,
  * 樣式調整 `fancyhdr`, `titlesec`, `zhnumber`
  * 其他 `iftex`, `xifthen`
* 字型相關套件
  * 用 LaTeX 編譯時額外載入 `CJKutf8`
  * 用 XeTeX 編譯時額外載入 `fontspec`. `unicode-math`, `xeCJK`

### 中文字型

* 若用 TeX 編譯，字型則為「文鼎 PL 中楷」[^2]（來自 [`arphic`](https://ctan.org/pkg/arphic) 套件）

* 若用 XeTeX 編譯，字型選用順序如下：

  1. 標楷體（Windows 以及 macOS 13.2 以前內建）
  2. 標楷體-繁（macOS 13.3 以後內建）
  3. 文鼎 PL 中楷（來自 [`arphic-ttf`](https://ctan.org/pkg/arphic-ttf?lang=en) 套件）

### 英文字型

Times 家族（如 Times New Roman）的 TeXGyre Termes（來自 [`newtx`](https://ctan.org/pkg/newtx) 套件）

### 後記

理工領域學者學術寫作習慣使用英文，但專題研究的申請書則仍是中文順眼，且 CM03 文件的節的標題為中文，此文件格式試圖在兩者間取得平衡。另外有以下幾個原則要求：

1. 產生之 PDF 檔有相對應的目錄
2. 中英文排版包括字型且與申請書其他頁面一致和諧
3. 需相容 pdfLaTeX
4. 字型使用需合法

因此節（`\section`）假設為中文標題並採用中文數字（一、二、三），由此可產生相對應的 PDF 目錄標題。而子節（`\subsection`）則假設為英文段落，標題後的文字沒有空行隔開，而是間隔一小空白後直接開始，與中文標題一致。然而原始 CM03 說明檔案中的文字並不要求保留，除「三、研究計畫內容（以中文或英文撰寫）：」外，其他節的標題文字可由使用者自行跟改。其他版面設定則繼承自 LaTeX 的 `article` 文件格式。

中文字型選擇配合計畫文件其他頁面採用標楷體。然而標楷體並無設計粗體，加粗僅為軟體模擬，部分留白處太少。而 macOS 內建常州華文設計的「楷體-繁」，該字型同為楷體且有設計相對應的粗體字重，較為美觀清楚。因此針對 macOS 使用者，提供選項 `kaiti` 改採用「楷體-繁」。

至於英文字型，國內研究所論文常搭配同是襯線字體的 Times New Roman，依循慣例以 TeX 的同家族字型 TeXGyre Termes 作為預設字型。然而 Times 家族收尾較爲尖銳細長，較接近中文的明體。相較之下，同是襯線字的 Linux Libertine 較圓潤與楷體的搭配較為和諧，因此提供選項 `libertine` 可改為 Linux Libertine 字型搭配。

至於 `pdfLaTeX` 仍有編譯快速以及 `microtype` 套件支援完整等優點，因此盡力相容 `pdfLaTeX` 不要求使用 `XeTeX` 編譯中文。但中文選擇受限於 TeX 的 T1 字型，標楷體因版權無法製成 T1 字型，改採用開放授權的文鼎楷體替代。

[^1]: 根據 Wikipedia 的[說明](https://en.wikipedia.org/wiki/Leading#cite_ref-4)，Word 97–2010 的一倍行距實則為 1.15 倍的行距（leading）之後為 1.08 倍，所以不清楚到底行距實質規定多少。此文件格式行距以 `setspace` 套件的 `\onehalfspacing` 設定行距，印出後肉眼比對約略相等國科會網站下載的範例檔。
[^2]: 文鼎字型公眾授權字型法律聲明[在此](https://www.arphic.com.tw/2022/01/21/plfont/)。
