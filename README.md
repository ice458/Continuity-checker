# Continuity-checker:抵抗値で音程の変わる導通チェッカー  
これはセミコンジャパン2023で行われる[ミニマルファブ設計コンテスト](https://www.anagix.com/nyusu/%E3%82%BB%E3%83%9F%E3%82%B3%E3%83%B3%E3%82%B8%E3%83%A3%E3%83%91%E3%83%B32023%E3%81%AB%E5%90%91%E3%81%91%E3%81%9F%E3%83%9F%E3%83%8B%E3%83%9E%E3%83%AB%E3%83%95%E3%82%A1%E3%83%96%E8%A8%AD%E8%A8%88%E3%82%B3%E3%83%B3%E3%83%86%E3%82%B9%E3%83%88%E9%96%8B%E5%82%AC)への応募作品です。  

測定対象の抵抗値によって、ブザーの音程が変化する導通チェッカーです。発振回路の出力をTフリップフロップで分周し、BTL出力として外部の圧電スピーカーを駆動します。  
![レイアウト](/image/gds.png)  
## 回路の動作原理  
この回路はノードpとGND間に測定対象を接続した状態で動作します。  
発振の原理は次の通りです。まず、積分用キャパシタに定電流源で充電を行います。充電電圧がシュミットトリガインバータの閾値に達するとPMOS SWがONし、キャパシタの電荷をリセットします。この繰り返しで発振をします。測定対象の抵抗値が変わると充電電流が変化するため、発振周波数が変化します。  
この発振器の出力のデューティー比は50%からほど遠いため、Tフリップフロップによって分周することで整形しています。50%のデューティー比とBTL出力の効果により、ブザーの音量を大きくできることを期待しています。  
電源電圧はコイン型リチウム電池を想定して3Ｖとしました。　　
![回路構成](/image/test1.png)  
![テストベンチ](/image/test1_tb.png)  
## 作品のポイント  
この作品は、コンテストで使えるトランジスタをすべて使うとどのようなことができるだろうかという考えで設計しました。配線がML1層しか使えない中、フリップフロップのような複雑な回路をどうレイアウトするかという面白さと、回路を動かしたときの実用面での面白さを出せるよう工夫しました。  
## LVSを通すために  
この作品は、配線にML1層しか使えない制約をクリアするために電源用のパッドを複数使用しています。そのため電源が1か所しかない回路図との整合が取れず、LVSを通すことができません。そこで下図のように一時的にチップの外部に電源配線を作り、すべての電源パッドを接続することでLVSを通す必要があります。  
![LVSを通すための仮配線](/image/gds_lvs.png)  
## ピン配置  
| ピン番号 | ピン名 | 機能 |
| ---- | ---- | ---- |
| 4 | GND | 電源 |
| 5 | VDD | 電源 |
| 6 | GND | 電源 |
| 7 | VDD | 電源 |
| 12 | OUT1 | 音声出力 |
| 13 | OUT2 | 音声出力 |
| 17 | GND | 電源 |
| 18 | VDD | 電源 |
| 21 | GND | 電源 |
| 23 | VDD | 電源 |
| 25 | GND | 電源 |
| 26 | VDD | 電源 |
| 27 | GND | 電源 |
| 28 | P | 測定端子 |
## 感想  
今回は貴重なご機会をいただけて大変うれしく思っております。コンテストに参加させていただいたことで、ミニマルファブには少量生産や教育用途において非常に大きなポテンシャルがあると感じました。今後の発展を期待しております。  

--追記--  
審査員特別賞をいただくことができました。感謝申し上げます。  
↓製造していただいた実チップの写真です。  
![製造していただいた実チップ](/image/chip.JPG)  
# License
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)  
