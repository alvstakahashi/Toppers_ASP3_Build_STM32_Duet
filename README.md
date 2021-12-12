# Toppers_ASP3_Build_STM32_Duet
TOPPERS学習ボード用の環境です    arm64マシン用<br>
What is this? 概要<br>
TOPPERS学習ボード用に開発環境を手軽に設定できるものです。<br>
ビルドするための手順をDockerで記載しました。<br>
dockerビルドするだけで、環境構築もカーネルのビルドも完了します。<br>

仕様<br>
対象ボード　STM32F401RE nucleo-64  (CortexM4Fになります。)<br>
対象TOPPERSカーネル　TOPPERS/ASP3<br>
コンテナで動作するOS　ubuntu 20.04 arm64 <br>
利用可能なツール　arm tool chain および　st-flash<br>
開発環境のみは以下のDockerイメージになります。<br>
https://hub.docker.com/r/alvstakahashi/stmtoolchainforduet/tags <br>

環境の前提条件<br>
Windows10 64bit Docker Desktop インストール済み<br>
arm Chromebook <br>
lenovo duetで確認済み<br>

利用手順<br>
1.Dockerビルドします。<br>
　本gitのルートのDockerfileが置かれたディレクトリで以下を実行します。<br>
　powershell で実行します。<br>
　
　ps> docker build -t aspbuild .  <br>
　
　以上で　TOPPERS/ASPのビルドが終わりました。<br>
2.ビルドの終わった環境を確認する。<br>
　同じく　powershellで以下を実行します。<br>
　本gitのルートの.devcontainer が置かれたディレクトリで以下を実行します。<br>
　>docker run -it --rm -v ${PWD}:/source aspbuild   <br>
　
　実行するとシェルが立ち上がっています。<br>
　root@e25ce2665f1b:/home/toppers#  <br>

　Qemuで実行します。(Cortex-A9（Zynq-7000）で確認します。) <br>
　# cd asp3_3.5/obj<br>
　# make runq<br>
　停止は　CTRL A と　そのあとX を押します<br>

謝辞<br>
以下のサイトを丸写しではなく大変参考にさせていただきました。<br>
ありがとうございます。<br>

TOPPERS向けQEMUをmacOSでビルドして動かす<br>
https://qiita.com/takasehideki/items/6178d6a6da5f0a7196f1 <br>
@takasehideki　様 <br>

TOPPERS/ASP3をQEMUで動作させ <br>
https://qiita.com/exshonda/items/bab3921161919feaba6f <br>
@exshonda(TOPPERSプロジェクト)　様 <br>

ARM版Chromebook Linux環境へのHomebrew導入手順 <br>
https://remoteroom.jp/diary/2020-10-17/ <br>
おおくぼまさひこ　様 <br>

QEMUコンパイルガイド <br>
https://www.codetd.com/ja/article/12543267 <br>
コードワールド様 <br>


以上<br>
