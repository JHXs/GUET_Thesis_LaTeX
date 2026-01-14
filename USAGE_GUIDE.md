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
