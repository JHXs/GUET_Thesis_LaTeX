# GUET Thesis LaTeX 模板使用指南

本文档介绍桂林电子科技大学论文模板 `GUET_Thesis_LaTeX` 的基本使用方法，适合第一次接触该模板的同学快速上手。

项目地址：

- GitHub: <https://github.com/YanMing-lxb/GUET_Thesis_LaTeX>

## 1. 模板简介

该模板用于排版桂林电子科技大学本科、硕士、博士学位论文，支持：

- 本科
- 学硕
- 专硕
- 博士
- 在职硕士
- 非全专硕
- 盲审版
- 打印版

模板主文件为 `main.tex`，论文内容通常分散在 `Chapters/`、`References/`、`Pictures/` 等目录中。

## 2. 获取模板

可以通过以下两种方式获取模板：

### 2.1 使用 Git 下载

```bash
git clone https://github.com/YanMing-lxb/GUET_Thesis_LaTeX.git
```

### 2.2 直接下载压缩包

进入项目主页后下载 ZIP，解压后即可使用。

## 3. 目录结构说明

模板常见目录和文件作用如下：

- `main.tex`：论文总入口文件
- `GUET-Thesis.cls`：模板类文件，一般不要随意修改
- `Chapters/`：摘要、章节、结论、附录等正文内容
- `Pictures/`：图片资源目录
- `References/`：参考文献与科研成果 `.bib` 文件
- `Fonts/`：Linux 或在线编译时需要补充的中文字体
- `latexmkrc`：`latexmk` 编译配置文件
- `Build/`：可用于存放编译产物

## 4. 环境准备

### 4.1 推荐方式

推荐以下两种写作方式：

- 本地 LaTeX 环境 + VS Code
- 在线平台，如 Overleaf 或 TeXPage

### 4.2 编译引擎要求

这个模板要求使用 `XeLaTeX` 编译。

不要使用默认的 `pdfLaTeX`，否则中文、字体或模板命令可能报错。

### 4.3 本地环境建议

本地建议安装完整 LaTeX 发行版，例如：

- TeX Live
- MacTeX
- MiKTeX

如果使用 VS Code，建议安装：

- LaTeX Workshop

## 5. 首次使用流程

第一次使用时，建议按照下面顺序操作：

1. 下载模板
2. 打开 `main.tex`
3. 修改论文类型和封面信息
4. 编写摘要和各章内容
5. 导入参考文献
6. 使用 `XeLaTeX` 编译
7. 检查格式并反复修改

## 6. 修改论文类型

在 `main.tex` 开头可以看到类似内容：

```tex
\documentclass[master]{GUET-Thesis}
```

其中 `master` 表示学术型硕士。可选参数如下：

- `bachelor`：本科
- `master`：学硕
- `promaster`：专硕
- `doctor`：博士
- `ojmaster`：在职硕士
- `ptomaster`：非全专硕
- `bversion`：盲审版
- `pversion`：打印版

### 6.1 常见示例

学硕普通版：

```tex
\documentclass[master]{GUET-Thesis}
```

学硕盲审版：

```tex
\documentclass[master,bversion]{GUET-Thesis}
```

学硕打印版：

```tex
\documentclass[master,pversion]{GUET-Thesis}
```

本科普通版：

```tex
\documentclass[bachelor]{GUET-Thesis}
```

## 7. 填写封面信息

在 `main.tex` 中找到封面信息区域，按实际情况填写：

```tex
\Title{中文题目}{英文题目}
\Author{你的姓名}
\Advisor{导师姓名}
\Protitle{导师职称}
\School{学院名称}
\Major{专业名称}
\ResearchDirection{研究方向}
\DegreeCategories{工学硕士}
\StudentNumber{学号}
\Secrets{}
\Date{2026年5月}
```

说明：

- `\Title{中文题目}{英文题目}`：分别填写中英文题目
- `\School{}`：本科需要，硕博按学校要求填写
- `\ResearchDirection{}`：盲审版常用
- `\Secrets{}`：不涉密可留空
- `\Date{}`：建议手动写固定日期，不要长期使用 `\today`

如果英文标题过长，可在标题里加入换行：

```tex
\Title{中文题目}{A Very Long English Title \\& With a Manual Line Break}
```

## 8. 正文文件如何组织

模板中 `main.tex` 一般通过 `\input{}` 引入各章节文件，例如：

```tex
\input{Chapters/Abstract}
\input{Chapters/Chapter1}
\input{Chapters/Chapter2}
\input{Chapters/Chapter3}
\input{Chapters/Chapter4}
\input{Chapters/Chapter5}
\input{Chapters/Conclusion}
\input{Chapters/Appendix.tex}
```

这意味着你平时主要编辑的是 `Chapters/` 目录下的文件，而不是把所有内容都写进 `main.tex`。

推荐写作分工如下：

- `Chapters/Abstract.tex`：中英文摘要
- `Chapters/Symbol.tex`：符号说明
- `Chapters/Chapter1.tex`：第一章
- `Chapters/Chapter2.tex`：第二章
- `Chapters/Chapter3.tex`：第三章
- `Chapters/Chapter4.tex`：第四章
- `Chapters/Chapter5.tex`：第五章
- `Chapters/Conclusion.tex`：结论与展望
- `Chapters/Appendix.tex`：附录

## 9. 摘要与关键词

摘要一般写在模板定义的中英文摘要环境中，关键词使用对应命令填写。

写作时建议：

- 中文摘要和英文摘要内容保持对应
- 关键词数量按学校要求控制
- 英文摘要尽量不要机翻直出，注意术语统一

## 10. 图片插入方法

模板默认配置了图片路径，例如：

```tex
\graphicspath{
 {./Pictures/},
 {./Pictures/Chapter1/},
 {./Pictures/Chapter2/},
 {./Pictures/Chapter3/},
 {./Pictures/Chapter4/},
 {./Pictures/Chapter5/}
}
```

因此你可以把图片放到这些目录中，然后在正文里直接插入：

```tex
\begin{figure}[htbp]
  \includegraphics[width=0.7\textwidth]{example}
  \caption{示例图片}
  \label{fig:example}
\end{figure}
```

说明：

- 图片文件名通常不必带扩展名
- 建议文件名只使用英文字母、数字、短横线或下划线
- 引用图片时建议使用 `\cref{fig:example}`

## 11. 表格编写方法

README 推荐使用 `tabularray` 宏包，并提供了三线表环境 `threetab`。

示例：

```tex
\begin{table}[htbp]
  \caption{三线表示例}
  \label{tab:example}
  \begin{threetab}{cc}
    表头1 & 表头2 \\
    内容1 & 内容2 \\
    内容3 & 内容4 \\
  \end{threetab}
\end{table}
```

建议：

- 表题放在表格上方
- 图题放在图片下方
- 表格尽量避免过宽

## 12. 公式、图表、章节引用

模板建议统一使用 `\cref{}` 进行交叉引用，例如：

```tex
如 \cref{fig:example} 所示。
如 \cref{tab:example} 所示。
如 \cref{eq:navier-stokes} 所示。
如 \cref{chap:intro} 所示。
```

这样可以减少手动写“图”“表”“式”“第X章”带来的维护成本。

## 13. 参考文献使用方法

模板使用 `biblatex` 管理参考文献。

在 `main.tex` 中通常会看到：

```tex
\ThesisBibResource{./References/References.bib}
```

这表示论文参考文献数据来源于：

- `References/References.bib`

### 13.1 如何准备 `.bib` 文件

可以使用以下工具导出：

- Zotero
- JabRef
- 各数据库网站导出

注意：

- 导出格式优先选择 `biblatex`
- 如果拿到的是 `bibtex` 格式，可能需要转换

README 中提到可使用 `pandoc` 转换：

```bash
pandoc -f bibtex -t biblatex -o output.bib input.bib
```

### 13.2 文中引用

正文中通常通过 `\cite{}` 或模板已有方式引用参考文献，例如：

```tex
相关研究已经较为成熟\cite{ref1}。
```

具体命令以模板当前示例为准。

### 13.3 重要注意事项

根据项目 README，以下两个宏包建议更新到较新版本，否则可能报错：

- `biblatex`
- `biblatex-gb7714-2015`

## 14. 攻读学位期间成果

模板单独使用一个 `.bib` 文件记录科研成果：

```tex
\ThesisAchResource{./References/Accomplishs.bib}
```

对应文件一般是：

- `References/Accomplishs.bib`

这里通常填写：

- 已发表论文
- 已录用论文
- 专利
- 竞赛成果
- 其他学校要求列出的成果

## 15. 盲审版和打印版

### 15.1 盲审版

使用：

```tex
\documentclass[master,bversion]{GUET-Thesis}
```

盲审版通常会有以下特点：

- 自动切换为盲审封面
- 致谢部分可能失效
- 攻读学位期间成果会切换到盲审相关内容

因此提交盲审材料前，要再次检查：

- 作者姓名是否在正文中泄露
- 致谢是否被去除
- 个人成果是否符合盲审要求

### 15.2 打印版

使用：

```tex
\documentclass[master,pversion]{GUET-Thesis}
```

打印版会按模板预设切换部分封面样式，例如校徽颜色等。

## 16. 编译方法

### 16.1 使用 `latexmk`

该项目自带 `latexmkrc`，其中已将 PDF 编译模式设置为 `XeLaTeX`。

因此推荐在项目根目录执行：

```bash
latexmk main.tex
```

如果需要清理辅助文件，可使用：

```bash
latexmk -c
```

如果需要彻底清理生成文件，可尝试：

```bash
latexmk -C
```

### 16.2 使用 VS Code

如果安装了 LaTeX Workshop：

1. 用 VS Code 打开模板根目录
2. 打开 `main.tex`
3. 将编译器切换为 `XeLaTeX` 或基于 `latexmk` 的 recipe
4. 点击编译

### 16.3 使用 Overleaf 或 TeXPage

在线平台的默认编译器经常是 `pdfLaTeX`，需要手动修改为：

- `XeLaTeX`

否则可能出现：

- 中文字体错误
- 封面异常
- 宏包报错

## 17. 字体问题

README 特别说明：

- Linux 环境下英文字体使用 STIX
- Linux 或在线编译时，中文字体需要额外下载并放入 `Fonts/` 目录

如果你在以下环境中编译：

- Overleaf
- TeXPage
- Linux 本地

建议优先检查：

- `Fonts/` 目录是否齐全
- 中文字体文件是否已正确放置

## 18. 常见问题

### 18.1 为什么编译失败

常见原因：

- 没有使用 `XeLaTeX`
- `biblatex` 相关宏包版本过旧
- 字体缺失
- `.bib` 文件格式不兼容
- 图片路径错误
- 章节文件名写错

### 18.2 为什么参考文献不显示

请检查：

- `References/References.bib` 是否存在
- 文献条目 key 是否正确
- 编译流程是否完整
- `biblatex` 是否正常工作

### 18.3 为什么中文乱码或字体不对

请检查：

- 是否使用 `XeLaTeX`
- `Fonts/` 目录中的中文字体是否齐全
- 在线平台是否支持该字体

### 18.4 为什么图片不显示

请检查：

- 图片是否放在 `Pictures/` 或对应章节目录中
- 文件名大小写是否一致
- 文件名是否包含空格或中文符号

### 18.5 为什么交叉引用显示问号

这通常是因为引用信息还没有完全生成。重新编译数次，或使用 `latexmk` 自动完成完整编译流程即可。

## 19. 写作建议

- 不要直接修改 `GUET-Thesis.cls`，除非你明确知道影响范围
- 优先在 `Chapters/` 中写正文内容
- 图片、表格、公式统一加 `\label{}`
- 全文交叉引用尽量统一用 `\cref{}`
- 定稿前分别导出普通版、盲审版、打印版检查格式
- 每次大改前备份一份

## 20. 最小上手示例

如果你只想先跑通模板，最少只需要做这几件事：

1. 修改 `main.tex` 中的 `\documentclass[...]`
2. 填写 `\Title`、`\Author`、`\Advisor` 等封面信息
3. 把 `Chapters/Abstract.tex` 和 `Chapters/Chapter1.tex` 改成自己的内容
4. 在 `References/References.bib` 中放入至少一条文献
5. 运行：

```bash
latexmk main.tex
```

如果可以正常生成 PDF，说明模板已经跑通，后续只需要逐章补内容即可。

## 21. 参考链接

- 项目主页：<https://github.com/YanMing-lxb/GUET_Thesis_LaTeX>
- `main.tex`：<https://github.com/YanMing-lxb/GUET_Thesis_LaTeX/blob/main/main.tex>
- `latexmkrc`：<https://github.com/YanMing-lxb/GUET_Thesis_LaTeX/blob/main/latexmkrc>

## 22. 结语

这个模板的核心使用方式可以概括为一句话：

先改 `main.tex` 的论文类型和封面信息，再去 `Chapters/` 写内容，最后用 `XeLaTeX` 编译。

如果后续你需要，我还可以继续帮你补两类文档：

- 面向新手的“超简版一页说明”
- 面向实际提交的“盲审版/打印版切换说明”
