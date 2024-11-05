# nstc-proposal: LaTeX classes for NSTC grant proposals (國科會專題研究計畫 LaTeX 文件格式)

(See [below](#概要) for 中文解說)

## Overview

This package consists of LaTeX classes for preparing grant proposals to National Science and Technology Council, Taiwan, that is:

* CM03
* CM302

which support typesetting in both Chinese and English and are compatible with pdfLaTeX and XeTeX.

## Installation

### CTAN installation

Run the following command in a terminal (or use any TeX package manager) to install:

```bash
tlmger install nstc-proposal
```

### Manual Installation

1. Run the following command in a terminal to build files and examples:

   ```bash
   latex nstc-proposal.ins
   ```

2. Copy the generated `.cls` files to a directory searchable by LaTeX.
   Hint. Run the following command to locate the local texmf directory:

   ```bash
   kpsewhich -var-value TEXMFLOCAL
   ```

   Placing the generated files under any subdirectory of the directory shown above should work.

3. Compile tex files under `example` by pdfLaTeX or XeTeX and see if the package has been installed properly.

## Usage

See `nstc-proposal.pdf`.

## Development

`nstc-proposal` was written and is maintained by [Liang-Ting Chen](https://l-tchen.github.io).

Please report any bug or feature request on GitHub (<https://github.com/L-TChen/nstc-proposal>).

## License

The `nstc-proposal` class is distributed under the conditions of the LATEX Project Public License, either version 1.3c of this license or (at your option) any later version.

## 概要

此套件提供準以下台灣國科會專題計劃申請書的文件格式：

* 表 CM03
* 表 CM302

並且支援中英混排，相容 pdfLaTeX 跟 XeTeX 編譯。

## 安裝方式

### CTAN 安裝

在終端機下執行以下命令安裝（或是用任何一個 TeX 的套件管理程式）:

```bash
tlmger install nstc-proposal
```

### 手動安裝

1. 在終端機下執行以下命令生成檔案跟範例：

   ```bash
   latex nstc-proposal.ins
   ```

2. 把生成出來的 `.cls` 檔案複製到 LaTeX 可以搜尋得到的目錄下。提示：把檔案放在 `kpsewhich -var-value TEXMFLOCAL` 下的任一子目錄應該就可以。`TEXMFLOCAL` 路徑可用以下指令得到：

   ```bash
   kpsewhich -var-value TEXMFLOCAL
   ```

3. 用 pdfLaTeX 或是 XeTeX 編譯 `example` 目錄底下的檔案，看是否有安裝成功。

## 使用方式

請參考 `nstc-proposal.pdf`。

### 文件選項

文件格式繼承自 `article` 額外提供以下選項：

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

### 表 CM03 範例

```latex
\documentclass{nstc-cm03}
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

### 表 CM302 範例

若用格式 `nstc-cm302` 則會改為表 CM302 文獻目錄之格式：

1. 文件標題改為「五、著作目錄⋯⋯」
2. 隱藏 LaTeX 預設之引用章節名稱
3. 取消 CM03 相關指令 `\ProposalBackground`、`\ProposalMethod`、 `\ProposalPlan`、`\ProposalIntegration` 避免誤用。

引用載入之 `.bib` 檔裡所有的論文，只需要用 `\nocite{*}` 即可。例如以下檔案：

```latex
\documentclass{nstc-cm302}

\usepackage[hidelinks]{hyperref}
\usepackage{doi}

\usepackage{microtype}

\begin{document}

\nocite{*}

\bibliographystyle{abbrv}
\bibliography{sample}
\end{document}
```

便能產出此[結果](https://github.com/user-attachments/files/17573002/bibliography.pdf)。

## 設計

### 文件格式設定

國科會規定頁面尺寸 A4，一倍行距[^1]，字型大小 12 點，以及頁面邊界 2 公分，其他如字型並無特別規定。

### 預載套件

文件格式除設定格式必要的套件外，另載入 `amsmath` 以及 `amsthm` 兩套件以及：

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

## 開發維護

本套件 `nstc-proposal` 是由[陳亮廷](<https://l-tchen.github.io>)所撰寫維護。

發現任何錯誤或是有任何需求，請回報到 GitHub 上的專案網站 <https://github.com/L-TChen/nstc-proposal。>

## 版權聲明

The `nstc-proposal` class is distributed under the conditions of the LATEX Project Public License, either version 1.3c of this license or (at your option) any later version.

[^1]: 根據 Wikipedia 的[說明](https://en.wikipedia.org/wiki/Leading#cite_ref-4)，Word 97–2010 的一倍行距實則為 1.15 倍的行距（leading）之後為 1.08 倍，所以不清楚到底行距實質規定多少。此文件格式行距以 `setspace` 套件的 `\onehalfspacing` 設定行距，印出後肉眼比對約略相等國科會網站下載的範例檔。
[^2]: 文鼎字型公眾授權字型法律聲明[在此](https://www.arphic.com.tw/2022/01/21/plfont/)。
