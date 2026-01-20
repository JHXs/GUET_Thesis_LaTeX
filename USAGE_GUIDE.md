# GUET Thesis LaTeX 模板使用指南

本指南将帮助你快速了解如何使用此 LaTeX 模板编写毕业论文。

## 1. 编译环境要求

> [!IMPORTANT]
> 本模板必须使用 **XeLaTeX** 引擎进行编译。

### 推荐编译器设置
- **引擎**: `XeLaTeX`
- **参考文献工具**: `Biber` (本模板使用 `biblatex` 处理参考文献)
- **操作系统**: 支持 Linux, Windows, macOS。

## 2. 文档结构概览

主要的配置和入口文件是 [main.tex](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/main.tex)。

### 2.1 文档类配置
在 `main.tex` 的第 34 行，你可以设置论文类型和版本：
```latex
\documentclass[master]{GUET-Thesis}
```
可选参数：
- **学位类型**: `bachelor` (本科), `master` (学硕), `promaster` (专硕), `doctor` (博士)
- **版本**: `pversion` (打印版), `bversion` (盲审版)

### 2.2 个人信息填报
在 `main.tex` 的“封面信息”部分修改你的个人信息：
- `\Title{中文题目}{English Title}`
- `\Author{你的名字}`
- `\Advisor{导师名字}`
- `\Major{你的专业}`
- `\StudentNumber{学号}`

## 3. 内容组织方式

论文的内容分散在 `Chapters/` 目录下，通过 `\input` 命令引入到 `main.tex` 中。

| 文件 | 用途 |
| :--- | :--- |
| [Abstract.tex](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/Chapters/Abstract.tex) | 中英文摘要 |
| [Symbol.tex](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/Chapters/Symbol.tex) | 符号说明表 |
| `Chapter1.tex` - `Chapter5.tex` | 论文各章节正文 |
| [Conclusion.tex](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/Chapters/Conclusion.tex) | 总结与展望 |
| [Appendix.tex](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/Chapters/Appendix.tex) | 附录 |
| [Thanks.tex](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/Chapters/Thanks.tex) | 致谢 |

## 4. 参考文献与成果

- **参考文献**: 编辑 [References.bib](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/References/References.bib)。
- **个人成果**: 编辑 [Accomplishs.bib](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/References/Accomplishs.bib)。

> [!TIP]
> 参考文献使用的是 `biblatex-gb7714-2015` 标准，建议从 Zotero 或 Google Scholar 导出 `biblatex` 格式。

## 5. 快速开始步骤

1. **修改封面**: 打开 `main.tex`，填入你的姓名、题目等信息。
2. **编写摘要**: 在 `Chapters/Abstract.tex` 中填写中英文摘要及关键词。
3. **编写正文**: 在 `Chapters/` 下创建或修改 `.tex` 文件，并在 `main.tex` 中使用 `\input` 引入。
4. **添加文献**: 将你的 BibTeX 条目放入 `References/References.bib` 中，并在正文中使用 `\cite{key}` 引用。
5. **编译生成**: 运行 `xelatex -> biber -> xelatex -> xelatex` 进行编译。

## 6. 常用命令示例

- **引用图表/公式**: 使用 `\cref{label}`（如 `\cref{fig:example}`, `\cref{eq:math}`）。
- **三线表**: 使用模板定义的 `threetab` 环境。
- **子图**: 使用 `\subfloat` 命令。

详情请参考 [Chapter1.tex](file:///home/hansel/Documents/ITProject/GUET_Thesis_LaTeX/Chapters/Chapter1.tex) 中的示例代码。

## 编译指南

### 环境配置
1. ArchLinux

```shell
sudo pacman -S texlive texlive-lang biber
```

2. Fedora

```shell
sudo dnf install texlive-scheme-full
```

### 1. 使用 latexmk 指定输出目录

```shell
# 指定输出到 ./out 目录
latexmk -xelatex -outdir=out main.tex
```

### 2. 使用手动编译指定输出目录

```shell
# 第一步：首次编译（生成辅助文件）
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=out main.tex

# 第二步：处理参考文献（如果使用 biber）
biber out/main

# 第三步：再次编译
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=out main.tex

# 第四步：最后编译（确保引用正确）
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=out main.tex
```
> 编译说明
```
1. 第一次编译
生成辅助文件（.aux, .toc, .lof, .lot 等）
记录交叉引用信息（哪些章节、图表、公式被引用了）
但此时引用还是 ??（因为引用信息还没生成）
2. 处理参考文献
读取 main.bcf 文件（包含文献引用信息）
从 References.bib 中提取对应的文献条目
生成 main.bbl 文件（格式化后的文献列表）
3. 第二次编译
读取新生成的 main.bbl，在文档中插入文献引用
此时引用已替换为数字（如 [1]）
但页码可能还是错的（比如引用"见第 \pageref{sec:intro} 页"）
4. 第三次编译（最后一步）
使用正确的页码更新所有交叉引用
确保目录（TOC）、图表目录（LOF/LOT）正确
所有引用都最终稳定
```
