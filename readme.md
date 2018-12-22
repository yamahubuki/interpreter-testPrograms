# BASIC Parser Test Programs

## 概要

- ３年次後期選択科目「実践的プログラミング」で作成するBASIC言語のインタプリタをテストするためのBASICプログラムです。
- 基本的にはSTEP2のSyntaxAnalyzer以降を対象に設計しています。
　(STEP1でも利用できますが、STEP1ではもっと効率的なテストが１ファイルでできるでしょう。)
- 一応テスト目安を示しますが、テストプログラム、正常動作結果共に正確性・網羅性を保証するものではありません。
- 不足や間違いがあれば、皆様からのPullRequestを歓迎します。
- 随時更新し、以下で配布します。
	- https://github.com/Yuki-Kochi/interpreter-testPrograms

## 使い方

- mainクラスでargsからファイル名を受け取れるようにしたうえで、番号順にお使いください。
- STEP2のSyntaxAnalyzerの方は、ファイル名に「-2」などとハイフンのついた枝番号が含まれるファイルは
　飛ばしてください。(これらは、中の数字が違うだけで、SyntaxAnalyzerのテストとしてほぼ無意味だからです。)
- STEP3の方は、全てのファイルを順に確認する事でできるだけパターン(たとえばIF・IFELSE・ELSE)が網羅できるようにしてあるつもりです。
- STEP3の方は、正常動作結果の記載のないファイルは飛ばしてください。

## 前提

- 水平タブ(\t)とCR(\r)は読み飛ばす。
- 文法規則上<NL>の記述のある個所では、複数個のNLを許容する。
- ELSE文直前など、StmtListと他の要素の間には<NL>があるものとして考える。
　(これは、文法記述が不完全なんじゃねえかと考えている)
- <ELSE_BLOCK>では、文法記述にはないがφを許容する。
　(ELSEが義務とかありえねえだろう！というこのテストパターン作成者の考えによる)
- \n・\r・\"・\'の４種のエスケープシーケンスが利用できる。

## 各テストプログラムとその狙い・正常動作結果

1.基本の基本

- 中身は「END」のみ。
- program→StmtList→Stmt→ENDが正しくたどれる事、EOFで処理を終了できる事の確認。

2.NL対応

- StmtListはNLを許容する。
- ここでは、前後にNLを挟んでENDが記述してある。

3.複数のStmt

- StmtListで無限ループし、複数の要素(ここでは全てEND)を取得・表示できる事の確認

4.代入文

- もっとも単純な変数aに整数を代入する処理の確認

5. Hello World

- stmtからの関数呼出によりprint文が実行できる事の確認
- \nを改行文字として表示できるようエスケープ処理が出来ている事の確認
- 表示結果
	- Hello
	- World

6.様々な要素の代入文とその結果表示

- 整数・少数・リテラル・変数を、左辺で指定した変数に代入する処理の確認。
- その結果をprint関数で正しく表示できる事を確認。
- 表示結果
	- 1
	- 2.3
	- あいうえお
	- 1

7.関数呼出しの確認

- 架空の関数myfunction(void)からの値を変数に代入する文を正しく解釈できている事の確認
- このファイルはSTEP2のみで、、実行は不可。

8.関数呼出しのネストの確認

- 架空の関数myfunction()からさらに架空の関数をネストして呼び、結果の値を変数に代入する文を正しく解釈できている事の確認
- このファイルはSTEP2のみで、、実行は不可。

9.複数の引数を持つ関数

- ExprListが正しく実装され、カンマ区切りの複数の引数を持てる事の確認。
- このファイルはSTEP2のみで、、実行は不可。

10.単純なIF文

- IFが正しく実装され、改行なしで１つのStmtを持つタイプのIF文が正しく解釈できる事の確認。
- 10-4では、文字列の比較が正しく実装されている事の確認。もし「あ」や「か」が出力されている場合、文字列をJavaの==や!=演算子で比較してしまっている可能性が高い。
- 実行結果
	- 10
		- 10
	- 10-2
		- "1"と1が=だと考える方は10、
		- そう考えない方は1。
	- 10-3
		- 2
	- 10-4
		- い
		- き

11.ELSEのあるIF文

- 改行を挟まず、trueの場合とELSEの場合で各１個ずつのstmtを持つIF文を正しく解釈できている事の確認
- 実行結果
	- 11
		10
	- 11-2
		11

12.ブロックを含むIF文

- 条件の後で改行し、StmtListを持つIf文が正しく解釈できる事の確認。
- 実行結果
	- 12
		11
	- 12-2
		1

13.ELSEブロックを含むIF文

- trueの場合、ELSEの場合でそれぞれStmtListを含むIF文を正しく解釈できる事の確認。
- 実行結果
	- 13
		- 30
	- 13-2
		- 10

14 ELSEIFを含むIF文

- IF〜ELSEIF〜ELSEを正しく処理できる事の確認
- 実行結果
	- 14
		60
	- 14-2
		30
	- 14-3
		10

15.WHILE文

- WHILE文が正しく処理できる事の確認
- 実行結果
	- 15
		- 0
		- 1
		- 2
		- 3
		- 4
		- END!
	- 15-2
		- END!

16.FOR文

- FOR文を正しく解釈できる事の確認
- 実行結果
	- 16
		Hello World
		Hello World
		Hello World
		Hello World
	- 16-2
		END!

17.前判定のDO WHILE文
18.前判定のDO UNTIL文
19 後判定のDO WHILE文
20 後判定のDO UNTIL文

- それぞれの文が正しく解釈できている事の確認
- 実行結果
	- 17
		11
	- 18
		11
	- 19
		20
	- 20
		21

21.カッコ・優先順位のない多項式の計算

- カッコのない多項式の加減乗除を正しく解釈・計算できている事の確認。
- 式の左から順に計算すれば正しい答えを得られるテストケースとなっている。
- 21では、-1のような負数を扱う。このパターンだけがうまくいかない場合、ExprNodeで-から始まる数を正しく処理できているか確認するとよい。
- 実行結果
	- 21
		- -4
	- 21-2
		- 1
	- 21-3
		- 3.2
	- 21-4
		- 5.0

22. 式の優先順位を考慮した計算

- 加減乗除が混ざっており、優先順位を考える必要のある式を正しく解釈・計算できる事の確認。
- 実行結果
	- 44

23.カッコのある式の計算

- カッコと演算の優先順位を考えながら正しく式を解釈・実行できる事の確認。
- 実行結果
	4
