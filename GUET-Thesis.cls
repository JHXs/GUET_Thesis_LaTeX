%
%  =======================================================================
%  ·······································································
%  ·······································································
%  ····Y88b···d88P················888b·····d888·d8b·······················
%  ·····Y88b·d88P·················8888b···d8888·Y8P·······················
%  ······Y88o88P··················88888b·d88888···························
%  ·······Y888P··8888b···88888b···888Y88888P888·888·88888b·····d88b·······
%  ········888······"88b·888·"88b·888·Y888P·888·888·888·"88b·d88P"88b·····
%  ········888···d888888·888··888·888··Y8P··888·888·888··888·888··888·····
%  ········888··888··888·888··888·888···"···888·888·888··888·Y88b·888·····
%  ········888··"Y888888·888··888·888·······888·888·888··888··"Y88888·····
%  ·······························································888·····
%  ··························································Y8b·d88P·····
%  ···························································"Y88P"······
%  ·······································································
%  =======================================================================
% 
%  -----------------------------------------------------------------------
% Author       : 焱铭
% Date         : 2025-02-24 22:56:46 +0800
% LastEditTime : 2026-01-23 01:16:09 +0800
% Github       : https://github.com/YanMing-lxb/
% FilePath     : /GUET_Thesis_LaTeX/GUET-Thesis.cls
% Description  : 桂林电子科技大学学位论文模板
%  -----------------------------------------------------------------------
%
\newcommand{\Version}{v2.12.3}

\ProvidesClass{GUET-Thesis}[2026/01/22 \Version 桂林电子科技大学学位论文模板 --焱铭]

\LoadClass[												% 加载文档类并设置选项
	12pt,                                   		    % 字号为12pt
	a4paper,                                		    % 纸张大小为A4
	openany,                                		    % 允许在任意页面开始新的章节
	oneside                                 		    % 设置为双面打印模式
]{book}                                     		    % 使用book文档类    

\RequirePackage[
	dvipsnames,                       				    % 允许使用64种扩展颜色名称，例如RoyalBlue、OliveGreen等
	svgnames,                         				    % 允许使用150种SVG命名颜色，例如DarkOrange、MediumPurple等
	table                             				    % 允许在表格中使用颜色
]{xcolor}                             				    % 使用xcolor宏包，并加载颜色选项

% ===============图片相关宏包===============                  
\RequirePackage{graphicx}                               % 用于插入图片
\RequirePackage{float}                                  % 提供浮动环境和浮动对象的控制
\RequirePackage[labelformat=simple]{subcaption}         % 用于生成子图表和子标题，labelformat=simple 表示子标题的标签格式为简单的形式
\RequirePackage[
	font={onehalfspacing, small},     					% 设置字体为onehalfspacing（1.5倍行距）和small（小号字体）
	labelsep=space,                   					% 设置标签和标题之间的间距为一个空格
	skip=6pt,                         					% 设置标题与上下文之间的间距为6pt
	figurewithin=none,                					% 禁止图表编号受章节影响
	tablewithin=none                  					% 禁止表格编号受章节影响
]{caption}                            					% 用于自定义浮动环境（如图表）的标题格式和样式
% figurewithin=none 和 tablewithin=none 取消书籍类中对图表目录所添加的 10pt 间距命令，使得图表目录中的章节编号连续
% 需要在对应的计数器中进行每章重置以保证连续编号

% ===============TiKz相关宏包===============
\RequirePackage{tikz}                                	% 用于绘制矢量图形
\RequirePackage{tikzscale}                           	% 用于调整TiKz图形的大小
\RequirePackage{pgfplots}                            	% 用于绘制二维和三维图形
\pgfplotsset{width=0.8\textwidth, compat=1.17}       	% 设置pgfplots图形的宽度为文本宽度的0.8倍，兼容性设置为1.17
%pgfplots
\tikzset{
	global scale/.style={scale=#1,every node/.append style={scale=#1}}
}                                             			% 设置全局缩放样式
% \RequirePackage{pgfplotstable}                        % 用于绘制表格
% \RequirePackage{pgf-pie}                              % 用于绘制饼图
% \RequirePackage{pgf-umlcd}                            % 用于绘制UML类图
% \RequirePackage{pgf-umlsd}                            % 用于绘制UML时序图

% ===============表格相关宏包===============
\RequirePackage{array}                               	% 用于增强表格的功能和格式
\RequirePackage{tabularray}                          	% 提供更灵活和功能强大的表格环境
\RequirePackage{booktabs}                            	% 用于生成漂亮的三线表格样式
\RequirePackage{multirow}                            	% 允许在表格中合并多行

% ===============盒子相关宏包=============== 
\RequirePackage[most]{tcolorbox}                     	% 加载 tcolorbox 宏包，并使用 most 库
\RequirePackage[absolute,overlay]{textpos}           	% 用于绝对定位文本框，用于排版封面
% \RequirePackage{showframe}                         	% 显示排版框架
% \TPshowboxestrue                                   	% 显示textblock 框架，方便调整位置
\RequirePackage{adjustbox}                           	% 用于调整盒子的大小和位置，直白的说就是将超宽表格居中放置

% ===============公式相关宏包===============    
% \RequirePackage[
% 	n,          									  	% 或 lambda 
% 	advantage,  									  	% 优势
% 	operators,  									  	% 操作符
% 	sets,       									  	% 集合
% 	adversary,  									  	% 对手
% 	landau,     									  	% 朗道符号
% 	probability,									  	% 概率
% 	notions,    									  	% 概念
% 	logic,      									  	% 逻辑
% 	ff,         									  	% 函数
% 	mm,         									  	% 矩阵
% 	primitives, 									  	% 原语
% 	events,     									  	% 事件
% 	complexity, 									  	% 复杂度
% 	oracles,    									  	% 预言机
% 	asymptotics,									  	% 渐近分析
% 	keys        									  	% 密钥
% ]{cryptocode}   									  	% 用于排版密码学算法
% \createprocedurecommand{procedure}{}{}{}				% 解决cryptocode宏包中和原有默认center环境的\procedure命令冲突
% \createpseudocodeblock{pseudocodeblock}{}{}{}{}		% 解决cryptocode宏包中和原有默认center环境的\pseudocodeblock命令冲突
% \createprocedureblock{procedureblock}{}{}{}{}			% 解决cryptocode宏包中和原有默认center环境的\procedureblock命令冲突
\RequirePackage{stix2}									% 数学字体和英文字体采用stix2字体（类Times字体）已包含 amssymb 宏包, 并且需要同时加载mathspec，否则部分符号会出现错误
\RequirePackage{amsmath}                              	% 提供数学公式环境和命令
\RequirePackage{amsthm}                               	% 用于定义和排版定理、引理等数学定理结构
\RequirePackage{mathspec}                             	% 用于在数学环境中选择自定义的字体
\RequirePackage{stmaryrd}                             	% 映入符号的引入\mapsfrom, 秘密分享份额符号\llbracket,\rrbracket无法在符号说明引入
\RequirePackage{mathrsfs}                             	% 引入花体\mathscr{E},可尝试\usepackage[mathscr]{euscript}，\usepackage[scr]{rsfso}，\usepackage[mtpscr]{mtpro2}

% ===============目录相关宏包===============
\RequirePackage[titles]{tocloft}                      	% 用于设置目录、图表目录和表格目录的格式，titles 表示可以让 tocloft 宏包不改变章节标题的格式，而只改变目录中的格式 

% ===============符号说明相关宏=============== 
\RequirePackage{multicol}                             	% 提供多栏环境
\RequirePackage[intoc, notocbasic]{nomencl}             % 用于生成符号说明 参数 intoc 表示将符号说明加入目录, 参数 notocbasic 表示禁用 tocbasic 宏包避免报错

% ===============字体相关宏包===============
\RequirePackage{xeCJK}                                	% 用于设置全局的中日韩文字体
% \xeCJKsetup{ % 影响封面字体对齐，如果启用该命令 \quad 将不能代表两个汉字间距
%   CJKglue = {\hskip 0.08em plus 0.02em minus 0.02em},   % 中文字间距调整
%   CJKecglue = {\hskip 0.08em plus 0.02em minus 0.02em}  % 中英文间间距调整
% }
\RequirePackage{xeCJKfntef}                           	% 用于提供更多的字体效果设置选项，兼容ulem宏包
\RequirePackage{zhnumber}                             	% 用于将数字转换为大写中文数字的表示
\RequirePackage{pifont}                               	% 提供了许多符号和图标的命令
\RequirePackage{datetime2}                            	% 提供了日期和时间格式控制功能，包括 \today 命令

% ===============链接相关宏包===============    
\RequirePackage[hyphens]{xurl}                        	% 允许在长网址中断行，避免超出边界
\RequirePackage[
	unicode,               								% 设置是否使用 Unicode 字符集
	pdfencoding=auto,      								% 设置 PDF 编码格式
	bookmarks=true,        								% 设置 PDF 文件是否生成书签
	hyperfootnotes=false,  								% 设置是否给脚注添加链接
	bookmarksnumbered=true,								% 设置 PDF 书签是否带编号
	bookmarksdepth=4       								% 设置书签的深度
]{hyperref}                								% 用于设置书签和超链接
\RequirePackage{cleveref}  								% 用于引用和交叉引用的格式设置（需要放在hyperref后面）

% ===============排版相关宏包===============
\RequirePackage{geometry}         						% 用于设置页面尺寸和布局
\RequirePackage{setspace}         						% 提供调整行距的命令和环境
\RequirePackage{fancyvrb}         						% 提供了更灵活的抄录环境和定制选项
\RequirePackage[twoside]{fancyhdr}						% 用于设置页眉和页脚的样式
\RequirePackage{titlesec}         						% 用于自定义章节标题的样式
\RequirePackage{indentfirst}      						% 用于在章节标题后自动缩进第一段落
\RequirePackage{appendix}         						% 用于生成附录并对附录标题进行格式设置
\RequirePackage{lastpage}         						% 用于统计总页数（本科页码中使用）
\RequirePackage{ifoddpage}        						% 用于判断页码是否为奇数（用于判断打印版中空白页的添加）
\RequirePackage{pdfpages}         						% 用于插入外部 PDF 文档的页面，已签名的独创性声明
\RequirePackage{etoolbox}         						% 提供逻辑判断、列表循环遍历、patch、hook、计数器、布尔变量等操作
% \RequirePackage{stfloats}       						% 提供了双栏排版中的浮动体环境
\RequirePackage{verbatim}         						% 提供了更灵活的抄录环境和定制选项，对简短的抄录，可使用\verb|文字|和\verb*|文字|命令，原样输出一些特殊字符，如\、{}、$、#、%、_、&、~、^、\和空格，或原样输出命令
% \RequirePackage{listings}       						% 用于排版代码，支持多种编程语言
\RequirePackage{microtype}        						% 提供了更好的微调字距、字间距和连字等功能
% \RequirePackage{makecell}       						% 用于生成复杂表格的单元格
% \RequirePackage{ulem}           						% 提供了各种下划线、波浪线、删除线等效果
\RequirePackage{siunitx}          						% 提供了国际单位制的数字和单位的排版


% ===============算法相关宏包===============
% 下面的两套算法宏包二选一，希望作者可以保留
% algorithmicx的风格和语法会现代很多
% 更合适作为学术论文
\newcommand{\theAlgoSetIn}[1]{
	\ifthenelse{\equal{#1}{algorithm2e}}
	{
		% 第一套：algorithm2e宏包
		\RequirePackage[
			algochapter, 								% 将算法放在章节中，并以章节编号
			boxruled,    								% 给算法添加边框
			linesnumbered								% 给算法添加行号
		]{algorithm2e}   								% 用于排版算法和伪代码
	}
	{
		\ifthenelse{\equal{#1}{algorithmicx}}
		{
			% 第二套：algorithmicx宏包
			\RequirePackage{algorithm}              				% 用于排版算法和伪代码
			\RequirePackage{algorithmicx}           				% 用于排版算法和伪代码，考虑到 algorithm2e 宏包的一些问题，这里使用 algorithmicx 宏包，同时考虑是否去掉此宏包
			\RequirePackage[noend]{algpseudocode}   				% 用于排版算法和伪代码，是 algorithmicx 的扩展，algpseudocode 是 algorithmicx 的一种呈现方式，其中包含algorithmicx的所有功能
			\RequirePackage[linewidth=1pt]{mdframed}				% 用于生成带边框的文本框
			% ===============算法格式相关定制===============
			\algnewcommand\algorithmicinput{\textbf{INPUT: }}    	% 定义算法输入关键字
			\algnewcommand\Input{\item[\algorithmicinput]}       	% 定义算法输入关键字
			\algnewcommand\algorithmicoutput{\textbf{OUTPUT: }}  	% 定义算法输出关键字
			\algnewcommand\Output{\item[\algorithmicoutput]}     	% 定义算法输出关键字
			\algrenewcommand\algorithmicwhile{\textbf{Upon}}     	% 定义算法while关键字
			% ===============算法相关宏包定制结束===============
		}
		{
			\typeout{无效的输入，请使用algorithm2e或algorithmicx参数。}
		}
	}
}

% ===============列表相关宏包===============
\RequirePackage{enumitem}						% 用于定制列表环境的样式和标签

% ===============参考文献相关宏包===============
\RequirePackage[
	backend=biber,       						% 设置后端程序为biber
	doi=false,           						% 不显示 doi
	url=false,           						% 不显示 url
	defernumbers=true,   						% 解决 refsection 环境中 \printbibliography 筛选和 notice* 一起使用导致的编号错乱
	bibstyle=gb7714-2015,						% 参考文献样式
	citestyle=gb7714-2015,
	gbmedium=true,                     		    % 载体标识符不显示OL
	gbtitlelink=true,
	% gbpub=true,                       		  % 显示出版信息
	% gbnamefmt=lowercase,              		  % 姓名小写，这个在最新版本的模板中还是需要大写的，因此需要关闭
	% gbpunctin=false,                  		  % 关闭 inbook, incollection, inproceedings 中析出来源文献前//符号，这个在最新版本模板中还是需要的，因此需要关闭
	gbstrict=true,                      		% 避免输出 bib 文件中多余的域信息
	gbalign=center,                     		% 标签中括号对齐
	gbannote=true,                      		% 显示 annote 域，使得完成对于 thesisauthor 和 corresponding 的显示
]{biblatex}
\setcounter{gbrefcompress}{3}					% 设置参考文献压缩的阈值，修改从三篇文献开始压缩
% \DefineBibliographyStrings{english}{in={}} % 去掉英文in，避免会议中的in:出现，这行是不需要的，不使用 gbpunctin 或注释即可

% ===============条件判断宏包宏包===============
\RequirePackage{ifxetex}   						% 判断是否使用 XeLaTeX 编译，以决定后续的包和设置的使用
\RequirePackage{ifplatform}						% 用于判断当前的操作系统平台
\RequirePackage{ifthen}    						% 提供了 \ifthenelse 命令，用于条件判断和分支控制

\RequireXeTeX									% 指定必须用 XeTeX 引擎进行编译

\RequirePackage[l2tabu, orthodox]{nag}			% 检查是否有已被淘汰或过时的宏包

% ===============PDF文件相关宏包===============
\hypersetup{                        			% 文中链接设置
	% pdfauthor = {\TheAuthor},     			% 设置作者名称；
	% pdftitle = {\zh@TheTitle},    			% 设置文档的标题；
	% pdfsubject = {\DisplayHeader},			% 设置文档主题；
	% pdfkeywords = {},             			% 设置文档中关键词
	colorlinks=true,                			% 指定是否给链接添加颜色；
	citecolor=black,                			% citecolor链接颜色设置；
	linkcolor=black,                			% linkcolor引用颜色设置；
	urlcolor=black                  			% urlcolor网址颜色；
}



% //////////////////////////////////////// 打印与盲审定义 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ===============打印选项设置===============
\newboolean{@pversion}                                                 % 新定义一个名为 @pversion 的布尔值
\setboolean{@pversion}{false}                                          % 设定布尔值的默认值为 false
\DeclareOption{pversion}{\setboolean{@pversion}{true}}                 % 当设定选项为pversion时 @pversion 为 true
\ProcessOptions\relax                                                  % 通常放在类或包文件的可选项声明和处理部分的最后，用来执行用户提供的可选项对应的代码

\newcommand{\ifpversion}[2]{ \ifthenelse{\boolean{@pversion}}{#1}{#2}} % 定义命令 \ifpversion 如果 @pversion 为true 则执行 #1 否则 执行 #2


% ==============盲审选项设置===============
\newboolean{@bversion}                                                 % 新定义一个名为 @bversion 的布尔值
\setboolean{@bversion}{false}                                          % 设定布尔值的默认值为 false
\DeclareOption{bversion}{\setboolean{@bversion}{true}}                 % 当设定选项为bversion时 @bversion 为 true
\ProcessOptions\relax
\newcommand{\ifbversion}[2]{ \ifthenelse{\boolean{@bversion}}{#1}{#2}} % 新定义一个命令 \ifbversion 如果 @bversion 为true 则执行 #1 否则 执行 #2


% ===============定义空白页命令=============== 
\newcommand{\blankpage@number}{\newpage\null\newpage}                  % 带页眉页脚
\newcommand{\blankpage}{\newpage\thispagestyle{empty}\null\newpage}    % 没有页眉页脚




% //////////////////////////////////////// 页边距设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\ifpversion{ % 打印版，内侧页边距大，外侧小👇
	\geometry{inner=3cm, outer=2cm, top=3cm, bottom=2cm}
}{ % 电子版页边距相同👇
	\geometry{left=2.5cm, right=2.5cm, top=3cm, bottom=2cm, headsep=0.3cm, footskip=0.7cm}
}




% //////////////////////////////////////// 字体设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\newcommand{ \AutoFakeCJKOptions } { AutoFakeBold=2.5, AutoFakeSlant=true }

\ifwindows
	\setCJKmainfont[\AutoFakeCJKOptions]{SimSun}                    % 在Windows平台上设置中文字体为SimSun
	\setCJKmonofont[\AutoFakeCJKOptions]{SimSun}					% 使用宋体作为等宽字体
	\newCJKfontfamily{\kaiti}[AutoFakeBold=2.5]{KaiTi}              % 设置楷体字体为KaiTi 
	\newCJKfontfamily{\heiti}[\AutoFakeCJKOptions]{SimHei}          % 设置黑体字体为SimHei
	\newCJKfontfamily{\songti}[\AutoFakeCJKOptions]{SimSun}
	\setmainfont{Times New Roman}                                   % 设置英文字体为Times New Roman
\else
	\ifmacosx
		\setCJKmainfont[\AutoFakeCJKOptions]{Songti SC}             % 在macOS平台上设置中文字体为Songti SC
		\setCJKmonofont[\AutoFakeCJKOptions]{Songti SC}				% 使用宋体作为等宽字体
		\newCJKfontfamily{\kaiti}[AutoFakeBold=2.5]{KaiTi}          % 设置楷体字体为KaiTi
		\newCJKfontfamily{\heiti}[\AutoFakeCJKOptions]{STHeiti}     % 设置黑体字体为STHeiti
		\newCJKfontfamily{\songti}[\AutoFakeCJKOptions]{Songti SC}
		\setmainfont{Times New Roman}                               % 设置英文字体为Times New Roman
	\else
        % 在其他平台设置中文和英文字体
		\newcommand{ \SetCJKfont } [2] {
			\IfFileExists { ./Fonts/#2 } 
				{ #1 [ \AutoFakeCJKOptions, Path=./Fonts/ ] { #2 } }
				{ \ClassError { 字体缺失 } { 请下载 #2 并放置于 ./Fonts/ 目录，或运行脚本下载 } }
		}
        \SetCJKfont{\setCJKmainfont}{FZ-ShuSong.ttf}  				% 设置中文主字体
		\SetCJKfont{\setCJKmonofont}{FZ-ShuSong.ttf}  				% 使用宋体作为等宽字体
        \SetCJKfont{\newCJKfontfamily{\kaiti}}{FZ-KaiTi.ttf}		% 设置楷体
        \SetCJKfont{\newCJKfontfamily{\heiti}}{FZ-HeiTi.ttf}	
		\SetCJKfont{\newCJKfontfamily{\songti}}{FZ-ShuSong.ttf}
		\setmainfont[                                               % 英文字体应用 stixfonts 字体 (Times New Roman 风格)
					BoldFont=STIXTwoText-Bold.otf,                  % 粗体字体
					ItalicFont=STIXTwoText-Italic.otf,              % 斜体字体
					BoldItalicFont=STIXTwoText-BoldItalic.otf,      % 指定字体文件路径为./Fonts/
					]{STIXTwoText-Regular.otf}
    \fi
\fi


% ================定义数学字体设置===============
% 定义数学字体 \mathbf
% \DeclareMathAlphabet{\mathbf}{\eu@enc}{\eu@mathrm}{\bfdefault}{it}

% 参数解释：
% - \eu@enc: 字体编码，可以是任意有效的字体编码
% - \eu@mathrm: 字母字体，通常为欧拉字体
% - \bfdefault: 字体系列，通常为默认粗体系列
% - it: 字体形状，通常为斜体形状

% 定义数学字体 \mathbd
% \DeclareMathAlphabet{\mathbd}{\eu@enc}{\eu@mathrm}{\bfdefault}{n}

% 参数解释：
% - \eu@enc: 字体编码，可以是任意有效的字体编码
% - \eu@mathrm: 字母字体，通常为欧拉字体
% - \bfdefault: 字体系列，通常为默认粗体系列
% - n: 字体形状，通常为正常字形状

% 定义数学命令 \bm，其效果为使用 \mathbf 字体
% \newcommand{\bm}{\mathbf}

% \bm: 数学命令，用于使用 \mathbf 字体
% 注：\bm 可以替代 \mathbf 使用，提供更简洁的输入方式。




% ================定义高亮命令设置===============
\newcommand{\hl}{\CJKsout*[thickness=2.5ex,format=\color{yellow}]} 	% 新定义高亮命令\gl 用来高亮显示中文




% //////////////////////////////////////// 封面设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ===============设置时间格式===============
\renewcommand{\today}{\number\year 年 \number\month 月 \number\day 日}


% ===============封面信息引用定义===============
\newcommand{\zh@TheTitle}{\quad}          										% 中文标题
\newcommand{\en@TheTitle}{\quad}          										% 英文标题
\newcommand{\TheAuthor}{\quad}            										% 作者
\newcommand{\TheAdvisor}{\quad}           										% 导师姓名
\newcommand{\TheProtitle}{\quad}          										% 导师职称
\newcommand{\TheSchool}{\quad}            										% 学院
\newcommand{\TheMajor}{\quad}             										% 专业
\newcommand{\TheResearchDirection}{\quad} 										% 研究领域
\newcommand{\TheDegreeCategories}{\quad}  										% 申请学位门类
\newcommand{\TheStudentNumber}{\quad}     										% 学号
\newcommand{\TheSecrets}{\qquad}          										% 密级
\newcommand{\TheDate}{\quad}              										% 论文答辩日期


% ===============封面信息定义===============
\newcommand{\Title}[2]{
	\renewcommand{\zh@TheTitle}{#1}                     						% 中文标题
	\renewcommand{\en@TheTitle}{#2}                     						% 英文标题
}
\newcommand{\Author}[1]{\renewcommand{\TheAuthor}{#1}}                      	% 作者
\newcommand{\Advisor}[1]{\renewcommand{\TheAdvisor}{#1}}                    	% 导师
\newcommand{\Protitle}[1]{\renewcommand{\TheProtitle}{#1}}                  	% 导师职称
\newcommand{\School}[1]{\renewcommand{\TheSchool}{#1}}                      	% 学院
\newcommand{\Major}[1]{\renewcommand{\TheMajor}{#1}}                        	% 专业
\newcommand{\ResearchDirection}[1]{\renewcommand{\TheResearchDirection}{#1}}	% 研究领域
\newcommand{\DegreeCategories}[1]{\renewcommand{\TheDegreeCategories}{#1}}  	% 申请学位门类
\newcommand{\StudentNumber}[1]{\renewcommand{\TheStudentNumber}{#1}}        	% 学号
\newcommand{\Secrets}[1]{\renewcommand{\TheSecrets}{#1}}                    	% 密级
\newcommand{\Date}[1]{\renewcommand{\TheDate}{#1}}                          	% 论文答辩日期
\newcommand{\removeAmpersand}[1]{                                           	% 定义新命令 \removeAmpersand 用于去掉中文题目中的 \\& 命令 
	\expandafter\StrSubstitute\expandafter{#1}{\\&}{}[\result]%
	\result
}

% ====================本硕博选项声明====================
%\DeclareOption{选项}{代码}其中的选项就是选项的名称，而代码就是选项要执行的指令集。
\DeclareOption{bachelor}{
	\def\DegreeName{本科}
	\def\BookTitle{本科毕业设计（论文）}
	\def\DisplayHeader{桂林电子科技大学本科生学位论文}
}
\DeclareOption{master}{
	\def\DegreeName{硕士}
	\def\BookTitle{硕\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
	\def\DisplayHeader{桂林电子科技大学硕士学位论文}
}
\DeclareOption{promaster}{
	\def\DegreeName{专业硕士}
	\def\BookTitle{硕\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
	\def\DisplayHeader{桂林电子科技大学硕士学位论文}
}
\DeclareOption{ojmaster}{
	\def\DegreeName{在职硕士}
	\def\BookTitle{硕\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
	\def\DisplayHeader{桂林电子科技大学硕士学位论文}
}
\DeclareOption{ptmaster}{
	\def\DegreeName{非全硕士}
	\def\BookTitle{硕\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
	\def\DisplayHeader{桂林电子科技大学硕士学位论文}
}
\DeclareOption{doctor}{
	\def\DegreeName{博士}
	\def\BookTitle{博\enspace 士\enspace 学\enspace 位\enspace 论\enspace 文}
	\def\DisplayHeader{桂林电子科技大学博士学位论文}
}
\ExecuteOptions{master} % 默认值为硕士
\ProcessOptions\relax


% ===============判断学位类别的命令定义===============
\newcommand{\ifbachelor}[2]{\ifthenelse{\equal{\DegreeName}{本科}}{#1}{#2}}   							   % 如果学位名是本科则执行#1命令，否执行#2命令
\newcommand{\ifpromaster}[1]{\ifthenelse{\equal{\DegreeName}{专业硕士}}{#1}{}}								% 如果学位名是专业硕士则执行#1命令
\newcommand{\ifmaster}[1]{\ifthenelse{\equal{\DegreeName}{硕士}}{#1}{}}       							   % 如果学位名是硕士则执行#1命令
\newcommand{\ifojmaster}[1]{\ifthenelse{\equal{\DegreeName}{在职硕士}}{#1}{}} 								% 如果学位名是在职硕士则执行#1命令
\newcommand{\ifptmaster}[1]{\ifthenelse{\equal{\DegreeName}{非全硕士}}{#1}{}} 								% 如果学位名是非全硕士则执行#1命令
\newcommand{\ifdoctor}[1]{\ifthenelse{\equal{\DegreeName}{博士}}{#1}{}}       							   % 如果学位名是博士则执行#1命令
\newcommand{\ifpro}[2]{\ifthenelse{\equal{\DegreeName}{专业硕士} \or \equal{\DegreeName}{非全硕士}}{#1}{#2}} % 判断是否是专业硕士或非全硕士


% ==============封面设置=============== 定义封面命令
\newcommand{\MakeCover}
{
	\thispagestyle{empty}                                     % 没有页眉页脚，空白页
	\setlength{\extrarowheight}{9pt}
	\pdfbookmark{封面}{cover}

	\setlength{\TPHorizModule}{1cm}                           % 设置textblock环境的水平单位    
	\setlength{\TPVertModule}{1cm}                            % 设置textblock环境的垂直单位      


	% ================设置密级格式================
	\ifbachelor{ % 本科无密级👇
	}{ % 硕博密级👇
		\begin{textblock}{5}(12.6,2.1)
			% \textblockcolour{red!30} % 设置背景颜色
			\begin{flushright}
				密\enspace 级 \underline{\makebox[7em][c]{\TheSecrets}}
			\end{flushright}
		\end{textblock}
	}

	% ================设置LOGO================
	\ifbachelor{ % 本科LOGO👇
		\begin{textblock}{15}(3,3.2)
			\centering
			\ifpversion{
				\includegraphics[width=0.95 \textwidth]{./Pictures/Guet-logo-black.pdf}
			}{
				\includegraphics[width=0.95 \textwidth]{./Pictures/Guet-logo.pdf}
			}
		\end{textblock}
	}{ % 硕博LOGO👇
		\begin{textblock}{15}(3,4.4)
			\centering
			\ifpversion{
				\includegraphics[width=0.95 \textwidth]{./Pictures/Guet-logo-black.pdf}
			}{
				\includegraphics[width=0.95 \textwidth]{./Pictures/Guet-logo.pdf}
			}
		\end{textblock}
	}


	% ================设置学位类别================
	\begin{textblock}{10}(5.5,7.85)
		\centering
		\ifbachelor{% 本科👇
			\fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\BookTitle}\\
		}{}
	\end{textblock}

	\begin{textblock}{10}(5.5,7.85)
		\centering
		\ifpromaster{ % 专硕👇
			\fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\BookTitle} \\
			\fontsize{18pt}{26pt}\selectfont{\bfseries（全日制专业学位硕士）}\\
		}
		\ifojmaster{ % 在职学硕👇
			\fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\BookTitle} \\
			\fontsize{18pt}{26pt}\selectfont{\bfseries（在职研究生）}\\
		}
		\ifptmaster{ % 非全专硕👇
			\fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\BookTitle} \\
			\fontsize{18pt}{26pt}\selectfont{\bfseries（非全日制专业学位硕士）}\\
		}

		\ifmaster{ % 学硕👇
			\fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\BookTitle}\\
		}
		\ifdoctor{ % 博士👇
			\fontsize{26pt}{26pt}\selectfont{\heiti\bfseries\BookTitle}\\
		}
	\end{textblock}


	% ================设置题目================
	\NewExpandableDocumentCommand\zh@TheTitle@tb{}{\zh@TheTitle} % 创建外部参数，导入题目表格中
	\NewExpandableDocumentCommand\en@TheTitle@tb{}{\en@TheTitle}
	\ifbachelor{ % 本科题目 👇
		\begin{textblock}{15}(2.8,11.3)
			\centering
			\begin{tblr}[expand=\expanded]
				{
					stretch=1.2,                                                          % 单元格文本行距拉伸系数
					colspec = {c c},                                                      % 设置列对齐方式
					column{1} = {1.4cm},                                                  % 设置第一列宽度
					column{2} = {11.4cm,font =\bfseries\fontsize{16pt}{16pt}\selectfont}, % 设置第二列的宽度、字体大小粗细
					hline{2-Z} = {2}{1pt},                                                % 从第二行到最后一行（Z）存在横线（hline{2-Z}），第二列横线宽1.5pt（{2}{1.5pt}）
					belowsep = {-4pt}                                                     % 单元格底线向上偏移4pt
				}
				\bfseries\fontsize{16bp}{16bp}\selectfont 题目: & \expanded{\zh@TheTitle@tb{}}
			\end{tblr}
		\end{textblock}

	}{ % 硕博题目👇
		\ifbversion{ % 盲审封面👇
		}{ % 非盲审封面👇
			\begin{textblock}{15}(2.9,9.6)
				\centering
				\ifpromaster{\vspace{0.9cm}} % 专硕
				\ifojmaster{\vspace{0.9cm}}  % 在职学硕
				\ifptmaster{\vspace{0.9cm}}  % 非全专硕
				\begin{tblr}[expand=\expanded]
					{
						stretch=2,                                                            % 单元格文本行距拉伸系数
						colspec = {c c},                                                      % 设置列对齐方式
						column{1} = {1.5cm},                                                  % 设置第一列宽度
						column{2} = {12.6cm,font =\bfseries\fontsize{14bp}{26bp}\selectfont}, % 设置第二列的宽度、字体大小粗细
						hline{2-Z} = {2}{1.25pt},                                             % 从第二行到最后一行（Z）存在横线（hline{2-Z}），第二列横线宽1.5pt（{2}{1.5pt}）
						belowsep = {-8pt}                                                     % 单元格底线向上偏移8pt
					}
					\bfseries\fontsize{16bp}{16bp}\selectfont 题目   & \expanded{\zh@TheTitle@tb{}} \\
					\bfseries\fontsize{14bp}{14bp}\selectfont (英文) & \expanded{\en@TheTitle@tb{}}
				\end{tblr}
			\end{textblock}
		}
	}


	% ================设置信息格式================

	\ifbachelor{ % 本科封面信息 👇
		\begin{textblock}{16}(2.4,16.9)
			\centering
			\begin{tblr}
				{
					stretch=1.9,
					colspec = {c c}, % 第一列分散对齐，第二列居中对齐
					column{1} = {4cm, font=\bfseries\fontsize{15pt}{15pt}\selectfont}, % 关键点：添加 halign=j
					column{2} = {9.6cm, font=\fontsize{15pt}{15pt}\selectfont},
					hline{2-Z} = {2}{1pt},
					belowsep = {-7pt}
				}
				学\hfill 号:        & \TheStudentNumber \\
				姓\hfill 名:        & \TheAuthor        \\
				学\hfill 院:        & \TheSchool        \\
				专\hfill 业:        & \TheMajor         \\
				指\hfill 导\hfill 教\hfill 师:    & \TheAdvisor       \\
				指\hfill 导\hfill 教\hfill 师\hfill 职\hfill 称:& \TheProtitle
			\end{tblr}
		\end{textblock}

		\begin{textblock}{8}(6,26.9) % 日期居中
			\centering\fontsize{16pt}{16pt}\selectfont \TheDate
		\end{textblock}

	}{ % 硕博封面信息 👇
		\ifbversion{ % 盲审封面👇
			\begin{textblock}{16}(2.5,14.8)
				\bfseries\fontsize{16bp}{16bp}\selectfont
				\centering
				\begin{tblr}[expand=\expanded]
					{
						stretch=1.9,                                                          % 单元格文本行距拉伸系数
						colspec = {ll},                                                       % 设置列对齐方式
						column{1} = {4.5em},                                                  % 设置第一列宽度
						column{2} = {22em},                                                   % 设置第二列的宽度、字体大小粗细
						leftsep=0pt,                                                          % 设置单元内容的左边距为零
					}
					题\qquad 目： & \expanded{\zh@TheTitle@tb{}} \\
					专\qquad 业： & \TheMajor                    \\
					研究方向：     & \TheResearchDirection
				\end{tblr}
			\end{textblock}
		}{ % 非盲审封面👇
			\begin{textblock}{15}(2.9,16.3) %
				\centering
				\ifpro{ % 专硕或非全专硕的封面信息 👇
					\begin{tblr}
						{
							stretch=2.2,                                                           % 单元格文本行距拉伸系数
							colspec = {c c},                                                       % 设置列对齐方式
							column{1} = {5cm, font = \bfseries\fontsize{15pt}{15pt}\selectfont},   % 设置第一列宽度
							column{2} = {6.5cm, font = \bfseries\fontsize{15pt}{15pt}\selectfont}, % 设置第二列的宽度、字体大小粗细
							hline{2-Z} = {2}{1.25pt},                                              % 从第二行到最后一行（Z）存在横线（hline{2-Z}），第二列横线宽1.5pt（{2}{1.5pt}）
							belowsep = {-11pt}                                                     % 单元格底线向上偏移11pt
						}
						研\quad 究\quad 生\quad 学\quad 号:                          & \TheStudentNumber                 \\
						研\quad 究\quad 生\quad 姓\quad 名:                           & \TheAuthor                        \\
						指导教师姓名、职称:                                            & \TheAdvisor \enspace \TheProtitle \\
						申\enspace 请专业学位类别\enspace :                            & \TheDegreeCategories              \\
						专\hspace{1.5em}业\hspace{1.5em}名\hspace{1.5em}称\enspace : & \TheMajor                         \\
						论\enspace 文\enspace 答\quad 辩\enspace 日\enspace 期:       & \TheDate
					\end{tblr}
				}{ % 博士、学硕、在职硕士的封面信息 👇
					\begin{tblr}
						{
							stretch=2.2,
							colspec = {c c},
							column{1} = {5cm, font = \bfseries\fontsize{15pt}{15pt}\selectfont},
							column{2} = {6.5cm, font = \bfseries\fontsize{15pt}{15pt}\selectfont},
							hline{2-Z} = {2}{1.25pt},
							belowsep = {-11pt}
						}
						研\quad 究\quad 生\quad 学\quad 号:                    & \TheStudentNumber                 \\
						研\quad 究\quad 生\quad 姓\quad 名:                    & \TheAuthor                        \\
						指导教师姓名、职称:                                        & \TheAdvisor \enspace \TheProtitle \\
						申请学位学科门类\quad :                                   & \TheDegreeCategories              \\
						学\quad 科（专\qquad 业）:                              & \TheMajor                         \\  %使用box可以更好地均分空间，推荐将其他几个参数也进行合适的修改
						论\enspace 文\enspace 答\quad 辩\enspace 日\enspace 期: & \TheDate
					\end{tblr}
				}
			\end{textblock}
		}
	}
	~\\ % 在当前位置插入一个不可断行的空格，并开始新的一行

	\setlength{\extrarowheight}{2pt}

	%判断是否为打印
	\ifpversion{\blankpage}{}
}

% ------ 由于已经开发了盲审封面，该功能暂时没有用处，所以注释掉 ------
% % ====================导入封面PDF文件设置====================   |
% \newcommand{\bindpdfcover}[1]{                                 |
%   \pdfbookmark{封面}{cover}                                    |
%   \includepdf[pages=-]{#1}                                     |
%   \newpage\setcounter{page}{0}                                 |
% }                                                              |
% ---------------------------------------------------------------



% //////////////////////////////////////// 独创性（或创新性）声明设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\newcommand{\OriginalityDeclaration}{
	\ifbversion{ % 盲审不显示授权声明👇
	}{ % 非盲审显示独创性声明👇
		\newpage
		\thispagestyle{empty} %没有页眉页脚，空白页

		\begin{spacing}{1.5}
			\pdfbookmark{独创性（或创新性）声明}{OriginalityDeclaration}
			\ifbachelor{ % 本科独创性声名👇
				\begin{center}
					\fontsize{14pt}{21pt}\selectfont\bfseries 本科生毕业设计（论文）独创性声名
				\end{center}

				本人声明所呈交的毕业设计（论文）是我个人在指导老师指导下进行的工作及取得的成果。
				尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，文中不包含其他人或其它机构已经发表或撰写过的成果；
				也不包含为获得桂林电子科技大学或其他教育机构的学位或证书而使用过的材料。
				其他同志对本工作的启发和所做的任何贡献均已在毕业设计（论文）中做了明确的说明并表示了谢意。

				\vspace{0.5cm}毕业设计（论文）若有不实之处，本人承担一切相关责任。

				\vspace{1.5cm}本人签名：\hspace{7em}日期：\vspace{2cm}

				\begin{center}
					\fontsize{14pt}{21pt}\selectfont\bfseries 本科生毕业设计（论文）使用授权说明
				\end{center}

				桂林电子科技大学有权保留并向国家有关部门或机构送交毕业设计说明书（论文）的复印件，允许毕业设计（论文）被查阅和借阅。
				本人授权桂林电子科技大学可以公布毕业设计（论文）的全部或部分内容，可以采用影印、缩印或其它复制手段保存、汇编毕业设计（论文）

				\vspace{1.5cm}本人签名：\hspace{7em}日期：

				\vspace{1cm}导师签名：\hspace{7em}日期：

			}{ % 硕博独创性声名👇
				\begin{center}
					\fontsize{14pt}{21pt}\selectfont\bfseries 独创性声明
				\end{center}

				本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。
				尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，论文中不包含其他人已经发表或撰写过的研究成果；
				也不包含为获得桂林电子科技大学或其它教育机构的学位或证书而使用过的材料。
				与我一同工作的同志对本研究所做的任何贡献均已在论文中做了明确的说明并表示了谢意。

				\vspace{0.5cm}申请学位论文与资料若有不实之处，本人承担一切相关责任。

				\vspace{0.5cm}本人签名：\hspace{7em}日期：
				\vspace{1.5cm}

				\begin{center}
					\fontsize{14pt}{21pt}\selectfont\bfseries 关于论文使用授权的说明
				\end{center}

				本人完全了解桂林电子科技大学有关保留和使用学位论文的规定，即：研究生在校攻读学位期间论文工作的知识产权单位属桂林电子科技大学。
				本人保证毕业离校后，结合学位论文研究成果完成的论文、发明专利等成果，署名单位仍然为桂林电子科技大学。
				学校有权保留送交论文的复印件，允许查阅和借阅论文；
				学校可以公布论文的全部或部分内容，可以允许采用影印、缩印或其它复制手段保存论文。
				（保密的论文在解密后遵守此规定）

				\vspace{1.9cm}本人签名：\hspace{7em}日期：

				\vspace{0.5cm}导师签名：\hspace{7em}日期：
			}
		\end{spacing}

		\ifpversion{\blankpage}{}
	}
}


% ====================导入独创性声明定义PDF文件设置====================
\newcommand{\SignatureDeclaration}[1]
{
	\includepdf[pages=-]{#1}
	\ifpversion{\blankpage}{}
}




% //////////////////////////////////////// 不太明白的设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\urlstyle{rm}
\raggedbottom % 将当前页面的底部对齐方式设置为“不齐平”

% //////////////////////////////////////// 摘要关键词设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

%=========================中文摘要环境定义=========================
\newenvironment{ChineseAbstract}
{
	% 设置目录和标题内容
	\ifbachelor{ % 本科摘要格式设置 👇
		\renewcommand{\BachelorChapterFormat}{\centering}                 % 标题临时居中，因本科摘要标题要求居中
		\chapter*{\texorpdfstring{摘\quad 要}{摘要}}             % 本科摘要标题加粗
		\renewcommand{\BachelorChapterFormat}{}                          % 标题恢复全局设置
	}{ % 硕博摘要格式设置 👇
		\chapter*{\texorpdfstring{摘\quad 要}{摘要}}               % 硕博摘要标题黑体
	}
	\addcontentsline{toc}{chapter}{\texorpdfstring{摘\quad 要}{摘要}} % 设置在目录显示

	% 设置页眉页脚
	\fancyhf{}                                                          % 初始化页码页脚布局
	\setcounter{page}{1} 

	\ifbachelor{ % 本科摘要页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 桂林电子科技大学毕业设计（论文）}                                    % 设置页眉
		\fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref{page:tableofcontents} 页} % 设置页脚
	}{ % 硕博摘要页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 摘\quad 要}                                                    % 设置页眉
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}                                                     % 罗马页码居中显示
	}
}{
	\ifpversion{
		\checkoddpage
		\ifoddpage
			\blankpage
		\else
			\newpage
		\fi
	}{
		\newpage
	}
}


%=========================中文关键字=========================
\newcommand{\ChineseKeyword}[1]{
	\vspace{\baselineskip}
	\@hangfrom{\makebox[48pt][l]{\textbf{关键词：}}}#1
}


%=========================英文摘要环境定义=========================
\newenvironment{EnglishAbstract}
{
	% 设置目录和标题内容
	\ifbachelor{ % 本科英文摘要格式设置 👇
		\renewcommand{\BachelorChapterFormat}{\centering}
		\chapter*{Abstract} % 本科英文摘要标题首字母大写
		\renewcommand{\BachelorChapterFormat}{}
	}{ % 硕博英文摘要格式设置 👇
		\chapter*{ABSTRACT}
	}
	\addcontentsline{toc}{chapter}{ABSTRACT} % 设置在目录显示	
	\fancyhf{}

	\ifbachelor{ % 本科英文摘要页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 桂林电子科技大学毕业设计（论文）}
		\fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref{page:tableofcontents} 页}
	}{ % 硕博英文摘要页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont ABSTRACT}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	}

}{
	\ifpversion{
		\checkoddpage
		\ifoddpage
			\blankpage
		\else
			\newpage
		\fi
	}{
		\newpage
	}
}


%=========================英文关键字=========================
\newcommand{\EnglishKeyword}[1]
{
	\vspace{\baselineskip}
	\@hangfrom{\makebox[2.1cm][l]{\textbf{Keywords:}}}#1
}

% //////////////////////////////////////// 目录设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ====================目录标题格式设置==================== 定义插入目录命令
\ifbachelor{ % 本科目录标题使其居中 👇
	\newcommand{\ThesisContents}
	{
		\renewcommand{\BachelorChapterFormat}{\centering} % 目录标题居中
		\begin{spacing}{2}                                % 本科目录两倍行距
			\tableofcontents
		\end{spacing}
		\renewcommand{\BachelorChapterFormat}{}           % 还原初始设置
		\label{page:tableofcontents}                      % 设置pageref获取页码数的标记

		\ifpversion{ % 打印版本切换
			\checkoddpage
			\ifoddpage
				\blankpage@number
			\else
				\newpage
			\fi
		}{}
	}
}{ % 硕博目录标题统一居中无需更改 👇
	\newcommand{\ThesisContents}{
		\tableofcontents
		\ifpversion{ % 打印版本切换
			\checkoddpage
			\ifoddpage
				\blankpage@number
			\else
				\newpage
			\fi
		}{}
	}
}


% ====================目录标题内容设置====================
\renewcommand{\contentsname}{目\quad 录}   % 使默认的Contents改为目 录显示


% =========================目录页眉页脚设置=========================
\pretocmd{\tableofcontents}{
	\newpage
	\fancyhf{}

	\ifbachelor{ % 本科目录页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 桂林电子科技大学毕业设计（论文）}
		\fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref{page:tableofcontents} 页}
	}{ % 硕博目录页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 目\quad 录}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	}
	\pdfbookmark{目录}{toc}
}{}{}


% ====================目录深度设置====================
\setcounter{tocdepth}{2}                             % 设置目录深度


% =========================目录样式设置=========================
\tocloftpagestyle{fancy}                             % 设置目录页码样式为fancy
\renewcommand{\cftchappagefont}{\normalfont}         % 设置目录章节页码字体为正常字体
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}} % 设置目录章节页码连接线为点线
\renewcommand{\cftdotsep}{0.4}                       % 设置目录页码连接点之间的距离为0.4em


% =========================目录内页码宽度设置=========================
\AddToHook {shipout/background}{\addtocontents{toc}{\protect\cftsetpnumwidth{\widthof{\thepage}-1pt}}}
% \cftsetpnumwidth 命令用于设置页码宽度的值，\widthof{\thepage} 命令用于计算页码的宽度


% =========================目录缩进设置=========================
\ifbachelor{ % 本科目录格式 👇
	\cftsetindents{chapter}{0pt}{20pt}
	\cftsetindents{section}{2em}{25pt}
	\cftsetindents{subsection}{4em}{30pt}
	\cftsetindents{subsubsection}{0pt}{41pt}
	% 本科目录字体大小
	\renewcommand\cftchapfont{\fontsize{15pt}{15pt}\selectfont\heiti}
	\renewcommand\cftsecfont{\fontsize{14pt}{14pt}\selectfont\songti}
	\renewcommand\cftsubsecfont{\fontsize{14pt}{15pt}\selectfont\kaiti}
}{ % 硕博目录格式 👇
	\addtolength{\cftchapnumwidth}{25pt}
	\renewcommand{\cfttoctitlefont}{\fontsize{15pt}{15pt}\selectfont\heiti}
	\renewcommand\cftchapfont{\songti}
}


% ====================目录行距设置====================
\setlength{\cftbeforetoctitleskip}{0pt}    % 设置目录标题前的垂直距离为0pt
\setlength{\cftaftertoctitleskip}{18pt}    % 设置目录标题后的垂直距离为18pt
\setlength{\cftbeforechapskip}{0pt}        % 设置章节标题前的垂直距离为0pt




% //////////////////////////////////////// 插图索引设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% =========================插图索引标题格式设置========================= 定义插图索引命令
\ifbachelor{ % 定义本科插图索引 👇
	\newcommand{\ThesisFigureList}
	{
		\renewcommand{\BachelorChapterFormat}{\centering} % 设置标题居中
		\setstretch{2.0}                                  % 设置二倍行距
		\listoffigures
		\setstretch{1.389}                                % 行距设置回20磅
		\renewcommand{\BachelorChapterFormat}{}           % 还原初始设置：左对齐
	}
}{ % 定义硕博插图索引命令 👇
	\newcommand{\ThesisFigureList}{\listoffigures}        % 自定义调用\listoffigures的命令
}
	% =========================插图索引页眉页脚设置=========================
\pretocmd{\listoffigures}
{  														  % 图目录是存放在.lof目录的文件下
	\clearpage 											  % 确保独立页
	\phantomsection 									  % 用于建立正确的PDF锚点！
	\fancyhf{}   										  % 初始化页码页脚布局

	\ifbachelor{ % 本科插图索引页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont{桂林电子科技大学毕业设计（论文）}}
		\fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref{page:tableofcontents} 页}
	}{ % 硕博插图索引页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont{插图索引}}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	}
	\addtolength{\cftfignumwidth}{12pt}                   % 设置长度命令，使命令\cftfignumwidth的长度设置为12pt，条目编号与条目内容之间占用的宽度, 例如：图 1-2 [\cftfignumwidth] 电子战飞机
	\renewcommand{\cftfigpresnum}{图}                      % 条目编号前内容  
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}} % 将目录深度设置为0 就会在目录中显示
	\addcontentsline{toc}{chapter}{插图索引} 			    % 设置在目录显示插图索引
}{}{}

% ====================插图索引标题内容设置====================
\renewcommand{\listfigurename}{插图索引}                 % 修改插图索引名称


% =========================插图索引内页码宽度设置=========================
\AddToHook {shipout/background}{\addtocontents{lof}{\protect\cftsetpnumwidth{\widthof{\thepage}-1pt}}}




% //////////////////////////////////////// 插表索引设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ====================插表索引格式设置==================== 定义插表索引命令
\ifbachelor{ % 定义本科插表索引 👇
	\newcommand{\ThesisTableList}
	{
		\renewcommand{\BachelorChapterFormat}{\centering} % 设置标题居中
		\setstretch{2.0}                                  % 设置二倍行距
		\listoftables
		\setstretch{1.389}                                % 行距设置回20磅
		\renewcommand{\BachelorChapterFormat}{}           % 还原初始设置：左对齐
	}
}{ % 定义硕博插表索引命令 👇
	\newcommand{\ThesisTableList}{\listoftables}        % 自定义\ThesisTableList命令
}
% =========================插表索引页眉页脚设置=========================
\pretocmd{\listoftables}
{ % 表目录是存放在.lot目录的文件下
	\clearpage % 确保独立页
	\phantomsection % 用于建立正确的PDF锚点！
	\fancyhf{}

	\ifbachelor{ % 本科插表索引页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont{桂林电子科技大学毕业设计（论文）}}
		\fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref{page:tableofcontents} 页}
	}{ % 硕博插表索引页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont{插表索引}}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	}
	\addtolength{\cfttabnumwidth}{12pt}                   % 条目编号占用宽度，条目编号与条目内容之间占用的宽度, 例如：表1-1 [\cftfignumwidth] 参数设置
	\renewcommand{\cfttabpresnum}{表}                     % 条目编号前内容
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}} % 将目录深度设置0，目录中只显示一级标题 0 为chapter
	\addcontentsline{toc}{chapter}{插表索引} % 设置在目录显示插表索引
}{}{}

% ====================插表索引标题内容设置====================
\renewcommand{\listtablename}{插表索引} % 修改插表索引名称 

% =========================插表索引内页码宽度设置=========================
\AddToHook {shipout/background}{\addtocontents{lot}{\protect\cftsetpnumwidth{\widthof{\thepage}-1pt}}}




% //////////////////////////////////////// 符号说明设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ====================符号说明页面设置==================== 定义符号说明命令
\newcommand{\ThesisSymbolList}
{ \newpage

	\renewcommand{\nomname}{符号说明}                     % 修改符号说明标题的名称。

	\ifbachelor{ % 设置本科插表索引标题 👇
		\renewcommand{\BachelorChapterFormat}{\centering} % 设置标题居中
		\setstretch{2.0}                                  % 设置二倍行距
	}{}

	\fancyhf{}

	\ifbachelor{ % 本科符号说明页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont{桂林电子科技大学毕业设计（论文）}}
		\fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref{page:tableofcontents} 页}
	}{ % 硕博符号说明页眉页码设置 👇
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont{符号说明}}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	}

	{ \small                         % 设置符号说明字体大小为五号
		\printnomenclature[1.5 cm]     % 设置术语与描述之间的距离 
	}

	\ifbachelor{ % 设置本科插表索引标题格式 👇
		\renewcommand{\BachelorChapterFormat}{} % 还原初始设置：左对齐
		\setstretch{1.389}                      % 行距设置回20磅
	}{}

	\ifpversion{ % 打印版本切换
		\checkoddpage
		\ifoddpage
			\blankpage
		\else
			\newpage
		\fi
	}{}
}


% ====================符号表格式设置====================
% 设置符号说明为双栏显示
\renewcommand*\nompreamble{\begin{multicols}{2}}
		\renewcommand*\nompostamble{\end{multicols}}

% 更改术语之间的垂直行间距
\newlength{\nomitemorigsep}
\setlength{\nomitemorigsep}{\nomitemsep}
\setlength{\nomitemsep}{-1\parsep} % Baseline skip between items


% 创建符号说明分组，
\newcommand{\SymbolGroupStyleIn}{符号分类} % 定义\SymbolGroupStyle命令，用于修改符号说明分组格式
\newcommand{\SymbolGroupStyle}[1]{\renewcommand{\SymbolGroupStyleIn}{#1}}
\renewcommand{\nomgroup}[1]{
	\ifthenelse{\equal{\SymbolGroupStyleIn}{符号分类}}
	{
		\ifthenelse
		{\equal{#1}{A}}
		{\vspace{9pt} \item[\textbf{希腊字符}]}
		{
			\ifthenelse
			{\equal{#1}{B}}
			{\vspace{9pt} \item[\textbf{下标}]}
			{
				\ifthenelse
				{\equal{#1}{C}}
				{\vspace{9pt} \item[\textbf{缩略语}]}
				{}
			}
		}
	}
	{
		\ifthenelse{\equal{\SymbolGroupStyleIn}{章节分类}}
		{
			\ifthenelse
			{\equal{#1}{A}}
			{\vspace{9pt} \item[\textbf{各章共用}]}
			{
				\ifthenelse
				{\equal{#1}{B}}
				{\vspace{9pt} \item[\textbf{第三章}]}
				{
					\ifthenelse
					{\equal{#1}{C}}
					{\vspace{9pt} \item[\textbf{第四章}]}
					{
						\ifthenelse
						{\equal{#1}{D}}
						{\vspace{9pt} \item[\textbf{第五章}]}
						{}
					}
				}
			}
		}
		{\typeout{无效的输入，请使用使用 符号分类 或 章节分类 作为参数} % 如果既不是A也不是B，则输出错误信息在log文件中
		}
	}

	\itemsep\nomitemsep % 应用上面设置的术语垂直行间距
}

\makenomenclature     % 应用符号表




% //////////////////////////////////////// 正文段落设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\renewcommand{\frontmatter}{   
	\pagenumbering{Roman} % 设置为大写罗马页码 
	}
% ===============设置全局段落格式===============
\setlength{\headheight}{17pt} % 高17pt
\pagestyle{fancy}             % 设置风格为fancy
\linespread{1.389}            % 字号大小为12bp，基本行距为12×1.2=14.4bp，欲设置行距为20bp，则因子为20/14.4=1.389
\setlength\parindent{24pt}    % 设置缩进长度 两个小四 pt：磅，bp：大点，pc：pica 




% //////////////////////////////////////// 正文页眉页脚设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ===============页眉线设置===============
\ifbachelor{ % 本科页眉单线 👇
	\renewcommand\headrule{
		\hrule height\headrulewidth width\headwidth%
		\vskip 2.4pt}
}{ % 硕博页眉双线 👇
	\renewcommand\headrule{
		\hrule height\headrulewidth width\headwidth
		\vskip 1.2pt % 设置两页眉线间距
		\hrule height\headrulewidth width\headwidth
	}
	\renewcommand{\headrulewidth}{1pt} % 设置页眉线宽度
}


% ====================正文页眉设置====================
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\hspace*{5.25pt}#1}{}} % 修改页眉章节显示内容 \markboth{<左面页眉>}{<右面页眉>}

\ifbachelor{ % 本科页眉文字 👇
	\newcommand{\StandardHeader}{
		\fancyhf{}
		\fancyhead[CE,CO]{\fontsize{10.5pt}{12.6pt}\selectfont 桂林电子科技大学毕业设计（论文）}
		\fancyhead[RE,RO]{\fontsize{10.5pt}{12.6pt}\selectfont 第\thepage 页\enspace 共 \pageref {LastPage} 页 }
	}
}{ % 硕博页眉文字 👇
	\newcommand{\StandardHeader}{
		\fancyhf{}
		\fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont\removeAmpersand{\zh@TheTitle}} % 偶数页眉内容为中文标题
		\fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\leftmark}    % 奇数页页眉使用标题
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	}
}




% //////////////////////////////////////// 标题设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ===============标题段落设置=============== 
\setcounter{secnumdepth}{3} % 设置章节深度 
\titlespacing{\chapter}{0pt}{3pt}{28pt}
\titlespacing{\section}{0pt}{20pt}{20pt}
\titlespacing{\subsection}{0pt}{19pt}{19pt}
\titlespacing{\subsubsection}{0pt}{13pt}{13pt}
% 标题周距设置，\titlespacing*{标题命令}{左间距}{上间距}{下间距} [右间距]，用它可以设置每种层次标题与四周之间的距离。


% ===============标题字体设置=============== 
\ifbachelor{ % 本科标题格式设置 👇
	\newcommand{\BachelorChapterFormat}{} % 定义\BachelorChapterFormat命令，用于修改本科一级标题格式

	\titleformat{\chapter}[block]
	{\BachelorChapterFormat\fontsize{16pt}{16pt}\selectfont\heiti\thispagestyle{fancy}} % 本科chapter格式
	{\thechapter}{1em}{}

	\titleformat{\section}[block]
	{\fontsize{14pt}{14pt}\selectfont\heiti} % \heiti 设置为粗体
	{\thesection}{0.5em}{}

	\titleformat{\subsection}[block]
	{\fontsize{14pt}{14pt}\selectfont\kaiti}
	{\thesubsection}{0pt}{}

	\titleformat{\subsubsection}[block]
	{\fontsize{12pt}{12pt}\selectfont}
	{\thesubsubsection}{0pt}{}
	\renewcommand{\thesubsubsection}{（\arabic{subsubsection}）}
}{ % 硕博标题格式设置 👇
	\titleformat{\chapter}[block]
	{\centering\fontsize{16pt}{16pt}\selectfont\heiti\thispagestyle{fancy}}
	{\thechapter}{7.5pt}{}

	\titleformat{\section}[block]
	{\centering\fontsize{14pt}{14pt}\selectfont}
	{\thesection}{7pt}{}

	\titleformat{\subsection}[block]
	{\fontsize{14pt}{14pt}\selectfont}
	{\thesubsection}{7pt}{}

	\titleformat{\subsubsection}[block]
	{\fontsize{12pt}{12pt}\selectfont}
	{\thesubsubsection}{6pt}{}
	\renewcommand{\thesubsubsection}{\arabic{subsubsection}.} % 四级标题格式设置为 1.
}


% ===============标题格式设置===============  
\ifbachelor{ % 本科小节编号格式 👇
	\renewcommand\thechapter{\arabic{chapter}}
	\renewcommand\thesection{\arabic{chapter}.\arabic{section}}
}{ % 硕博小节编号格式 👇
	\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}       % \zhnumber{计数器}，使计数器值输出为汉字格式。
	\renewcommand\thesection{\S\arabic{chapter}.\arabic{section}}
}
% \the计数器，显示计数器的值，该命令只使用于序号计数器，例如\thepage显示当前页码。
% \value{计数器}调用计数器的值，无论计数器的计数形式如何都被转换成对应的阿拉伯数字。 \S 标题前加特数符号
% chapter章序号计数器，section节序号计数器，subsection小节序号计数器，subsubsection小小节序号计数器，paragraph段序号计数器，figure插图序号计数器，table表格序号计数器，page页码序号计数器，equation公式序号计数器


% ===============标题引用格式=============== cleveref 宏包
% 更改引用前缀 参数二为单独引用 参数三为多个引用
\crefname{chapter}{}{}
\crefname{section}{}{}
\crefname{subsection}{}{}




% //////////////////////////////////////// 图表公式设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ===============图表题注样式设置=============== 
\renewcommand{\figurename}{图}                          % 使默认的图名字改为图显示
\renewcommand{\tablename}{表}                           % 使默认的表名字改为表显示
\renewcommand{\thesubfigure}{(\alph{subfigure})}        % 设置子图标题序号 
\renewcommand{\thesubtable}{(\alph{subtable})}          % 设置子表标题序号 
\counterwithin{figure}{chapter}                         % 设置figure计数器每章重置
\counterwithin{table}{chapter}                          % 设置table计数器每章重置

\ifbachelor{ % 本科图表公式题注编号格式 👇
	\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}} % 显示公式编号，其格式x.x
	\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}       % 显示表格编号，其格式x.x
	\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}     % 显示插图编号，其格式x.x
}{ % 硕博图表公式题注编号格式 👇
	\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}} % 显示公式编号，其格式x-x
	\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}       % 显示表格编号，其格式x-x
	\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}     % 显示插图编号，其格式x-x
}


% ===============图表题注格式设置=============== caption 与 subcaption 宏包
\captionsetup{width=\textwidth - 60pt}                  % 设置图表标题的宽度为页面文本宽度减去 60pt
\captionsetup[table]{aboveskip=0pt, belowskip=6pt}      % 设置 table 环境
\captionsetup[figure]{aboveskip=3pt, belowskip=0pt}     % 设置 figure 环境
\captionsetup[subfoat]{aboveskip=2pt, belowskip=2pt}    % 设置 subfoat 环境
\captionsetup[subfigure]{aboveskip=2pt, belowskip=2pt}  % 设置 subfigure 环境
\captionsetup[subtable]{aboveskip=2pt, belowskip=2pt}   % 设置 subtable 环境
% 设置标题与插图或表格之间的垂直距离，子图环境可加 width=36pt 设置子图标题的宽度 

\setlength{\intextsep}{9pt} % 控制出现在页⾯中间的浮动体与上下方文本之间的垂直距离
% \setlength{\textfloatsep}{6pt} % 控制出现在页⾯的顶部或底部的浮动体与⽂本之间的垂直距离

% \captionsetup[浮动体类型]{参数1=选项, 参数2=选项,…}其中可选参数浮动体类型的选项可以是figure或table,如果省略该参数, 则表示这两种浮动体都适用。
% \captionsetup{format=hang} 
% caption 工具包在加载时可以修改标题的很多方面，也可以通过 captionsetup命令也可以在工具包选项中修改。
% format：plain默认值,将标题作为普通段落排版。
% hang 将标题从第二行起悬挂缩进排版，缩进宽度等于标题标志加分隔符的宽度。
% indention 设置从标题第二行起的附加缩进宽度, 例如indention=5mm,其默认值是0pt。


% ===============图表公式算法引用样式设置=============== cleveref 宏包
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\crefname{algorithm}{算法}{算法}
\crefname{algocf}{算法}{算法}

\newcommand{\subSetName}{}
\newcommand{\subCrefNameSet}{\renewcommand{\subSetName}{子}}
\crefname{subfigure}{\subSetName 图}{\subSetName 图}
\crefname{subtable}{\subSetName 表}{\subSetName 表}
\crefname{subequation}{\subSetName 式}{\subSetName 式}
\crefname{subalgorithm}{\subSetName 算法}{\subSetName 算法}
% \newcommand{\subFigSet}[1]{
%   \ifthenelse{\equal{#1}{图}}
%   {\crefname{subfigure}{图}{图}
%   }
%   {\ifthenelse{\equal{#1}{子图}}
%     {\crefname{subfigure}{子图}{子图}
%     }
%     {\typeout{无效的输入，请使用图或子图参数} % 如果既不是A也不是B，则输出错误信息在log文件中
%     }
%   }
% }
% \newcommand{\subTabSet}[1]{
%   \ifthenelse{\equal{#1}{表}}
%   {\crefname{subtable}{表}{表}
%   }
%   {\ifthenelse{\equal{#1}{子表}}
%     {\crefname{subtable}{子表}{子表}
%     }
%     {\typeout{无效的输入，请使用表或子表参数} % 如果既不是A也不是B，则输出错误信息在log文件中
%     }
%   }
% }
% \newcommand{\subEqSet}[1]{
%   \ifthenelse{\equal{#1}{式}}
%   {\crefname{subequation}{式}{式}
%   }
%   {\ifthenelse{\equal{#1}{子式}}
%     {\crefname{subequation}{子式}{子式}
%     }
%     {\typeout{无效的输入，请使用式或子式参数} % 如果既不是A也不是B，则输出错误信息在log文件中
%     }
%   }
% }
% \newcommand{\subAlgSet}[1]{
%   \ifthenelse{\equal{#1}{算法}}
%   {\crefname{subalgorithm}{算法}{算法}
%   }
%   {\ifthenelse{\equal{#1}{子算法}}
%     {\crefname{subalgorithm}{子算法}{子算法}
%     }
%     {\typeout{无效的输入，请使用算法或子算法参数} % 如果既不是A也不是B，则输出错误信息在log文件中
%     }
%   }
% }

% ===============定义定理等引用样式设置=============== cleveref 宏包
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{lemma}{引理}{引理}
\crefname{definition}{定义}{定义}
\crefname{example}{例子}{例子}
\crefname{proposition}{命题}{命题}
\crefname{assertion}{断言}{断言}
\crefname{assumption}{假设}{假设}
\crefname{agreement}{协议}{协议}

% ===============图表字体设置===============
\AtBeginEnvironment{table}{\small}  						 % 表格字体小五
\AtBeginEnvironment{tabular}{\small}                         % 表格字体小五
\AtBeginEnvironment{tabular*}{\small}                        % 表格字体小五


% ===============图表浮动体设置===============
\AtBeginEnvironment{figure}{\def\@floatboxreset{\centering}} % 让图环境的内容居中
\AtBeginEnvironment{table}{\def\@floatboxreset{\centering}}  % 让表格环境的内容居中


% ===============表格中的线宽间距设置===============
\setlength{\heavyrulewidth}{0.9pt}                % 设置booktab宏包中 \toprule 和 \bottomrule 的粗细
\setlength{\lightrulewidth}{0.5pt}                % 设置表格中 \midrule 的粗细，
\setlength{\arrayrulewidth}{0.5pt}                % 设置表格中垂直线的粗细
\setlength{\cmidrulewidth}{0.5pt}                 % 设置booktab宏包中 \cmidrule 的粗细
\setlength{\extrarowheight}{2pt}                  % 设置表格中每一行的额外高度 array 宏包

% =============== tabularray设置===============
\SetTblrStyle{caption}{font=\small} % 设置标签和标题文本字体大小为small体
\SetTblrStyle{note}{font=\footnotesize} % 设置表格脚注字体大小为footnotesize

% =============== 自定义三线表格式 ===============
\NewTblrEnviron{threetab}  % 自定义三线表环境 threetab
\SetTblrInner[threetab]{
		hline{1,Z} = {-}{0.9pt}, % 设置头线和尾线为1.5pt
		hline{2} = {-}{0.5pt},   % 设置中线 0.5pt
		row{1} = {font=\small\bfseries}, % 表头加粗
		row{2-Z} = {font=\small\selectfont} % 设置表中所有文字大小为 \small，\selectfont显式声明字体切换
	}
% =============== 自定义跨页表格式 ===============
\DeclareTblrTemplate{contfoot-text}{default}{续下页} % 设置 longtable 跨页表格续页脚注文字
\DeclareTblrTemplate{conthead-text}{default}{（续）}
\SetTblrStyle{contfoot}{font=\footnotesize}

\SetTblrInner[longtblr]{
		hline{1,Z} = {-}{0.9pt}, % 设置头线和尾线为1.5pt
		hline{2} = {-}{0.5pt},   % 设置中线 0.5pt
		row{1} = {font=\small\bfseries}, % 表头加粗
		row{2-Z} = {font=\small\selectfont} % 设置表中所有文字大小为 \small，\selectfont显式声明字体切换
	}

% =============== 自定义脚注表格格式 ===============
\SetTblrInner[talltblr]{
		hline{1,Z} = {-}{0.9pt}, % 设置头线和尾线为1.5pt
		hline{2} = {-}{0.5pt},   % 设置中线 0.5pt
		row{1} = {font=\small\bfseries}, % 表头加粗
		row{2-Z} = {font=\small\selectfont} % 设置表中所有文字大小为 \small，\selectfont显式声明字体切换
	}

% =============== 自定义列表环境 ===============
\newlist{nienumerate}{enumerate}{1} % 定义新的列表环境，名为 nienumerate 意为 noindent enumerate
\setlist[nienumerate]{label=（\arabic*）,leftmargin=0pt,itemindent=4.5em,labelsep=0pt} % 设置列表样式

% //////////////////////////////////////// enumitem环境设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\AddEnumerateCounter*{\chinese}{\zhnumber}{\arabic} % enumitem 中文编号设置
% \setlist{noitemsep} % noitemsep 会删除项目和段落之间的空格（即 itemsep=0pt 和 parsep=0pt），而 nosep 则删除所有垂直间距。
\setlist{nosep} % 仅启用 nosep 即可，移除垂直额外间距



% //////////////////////////////////////// 算法设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ====================算法栏====================
\newcommand{\theAlgoSet}[1]{
	\ifthenelse{\equal{#1}{algorithm2e}}
	{
		\theAlgoSetIn{algorithm2e}
		\SetAlgorithmName{算法}{算法}{算法列表}
		\renewcommand\thealgocf{\arabic{chapter}-\arabic{algocf}}
		\SetAlgoCaptionSeparator{\null}
	}
	{\ifthenelse{\equal{#1}{algorithmicx}}
		{
			\theAlgoSetIn{algorithmicx}
			\renewcommand{\thealgorithm}{\arabic{chapter}-\arabic{algorithm}} % 算法编号格式设置为 x-x，满足原始模板要求
		}
		{
			\typeout{无效的输入，请使用algorithm2e或algorithmicx参数。} % 如果既不是A也不是B
		}
	}
}
\AtBeginEnvironment{algorithm}{\vspace{9pt}}
\AfterEndEnvironment{algorithm}{\vspace{9pt}}



% //////////////////////////////////////// 定理定义设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\heiti}{}{ }{}
\theoremstyle{dotless} % plain（默认样式）：定理名称是正体，定理内容是斜体。definition：定理名称和定理内容都是正体。remark： 定理名称是斜体，定理内容是正体


\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}[theorem]{公理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{例子}
\newtheorem{proposition}[theorem]{命题}
\newtheorem{assertion}[theorem]{断言}
\newtheorem{assumption}[theorem]{假设}
\newtheorem{agreement}[theorem]{协议}
\newtheorem{scheme}[theorem]{方案}
% \newtheorem{环境名} [计数器名] {标题} [排序单位]
% 环境名 给所定义的定理类环境起的名称, 它不得与现有环境重名, 否则系统将提示出错。每定义一个环境名, 系统就会自动创建一个同名的计数器, 用于为所定义的定理类环境排序。
% 计数器名 可选参数, 如果希望所定义的定理类环境与已定义的某个定理类环境混合排序,就可在其中填写该环境的计数器名, 也就是该定理类环境的环境名;如果省略这个可选参数, 则表示本定理类环境单独排序。
% 标题 用于设置定理类表达式的标题, 如theorem定理， 证明和引理等。
% 排序单位 可选参数, 用于设定排序单位, 如果是chapter, 则每一新章开始时所定义定理类环境的计数器清零; 该可选参数的默认值是以全文为排序单位

\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\theproposition}{\arabic{chapter}.\arabic{proposition}}
\renewcommand{\theassertion}{\arabic{chapter}.\arabic{assertion}}
\renewcommand{\theassumption}{\arabic{chapter}.\arabic{assumption}}
\renewcommand{\theagreement}{\arabic{chapter}.\arabic{agreement}}
\renewcommand{\thescheme}{\arabic{chapter}.\arabic{scheme}}
% \renewcommand{\qedsymbol}{$\blacksquare$} %结束符，\blacksquare实心方框，\square空心方框

\renewcommand{\proofname}{证明}
% 定义该模板的证明环境格式

% \renewenvironment{新环境名称}[参数个数][参数默认值]{开始部分定义}{结束部分定义}
\renewenvironment{proof}[1][\proofname]{\par
	\pushQED{\qed} % 这里 \pushQED{\qed} 把 \qed 压入了 QED 这个堆栈，然后在环境结束的地方，通过 \popQED把压入堆栈的最后一个元素弹出来。
	\normalfont % 正体
	\topsep0pt \partopsep0pt
	\trivlist
	\item[\hskip5\labelsep
			\heiti
			#1\@addpunct{:}]\ignorespaces % \proofname后面:
} % 开始部分定义
{
	\popQED\endtrivlist\@endpefalse
} % 结束部分定义



% \noindent表示proof没有缩进，\it表示proof斜体
% \quad表示\proofname后面空四个空格，\hfill表示右对齐，\square表示方框，\par表示结尾空一段.

\AtBeginDocument{ % 调整公式间距
	\setlength{\abovedisplayskip}{4pt} % 设置公式上方的距离
	\setlength{\belowdisplayskip}{4pt} % 设置公式下方的距离
	\setlength{\belowdisplayshortskip}{4pt} % 设置短公式下方的距离
	\setlength{\abovedisplayshortskip}{4pt} % 设置短公式上方的距离
}




% //////////////////////////////////////// 参考文献设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% ====================解决学位论文显示url的问题====================
\DeclareStyleSourcemap{
	\maps[datatype=bibtex]{
		\map[overwrite]{
			\pertype{thesis}
			\step[fieldset=editora,null]
			\step[fieldset=editoratype,null]
		}
	}
}
% thesis 没有地址又有url会识别为online，所以false会失效，所以用上述代码补上。这样的话就都有url了，就不会因为没有url而显示 “In collab. with” 的问题了。


% ====================参考文献设置====================
\newcommand{\ThesisBibResource}[1]{\addbibresource[location=local]{#1}}               % 定义 \ThesisBibResource 命令用于加载参考文献源
\renewcommand{\bibfont}{\small}                                                       % 设置参考文献字体小五
\setlength{\bibitemsep}{0pt}                                                          % 每一条参考文献之间的间隔
% \AtEveryBibitem{\clearfield{url}}                                                     % 清除url信息 用以解决 url=false 命令在 thesis 中失效的 Bug，但是会导致 @online 类型文献的 url 显示失败
\newcommand{\ThesisBibliography}{
	\newpage
	\fancyhf{}
	\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 参考文献}
	\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	\printbibliography[heading=bibintoc,title=参考文献]
}  % 自定义参考文献命令，bibintoc 目录中显示参考文献




% //////////////////////////////////////// 致谢设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\newcommand{\ThesisAcknowledgement}
{
	\ifbversion{ % 盲审 则致谢命令为空

	}{ % 非盲审则存在致谢
		\ifbachelor{ % 本科致谢设置 👇
			\renewcommand{\BachelorChapterFormat}{\centering}     % 通过修改\BachelorChapterFormat命令让致谢居中
			\chapter{\texorpdfstring{谢\quad 辞}{谢 辞}}
		}{ % 硕博致谢设置 👇
			\chapter{\texorpdfstring{致\quad 谢}{致 谢}}
		}

		\fancyhf{}
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 致\quad 谢}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
		\thispagestyle{fancy}
		\normalsize                                             % 设置字体为小四
		\input{Chapters/Thanks.tex}                             % 致谢文档位置
		\ifbachelor{ % 一级标题还原默认设置 👇
			\renewcommand{\BachelorChapterFormat}{}
		}{}
	}
}

\newcommand{\ThesisContent}
{
	\cleardoublepage
	\thispagestyle{empty}
	\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
	\StandardHeader
}

\pretocmd{\@chapter}
{
	\ifdefined\@BODY
	\else
		\ifnum\value{chapter}=0
			\ThesisContent
		\fi
	\fi
}{}{}




% //////////////////////////////////////// 攻读学位期间取得成果设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% % ====================设置作者粗体标识====================
% \newtoggle{bbx:gbtype} % 定义新开关
\renewcommand*{\mkbibnamegiven}[1]{% 将名字设置为粗体
	\ifitemannotation{thesisauthor}
	{\textbf{#1}}%
	{#1}\ifitemannotation{corresponding}{\textsuperscript{*}}{}%
}

\renewcommand*{\mkbibnamefamily}[1]{% 将姓氏设置为粗体
	\ifitemannotation{thesisauthor}
	{\textbf{#1}}
	{#1}}


% ====================解决专利显示patent的问题====================
\DeclareStyleSourcemap{
	\maps[datatype=bibtex]{
		\map[overwrite]{
			\pertype{patent}
			\step[fieldset=holder,null]             % holder设置为 null
			\step[fieldset=type,null]               % 类型设置为 null
			\step[fieldset=institution,null]        % 机构设置为 null
			\step[fieldset=location, fieldvalue={}] % 地点设置为 {} ，null有问题
		}
	}
}


% ====================自定义新盒子====================
\newtcolorbox{Achbox}{      						% 自定义盒子为无边框，整体缩进2em
	colback=white,          						% 背景颜色
	colframe=white,         						% 边框颜色
	arc=0pt,                						% 圆角
	boxsep=0pt,             						% 内容和边框的距离
	left=2em,               						% 左侧页边距
	right=0pt,              						% 右侧页边距
	top=0pt,                						% 顶部页边距
	bottom=0pt,             						% 底部页边距
	boxrule=0pt,            						% 边框宽度
	breakable,              						% 允许跨页
}

% ====================取得成果设置==================== 定义攻读学位期间取得成果命令
\newcommand{\AchResource}{\quad}                                                           % 定义cls中引用成果源命令
\newcounter{NunAchType}                                                                    % 定义新计数器 NunAchType
\newcommand{\ThesisAchResource}[1]{\renewcommand{\AchResource}{#1}}                        % 定义添加成果源命令
\defbibheading{AchHeadStyle}[\bibname]{                                                    % 自定义title样式
	\hspace*{-2em}                                                                         % 向左缩进2em
	\normalsize                                                                            % 字体小四
	\stepcounter{NunAchType}                                                               % 计数器累加
	\zhnumber{\arabic{NunAchType}}、#1                                                     % 应用计数器，显示为：汉字数字、标题
}

% \newcommand{\ThesisAchievement}{
%   \addtocontents{toc}{\protect\setcounter{tocdepth}{0}} % 只显示一级标题
%   \setcounter{section}{0} % section计数器清零 

%   \chapter*{攻读\DegreeName{}学位期间取得的成果}
%   \addcontentsline{toc}{chapter}{攻读\DegreeName{}学位期间取得的成果}
%   \fancyhf{}
%   \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 攻读\DegreeName{}学位期间取得的成果}
%   \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
%   \thispagestyle{fancy}
%   \normalsize  % 设置字体为小四
%   \ifbversion{ % 盲审版学术成果👇
%     \input{Chapters/Accomplish-bversion.tex} % 学术成果文档位置
%   }{ % 非盲审版学术成果👇
%     \input{Chapters/Accomplish.tex}
%   }

% }

\newcommand{\ThesisAchievement}{                                                        % section计数器清零 

	\chapter{攻读\DegreeName{}学位期间取得的成果}
	\fancyhf{}
	\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 攻读\DegreeName{}学位期间取得的成果}
	\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	\thispagestyle{fancy}

	\ifbversion{ % 盲审版学术成果👇
		\normalsize  % 设置字体为小四
		\input{Chapters/Accomplish-bversion.tex} % 学术成果文档位置
	}{ % 非盲审版学术成果👇

		% 定义一个可复用的命令来设置名字格式
		\newcommand{\setupFamilyGivenFormat}{%
			% 局部重新定义名字格式
			\DeclareNameFormat{family-given}{%
				\usebibmacro{name:family-given}
				{\namepartfamily}
				{\namepartgiven}
				{\namepartsuffix}
				{\namepartprefix}%
			}%
			\renewcommand*{\revsdnamepunct}{\space}   % 将姓和名之间的分隔符换成空格
			\DeclareNameAlias{default}{family-given}  % 姓在前，全名
		}

		\defbibfilter{PublishPaper}{
			type=article
			or type=inproceedings
			or type=book
			or type=inbook
		}                                                                                      % 定义筛选器用于打印期刊论文、会议、专著和专著部分篇章

		\renewcommand{\bibfont}{\normalsize}                                                   % 设置参考文献字体小四
		\begin{refsection}[\AchResource]
			\nocite{*}
			\settoggle{bbx:gbtype}{false}                                                      % 局部设置不输出文献类型和载体标识符
			\settoggle{bbx:gbannote}{true}                                                     % 局部设置输出附加的annote/annotation信息
			\settoggle{bbx:gbpub}{false}                                                       % 局部设置不输出出版信息
			\begin{Achbox}
				\printbibliography[heading=AchHeadStyle,type=report ,title=参与项目：]
			\end{Achbox}
		\end{refsection}
		% \begin{refsection}[\AchResource]                                                     % 使用此项请注释下面的发表会议论文和发表期刊论文
		%   \nocite{*}
		%   \def\blx@maxbibnames{5}                                                            % 局部调整作者数量
		%   \settoggle{bbx:gbannote}{true}
		%   \begin{Achbox}
		%     \printbibliography[heading=AchHeadStyle,filter=PublishPaper,title=发表论文：]
		%   \end{Achbox}
		% \end{refsection}
		\begin{refsection}[\AchResource]
			\nocite{*}
			\def\blx@maxbibnames{5}                                                            % 局部调整作者数量
			\settoggle{bbx:gbannote}{true}
			\setupFamilyGivenFormat                               
			\begin{Achbox}
				\printbibliography[heading=AchHeadStyle,type=inproceedings,title=发表会议论文：]
			\end{Achbox}
		\end{refsection}
		\begin{refsection}[\AchResource]
			\nocite{*}
			\def\blx@maxbibnames{5}                                                            % 局部调整作者数量，控制显示个数
			\settoggle{bbx:gbannote}{true}
			\setupFamilyGivenFormat
			\begin{Achbox}
				\printbibliography[heading=AchHeadStyle,type=article,title=发表期刊论文：]
			\end{Achbox}
		\end{refsection}
		\begin{refsection}[\AchResource]
			\nocite{*}
			\def\blx@maxbibnames{5}
			\settoggle{bbx:gbannote}{true}
			\setupFamilyGivenFormat
			\begin{Achbox}
				\printbibliography[heading=AchHeadStyle,type=patent,title=发明专利：]
			\end{Achbox}
		\end{refsection}
		\begin{refsection}[\AchResource]
			\nocite{*}
			\settoggle{bbx:gbannote}{true}
			\setupFamilyGivenFormat
			\begin{Achbox}
				\printbibliography[heading=AchHeadStyle,type=software,title=软件著作权：]
			\end{Achbox}
		\end{refsection}
		\begin{refsection}[\AchResource]
			\nocite{*}
			\settoggle{bbx:gbtype}{false}
			\settoggle{bbx:gbannote}{true}
			\setupFamilyGivenFormat
			\begin{Achbox}
				\printbibliography[heading=AchHeadStyle,type=misc,title=科研竞赛获奖：]
			\end{Achbox}
		\end{refsection}
	}
}



% ====================隐藏参与项目、软件著作权和科研竞赛姓名====================
% 这里需要和AchResource的顺序设置保持一致，如果使用PublishPaper而注释掉期刊和会议论文，则需要调整全部的refsection序号，按照需求调节即可
\AtEveryBibitem{                              % 清除指定refsection环境中的作者姓名或页码
	\ifnumequal{\value{refsection}}{1}        % 判断 当前refsection序号是否是为1（项目信息），因为项目参与者过多，不显示作者信息
	{\clearname{author}}                      % 是则清除作者信息
	{}                                        % 否则不执行操作
	\ifnumequal{\value{refsection}}{2}        % 判断 当前refsection序号是否是为2（会议论文），因为会议论文不需要页码
	{\clearfield{pages}}                      % 是则清除页码信息
	{}                                        % 否则不执行操作
	\ifnumequal{\value{refsection}}{5}        % 判断 当前refsection序号是否是为5（软著），可以自选，是否需要作者信息
	{\clearname{author}}                      % 是则清除作者信息
	{}                                        % 否则不执行操作
}




% //////////////////////////////////////// 附录设置 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\newcommand{\ThesisAppendix}
{ %附录格式设置 👇
	\newpage
	\appendix
	\interlinepenalty=0
	\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
	\titleformat{\chapter}[block]
	{\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{\thechapter}{7.5pt}{}
	\renewcommand{\thechapter}{附录\Alph{chapter}}
	\renewcommand{\appendixname}{附录}


	\renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
	\renewcommand{\theequation}{\alph{chapter}-\arabic{equation}}
	\renewcommand{\thetable}{\alph{chapter}-\arabic{table}}
	\renewcommand{\thefigure}{\alph{chapter}-\arabic{figure}}
	\renewcommand{\thetheorem}{\alph{chapter}.\arabic{theorem}}
	\renewcommand{\theaxiom}{\alph{chapter}.\arabic{axiom}}
	\renewcommand{\thecorollary}{\alph{chapter}.\arabic{corollary}}
	\renewcommand{\thelemma}{\alph{chapter}.\arabic{lemma}}
	\renewcommand{\thedefinition}{\alph{chapter}.\arabic{definition}}
	\renewcommand{\theexample}{\alph{chapter}.\arabic{example}}

	\fancyhf{}
	\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 附\quad 录}
	\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	\thispagestyle{fancy}
	\normalsize                                             % 设置字体为小四
}

\newcommand{\ThesisSingleAppendix}
{
	\newpage
	\appendix
	\interlinepenalty=0
	\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
	\titleformat{\chapter}[block]
	{\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{附\quad 录}{7.5pt}{}
	% \renewcommand{\thechapter}{附\quad 录}

	\renewcommand{\appendixname}{附录}

	\renewcommand{\thesection}{A.\arabic{section}}

	\renewcommand{\theequation}{a-\arabic{equation}}
	\renewcommand{\thetable}{a-\arabic{table}}
	\renewcommand{\thefigure}{a-\arabic{figure}}
	\renewcommand{\thetheorem}{a.\arabic{theorem}}
	\renewcommand{\theaxiom}{a.\arabic{axiom}}
	\renewcommand{\thecorollary}{a.\arabic{corollary}}
	\renewcommand{\thelemma}{a.\arabic{lemma}}
	\renewcommand{\thedefinition}{a.\arabic{definition}}
	\renewcommand{\theexample}{a.\arabic{example}}
	

	\chapter{\texorpdfstring{附\quad 录}{附录}}
	\markboth{附\quad 录}{附\quad 录}

	\fancyhf{}
	\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 附\quad 录}
	\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	\thispagestyle{fancy}
	\normalsize                                             % 设置字体为小四

}




\endinput