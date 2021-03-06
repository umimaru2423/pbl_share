# FROM: ベースイメージの指定
# 元となるイメージを名前で指定する
FROM python:3.9-alpine

# OS に必要なパッケージのインストール
# git はコードをクローンするのに必要
# g++ と musl-dev は SQLAlchemy を使った人だけ必要
RUN apk add git 

# コードを落としてくる
# HTTPS を使わないと怒られるので注意
RUN git clone https://github.com/umimaru2423/pbl_share.git myapp

# myapp ディレクトリに移動
WORKDIR myapp

# 必要なライブラリのインストール
RUN pip install flask 

# アプリケーションの起動
# ここでは flask コマンドを使ったけど、
# app.run(host='0.0.0.0', port=5000, debug=True)
# みたいにコード内でやってもよい
# （その場合は変更したコードを GitHub に push しておく必要あり）
CMD ["python","app.py"]